import os
import hashlib
import json
import errno

from commands import Commands, Command
from download import HtmlDocument, Url

CACHE_DIR = os.path.sep.join(['', 'tmp', 'searchcmd'])
try:
    os.makedirs(CACHE_DIR)
except OSError:
    pass


def get(**args):
    try:
        with open(get_file_name(**args)) as inp:
            return json.load(inp, cls=CustomTypeDecoder)
    except IOError as e:
        if e.errno == errno.ENOENT:
            return None
        raise


def store(commands, **args):
    with open(get_file_name(**args), 'w') as out:
        return json.dump(commands, out, cls=CustomTypeEncoder)


def get_file_name(**args):
    return os.path.join(CACHE_DIR, hashlib.sha1(repr(args.items())).hexdigest())


TYPES = {cls.__name__: cls for cls in [
    Commands, Command, HtmlDocument, Url]}

# TODO: Give credit to stackoverflow answer
class CustomTypeEncoder(json.JSONEncoder):
    """A custom JSONEncoder class that knows how to encode core custom
    objects.

    Custom objects are encoded as JSON object literals (ie, dicts) with
    one key, '__TypeName__' where 'TypeName' is the actual name of the
    type to which the object belongs.  That single key maps to another
    object literal which is just the __dict__ of the object encoded."""

    def default(self, obj):
        if isinstance(obj, tuple(TYPES.values())):
            key = '__%s__' % obj.__class__.__name__
            return {key: obj.to_dict()}
        return json.JSONEncoder.default(self, obj)


class CustomTypeDecoder(json.JSONDecoder):

    def decode(self, s):

        def load_objects(obj):
            if isinstance(obj, list):
                return [load_objects(e) for e in obj]
            elif isinstance(obj, dict):
                if len(obj) == 1:
                    type_name, value = obj.items()[0]
                    type_name = type_name.strip('_')
                    if type_name in TYPES:
                        return TYPES[type_name].from_dict(load_objects(value))
                return {key: load_objects(value)
                        for key, value in obj.iteritems()}
            else:
                return obj

        return load_objects(json.JSONDecoder.decode(self, s))
