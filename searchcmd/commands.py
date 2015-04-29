from collections import Counter

class Command(object):
    
    def __init__(self, cmd, line, idx, doc):
        self.cmd = cmd
        self.lines = [line]
        self.idxs = [idx]
        self.docs = [doc]
        self.domains = Counter({doc.url.domain: 1})
        

    def to_dict(self):
        return {'cmd': self.cmd,
                'lines': self.lines,
                'idxs': self.idxs,
                'docs': self.docs}

    @classmethod
    def from_dict(cls, d):
        cmd = d['cmd']
        merged = None
        for line, idx, doc in zip(d['lines'], d['idxs'], d['docs']):
            inst = cls(cmd, line, idx, doc)
            if merged is None:
                merged = inst
            else:
                merged.add_duplicate(inst)
        return merged

    def __eq__(self, cmd):
        # TODO: More advanced comparison
        return self.cmd == cmd.cmd

    def add_duplicate(self, cmd):
        self.lines.extend(cmd.lines)
        self.idxs.extend(cmd.idxs)
        self.docs.extend(cmd.docs)
        self.domains.update(cmd.domains)

    def echo(self, verbose=False):
        """
        Example output:

        cmd --flag     fromdomain.com, otherdomain.com
        
        Include urls to all sources if verbose:

        cmd --flag     fromdomain.com
            http://fromdomain.com/full/path
         ...

        """
        s = '{}\t{}'.format(self.cmd, ' '.join(
            (d for d,_ in self.domains.most_common(2))))
        if verbose:
            s += '\n {}'.format(
                '\n'.join(['\t{}'.format(doc.url.url) for doc in self.docs]))
        return s

    def score(self, nr_docs):
        nr_docs = float(nr_docs)
        score = 0.0
        for line, doc in zip(self.lines, self.docs):
            score += (1 - line/doc.nr_lines)*(1 - doc.idx/nr_docs)
        return score

    def __repr__(self):
        return '<cmd {}>'.format(self.cmd)


class Commands(object):

    def __init__(self, commands=None, nr_docs=0):
        self.commands = commands or {}
        self.nr_docs = nr_docs

    def add_command(self, cmd):
        if cmd.cmd in self.commands:
            self.commands[cmd.cmd].add_duplicate(cmd)
        else:
            self.commands[cmd.cmd] = cmd

    def rank_commands(self, nr=5):
        cmds = [(cmd.score(self.nr_docs), cmd)
                for cmd in self.commands.itervalues()]
        cmds.sort(reverse=True)
        return [cmd for _, cmd in cmds[:nr]]

    def __iter__(self):
        for command in self.commands.values():
            yield command

    def to_dict(self):
        return {'commands': self.commands,
                'nr_docs': self.nr_docs}

    @classmethod
    def from_dict(cls, d):
        return cls(d['commands'], d['nr_docs'])
