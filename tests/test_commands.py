from unittest import TestCase

from searchcmd.commands import Command, Commands
from searchcmd.download import HtmlDocument


class TestCommands(TestCase):

    def test_commands(self):

        cmds = Commands()
        doc = HtmlDocument('http://example.com', b'', 1)
        cmd = Command('ls', 1, 1, doc)
        cmds.add_command(cmd)
        cmd = Command(u'grep \u201ctest\u2033', 5, 2, doc)
        cmds.add_command(cmd)
        cmd = Command('ls', 22, 3, doc)
        cmds.add_command(cmd)

        cmds.nr_docs = 1

        ranked = cmds.rank_commands()

        self.assertEqual(len(ranked), 2)
        self.assertEqual(ranked[0].cmd, 'ls')

        for cmd in ranked:
            cmd.echo()
            cmd.echo(verbose=True)
            print(repr(cmd))

        cmds = Commands.from_dict(cmds.to_dict())
        for cmd in ranked:
            cmd_copy = Command.from_dict(cmd.to_dict())
            self.assertEqual(cmd_copy, cmd)
