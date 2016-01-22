try:
    from itertools import izip as zip
except ImportError:
    pass

import re
import mock

from unittest import TestCase

from tests.testutils import iter_html_docs, get_html_doc
from searchcmd.download import HtmlDocument
from searchcmd.cmdextract import CommandExtractor, extract_commands


TEST_DATA_DIR = 'cmdextract'

COMMANDS = {
    'http://unixmantra.com': [
        (1254, u'find ./music -name "*.mp3" -print0 | xargs -0 ls'),
        (1258, u'find ./work -print | xargs grep "profit"'),
        (1267,
         'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts'),
        (1306, 'find . -name "*.sh" | xargs grep "ksh"'),
        (1328, 'find /tmp -name "*.tmp" | xargs rm'),
        (1335, 'find /tmp -name "*.tmp" -print0 | xargs -0 rm'),
        (1373, 'mv chap1 chap1.old'),
        (1374, 'mv chap2 chap2.old'),
        (1375, 'mv chap3 chap3.old'),
        (1385, 'ar r lib.a chap1 ?...'),
        (1386, 'ar r lib.a chap2 ?...'),
        (1387, 'ar r lib.a chap3 ?...')],
    'http://brunolinux.com': [
        (62, "sed -i 's/ugly/beautiful/g' /home/bruno/old-friends/sue.txt"),
        (91, ("find /home/bruno/old-friends -type f "
              "-exec sed -i 's/ugly/beautiful/g' {} \\;")),
        (118, u'mv $fl $fl.old'),
        (119, u"sed 's/FINDSTRING/REPLACESTRING/g' $fl.old > $fl"),
        (120, u'rm -f $fl.old'),
        (150, ('perl -e "s/old_string/new_string/g;" '
               '-pi.save $(find DirectoryName -type f)'))],
    'http://cyberciti.biz': [
        (118, 'hwclock -r'),
        (120, 'hwclock --show'),
        (122, 'hwclock --show --utc'),
        (126, 'date -s "2 OCT 2006 18:00:00"'),
        (128, 'date --set="2 OCT 2006 18:00:00"'),
        (130, 'date +%Y%m%d -s "20081128"'),
        (131, 'date +%T -s "10:13:13"'),
        (133, 'date +%T%p -s "6:10:30AM" # date +%T%p -s "12:10:30PM"'),
        (135, 'hwclock --systohc'),
        (137, 'hwclock -w'),
        (158, 'date -s 2007.04.08-22:46+0000'),
        (167, u'date -s \u201c2 OCT 2006 18:00:00\u2033'),
        (217, u'export http_proxy=\u2019http://10.10.1.2:3128\u2032'),
        (234, u'hwclock \u2013show'),
        (235, u'hwclock \u2013systohc'),
        (286, 'date +%Y%m%d -s "20080817"'),
        (354, u'date set=\u201d2 OCT 2006 18:00:00\u2033'),
        (371, u'date -s \u201d2 OCT 2006 18:00:00\u2033'),
        (380, u'date \u2013set=\u201d2 sep 2011 11:27:20\u2033'),
        (412, u'hwclock \u2013systohc'),
        (479, 'date 07252208002009'),
        (623, u'date +%Y%m%d%T -s \u201c20081225 10:05:00\u2033'),
        (704, u'date \u2013set=\u201d2 OCT 2006 18:00:00\u2033'),
        (832, 'for example 23/03/2011 to 23.03.2011'),
        (841, u'hwclock \u2013show'),
        (843, 'ls -l /etc/localtime'),
        (845, 'date 041106232011'),
        (846, u'hwclock \u2013systohc'),
        (847, 'ln -sf /usr/share/zoneinfo/ /etc/localtime'),
        (848, 'vi /etc/sysconfig/clock (update timezone if redhat)'),
        (850, u'hwclock \u2013show'),
        (852, 'ls -l /etc/localtime'),
        (929, 'date 030613252012'),
        (1126, 'uname -a'),
        (1144, u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d'),
        (1161, 'uname -a'),
        (1183, 'date --set="4 JAN 2014 13:25:00"'),
        (1239, (u'python -c \u2018import platform ; '
                u'print platform.dist()[0]\u2019')),
        (1260, u'su \u2013'),
        (1261, 'passwd root'),
        (1301, u'date +%T -s \u201c10:13:13\u2033'),
        (1310, u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d')],
    'http://stackoverflow.com': [
        (5, 'du -h --max-depth=1'),
        (24, 'du -h -s *')]
}

NR_TEXTS = {'http://unixmantra.com': 225,
            'http://brunolinux.com': 47,
            'http://cyberciti.biz': 705,
            'http://stackoverflow.com': 49}

MERGED_COMMANDS = set([
    u'find ./music -name "*.mp3" -print0 | xargs -0 ls',
    'hwclock --show',
    "sed -i 's/ugly/beautiful/g' /home/bruno/old-friends/sue.txt",
    'date --set="2 OCT 2006 18:00:00"',
    'mv chap1 chap1.old',
    u'date +%T -s \u201c10:13:13\u2033',
    'ar r lib.a chap1 ?...',
    'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts',
    u'mv $fl $fl.old',
    'mv chap2 chap2.old',
    'date 07252208002009',
    'date +%T%p -s "6:10:30AM" # date +%T%p -s "12:10:30PM"',
    'find /tmp -name "*.tmp" | xargs rm',
    'du -h --max-depth=1',
    'mv chap3 chap3.old',
    u'date \u2013set=\u201d2 sep 2011 11:27:20\u2033',
    u'date -s \u201d2 OCT 2006 18:00:00\u2033',
    'date +%Y%m%d -s "20081128"',
    'find . -name "*.sh" | xargs grep "ksh"',
    'date 041106232011',
    'ar r lib.a chap3 ?...',
    u'find ./work -print | xargs grep "profit"',
    u'date +%Y%m%d%T -s \u201c20081225 10:05:00\u2033',
    'date -s 2007.04.08-22:46+0000',
    'find /tmp -name "*.tmp" -print0 | xargs -0 rm',
    'date +%T -s "10:13:13"',
    'date --set="4 JAN 2014 13:25:00"',
    u'hwclock \u2013systohc',
    'hwclock --show --utc',
    u'date -s \u201c2 OCT 2006 18:00:00\u2033',
    'hwclock --systohc',
    ("find /home/bruno/old-friends -type f "
     "-exec sed -i 's/ugly/beautiful/g' {} \\;"),
    'date -s "2 OCT 2006 18:00:00"',
    u"sed 's/FINDSTRING/REPLACESTRING/g' $fl.old > $fl",
    'date 030613252012',
    u'date set=\u201d2 OCT 2006 18:00:00\u2033',
    u'hwclock \u2013show',
    'du -h -s *',
    'date +%Y%m%d -s "20080817"',
    'ar r lib.a chap2 ?...',
    u'date \u2013set=\u201d2 OCT 2006 18:00:00\u2033',
    'hwclock -w',
    u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d',
    'hwclock -r'])


ALL_TESTS_COMMANDS = [u'vim', u'vi', u'alias', u'bg', u'bind', u'break', u'builtin', u'caller', u'cd', u'command', u'compgen', u'complete', u'compopt', u'continue', u'declare', u'dirs', u'disown', u'echo', u'enable', u'eval', u'exec', u'exit', u'export', u'false', u'fc', u'fg', u'getopts', u'hash', u'help', u'history', u'jobs', u'kill', u'let', u'local', u'logout', u'mapfile', u'popd', u'printf', u'pushd', u'pwd', u'read', u'readarray', u'readonly', u'return', u'set', u'shift', u'shopt', u'source', u'suspend', u'test', u'times', u'trap', u'true', u'type', u'typeset', u'ulimit', u'umask', u'unalias', u'unset', u'wait', u'if', u'then', u'else', u'elif', u'fi', u'case', u'esac', u'for', u'select', u'while', u'until', u'do', u'done', u'in', u'function', u'time', u'coproc', u'alias', u'bg', u'bind', u'break', u'builtin', u'caller', u'cd', u'command', u'compgen', u'complete', u'compopt', u'continue', u'declare', u'dirs', u'disown', u'echo', u'enable', u'eval', u'exec', u'exit', u'export', u'false', u'fc', u'fg', u'getopts', u'hash', u'help', u'history', u'jobs', u'kill', u'let', u'local', u'logout', u'mapfile', u'popd', u'printf', u'pushd', u'pwd', u'read', u'readarray', u'readonly', u'return', u'set', u'shift', u'shopt', u'source', u'suspend', u'test', u'times', u'trap', u'true', u'type', u'typeset', u'ulimit', u'umask', u'unalias', u'unset', u'wait', u'ipcluster2', u'dynamodb_load', u'ipcontroller2', u'nosetests', u'lss3', u'asadmin', u'pilprint.py', u'cfadmin', u'taskadmin', u'instance_events', u'pilfile.py', u's3put', u'ipython2', u'bundle_image', u'ipcontroller', u'list_instances', u'ipcluster', u'mturk', u'iptest', u'pilfont.py', u'fetch_file', u'kill_instance', u'pildriver.py', u'django-admin.py', u'ipython', u'cwutil', u'route53', u'glacier', u'gunicorn_paster', u'dynamodb_dump', u'cq', u'faker', u'iptest2', u'pilconvert.py', u'gunicorn', u'ipdb', u'django-admin', u'launch_instance', u'sqlformat', u'newrelic-admin', u'nosetests-2.7', u'gunicorn_django', u'ipengine', u'elbadmin', u'ipengine2', u'sdbadmin', u'pyami_sendmail', u'pip', u'pip2.7', u'wheel', u'easy_install', u'pip2', u'easy_install-2.7', u'2to3', u'idle', u'python2-config', u'smtpd.py', u'sqlite3', u'pydoc', u'python2', u'python', u'python2.7', u'python2.7-config', u'python-config', u'ldattach', u'update-mime', u'sshd', u'install-sgmlcatalog', u'update-xmlcatalog', u'pg_updatedicts', u'tcpdchk', u'filefrag', u'update-ca-certificates', u'logrotate', u'try-from', u'libgvc6-config-update', u'update-catalog', u'update-gsfontmap', u'make-ssl-cert', u'tunelp', u'mklost+found', u'safe_finger', u'cron', u'e2freefrag', u'cytune', u'fdformat', u'readprofile', u'rtcwake', u'tcpd', u'gconf-schemas', u'update-icon-caches.gtk2', u'e4defrag', u'update-icon-caches', u'tcpdmatch', u'paperconfig', u'update-java-alternatives', u'service', u'vipw', u'chroot', u'dpkg-preconfigure', u'rmt', u'locale-gen', u'delgroup', u'dpkg-reconfigure', u'arpd', u'pam-auth-update', u'pwunconv', u'pwck', u'pwconv', u'newusers', u'cpgr', u'update-initramfs', u'rmt-tar', u'pam_getenv', u'adduser', u'policy-rc.d', u'addgroup', u'mkinitramfs', u'zic', u'nologin', u'vigr', u'invoke-rc.d', u'useradd', u'add-shell', u'usermod', u'cppw', u'groupdel', u'iconvconfig', u'tarcat', u'update-passwd', u'grpunconv', u'validlocale', u'deluser', u'update-rc.d', u'update-locale', u'userdel', u'groupmod', u'chpasswd', u'remove-shell', u'grpconv', u'tzconfig', u'grpck', u'chgpasswd', u'pam_timestamp_check', u'groupadd', u'init', u'pnmtops', u'chrt', u'tgz', u'lzmore', u'dpkg-genchanges', u'gcc-4.8', u'rasttopnm', u'pdb', u'ppmtoicr', u'volname', u'ssh-import-id-gh', u'pnmalias', u'rawtopgm', u'linux32', u'ppmdither', u'pg_basebackup', u'fc-cache', u'pbmtolj', u'editres', u'gcov-4.8', u'c_rehash', u'dh_pypy', u'paperconf', u'deb-systemd-invoke', u'pdb3', u'pbmtopgm', u'identify', u'pnmcomp', u'st4topgm', u'xlsatoms', u'python3m', u'partx', u'2to3', u'ppmtolss16', u'minfo', u'jcmd', u'curl', u'fitstopnm', u'jmap', u'dpkg-distaddfile', u'host', u'timedatectl', u'xkill', u'anytopnm', u'MagickWand-config', u'pgmedge', u'pic', u'x86_64-linux-gnu-objdump', u'yuvsplittoppm', u'line', u'eyuvtoppm', u'pkttyagent', u'ps2pdf14', u'font2c', u'xfontsel', u'dpkg-scanpackages', u'find2perl', u'pbmto10x', u'xbmtopbm', u'objcopy', u'faked-sysv', u'pnmtopalm', u'git-shell', u'pdb3.4', u'pnmmargin', u'orbd', u'ppm3d', u'crontab', u'zipgrep', u'xzcat', u'schemagen', u'convert', u'pbmpscale', u'dpkg-gencontrol', u'xwdtopnm', u'pnmtosir', u'dvipdf', u'namei', u'x86_64-linux-gnu-size', u'testrb', u'pstruct', u'telnet', u'ybmtopbm', u'x86_64-linux-gnu-gcc-ranlib', u'rcp', u'pnmtojpeg', u'ppmhist', u'editor', u'gsnd', u'pbmtext', u'perlivp', u'gold', u'printafm', u'pbmmask', u'peekfd', u'yacc', u'rename', u'pcre-config', u'see', u'telnet.netkit', u'lscpu', u'pnminvert', u'jstat', u'autoconf', u'pl2pm', u'ppmtv', u'mdel', u'mcheck', u'ptardiff', u'ssh-copy-id', u'psidtopgm', u'pg_dropcluster', u'localectl', u'sgitopnm', u'pbmtowbmp', u'pack200', u'pgmhist', u'pbmtoybm', u'gpg-error', u'stunnel', u'import', u'pg', u'x86_64-linux-gnu-objcopy', u'strip', u'gsdj500', u'cpp', u'eps2eps', u'setuidgid', u'libnetcfg', u'vacuumdb', u'pgbench', u'spctoppm', u'ppmquant', u'pnmshear', u'svstat', u'pod2html', u'lessecho', u'pamcut', u'pgmtopbm', u'pnmtoddif', u'gio-querymodules', u'prename', u'envdir', u'gslp', u'gcc-ranlib-4.8', u'run-mailcap', u'winicontoppm', u'x86_64-linux-gnu-gcc-ranlib-4.8', u'xfd', u'chattr', u'fakeroot', u'setarch', u'pnmgamma', u'gdbus-codegen', u'pyversions', u'gtk-launch', u'pbmlife', u'x86_64-linux-gnu-cpp-4.8', u'resizepart', u'pnmtotiffcmyk', u'xprop', u'perlthanks', u'pnmnoraw', u'ppmquantall', u'pgmtexture', u'memdiskfind', u'pamstretch', u'ssh-add', u'libpng-config', u'ppmtomitsu', u'pnmtoxwd', u'x86_64-linux-gnu-ld.bfd', u'pbmtoascii', u'jinfo', u'pgrphack', u'pbmreduce', u'x86_64-linux-gnu-c++filt', u'pg_conftool', u'python2-config', u'erb', u'update-mime-database.real', u'lesskey', u'pg_recvlogical', u'setfacl', u'pnmtile', u'prtstat', u'sirtopnm', u'pnmsplit', u'ppmtoleaf', u'killall', u'ps2epsi', u'mzip', u'lsb_release', u'rletopnm', u'pgmcrater', u'gresource', u'rsh', u'psql', u'lcf', u'ppmtouil', u'droplang', u'compare.im6', u'pgmtofs', u'mclasserase', u'vacuumlo', u'pbmtoepsi', u'pnmtorast', u'hostnamectl', u'pbmtog3', u'ionice', u'jpegtopnm', u'xzgrep', u'gsettings', u'c99', u'lzfgrep', u'mdatopbm', u'ppmdist', u'pg_config', u'ppmchange', u'xz', u'dpkg-buildpackage', u'mdir', u'xzmore', u'ppmtoilbm', u'pbmtoptx', u'ppmntsc', u'ppmnorm', u'mkmanifest', u'libgcrypt-config', u'pnmcut', u'dh_python2', u'aclocal', u'svscan', u'pxelinux-options', u'rgb3toppm', u'x86_64-linux-gnu-dwp', u'ranlib', u'import.im6', u'unzipsfx', u'javadoc', u'x86_64-linux-gnu-ld', u'pamstretch-gen', u'gemtopnm', u'setsid', u'make', u'gcc-ar-4.8', u'irb', u'x86_64-linux-gnu-readelf', u'x86_64-linux-gnu-python2.7-config', u'g++', u'xml2-config', u'pgmoil', u'dpkg-name', u'gtester', u'gprof', u'ps2ps', u'logger', u'mcat', u'ppmtoeyuv', u'x86_64-linux-gnu-ranlib', u'ld', u'x86_64-linux-gnu-nm', u'pamdeinterlace', u'x86_64-linux-gnu-strip', u'mshowfat', u'grog', u'zeisstopnm', u'xvinfo', u'perldoc', u'ps2pdf12', u'jconsole', u'linux64', u'gcc', u'pod2latex', u'ssh-keyscan', u'pi3topbm', u'rlogin', u'rmiregistry', u'montage.im6', u'unlzma', u'hmac256', u'svscanboot', u'pod2text', u'pfbtopfa', u'ppmtoacad', u'a2p', u'x86_64-linux-gnu-gcov', u'geqn', u'pnmremap', u'pamfile', u'pbmtoppa', u'splain', u'dig', u'strings', u'rmic', u'python3.4', u'desktop-file-install', u'pnmscalefixed', u'sputoppm', u'ppmtopgm', u'sprof', u'brushtopbm', u'pod2latex.bundled', u'h2ph', u'ghostscript', u'pgmnorm', u'xauth', u'servertool', u'2to3-3.4', u'rake1.9.1', u's2p', u'mdu', u'pnmenlarge', u'gdk-pixbuf-pixdata', u'ps2pdf13', u'pg_createcluster', u'c++filt', u'mxtar', u'extcheck', u'pnmtorle', u'ppmtoneo', u'neqn', u'cd-fix-profile', u'cpanp', u'faked-tcp', u'ppmtomap', u'cpan', u'luit', u'policytool', u'flock', u'python3', u'grops', u'wftopfa', u'tnameserv', u'ppmtopuzz', u'cpanp-run-perl', u'dpkg-vendor', u'dwp', u'xzless', u'convert.im6', u'gpic', u'mren', u'mgrtopbm', u'fc-query', u'ppmspread', u'ppmfade', u'pstopnm', u'pphs', u'ppmtopi1', u'autoreconf', u'gemtopbm', u'fghack', u'pbmpage', u'cpan2dist', u'pydoc', u'mlabel', u'x86_64-linux-gnu-gcc-ar', u'pgmnoise', u'soelim', u'pamdice', u'bison.yacc', u'podselect', u'autom4te', u'ssh-keygen', u'stream', u'xvminitoppm', u'glib-compile-resources', u'pg_ctlcluster', u'lz', u'jsadebugd', u'pg_renamecluster', u'pnmconvol', u'x86_64-linux-gnu-addr2line', u'dumpsexp', u'pbmtoxbm', u'jrunscript', u'dh_autotools-dev_restoreconfig', u'gcov', u'pbmclean', u'rmid', u'x86_64-linux-gnu-gcc-4.8', u'gcc-ar', u'ssh-argv0', u'dbus-launch', u'supervise', u'x86_64-linux-gnu-ld.gold', u'ppmtogif', u'cmuwmtopbm', u'elfedit', u'identify.im6', u'xdriinfo', u'size', u'pg_isready', u'desktop-file-edit', u'slogin', u'colormgr', u'zipsplit', u'pbmtextps', u'getfacl', u'dpkg-checkbuilddeps', u'cpp-4.8', u'cd-iccdump', u'pnmmontage', u'ptargrep', u'keytool', u'x86_64', u'readproctitle', u'ppmtoyuv', u'pgmramp', u'gdk-pixbuf-query-loaders', u'lessfile', u'ppmtolj', u'pstree', u'pg_restore', u'pnmcolormap', u'pamstack', u'testrb1.9.1', u'pydoc2.7', u'pnmnorm', u'pbmtopsg3', u'giftopnm', u'pnmindex', u'ilbmtoppm', u'json_pp', u'pnmcrop', u'libtoolize', u'x86_64-linux-gnu-ar', u'x86_64-linux-gnu-gcc', u'pydoc3', u'libpng12-config', u'x86_64-linux-gnu-python-config', u'nsupdate', u'pbmtoatk', u'2to3-2.7', u'delpart', u'pbmtomda', u'python2', u'udisksctl', u'pdb2.7', u'git', u'pnmflip', u'tbl', u'pnmtoplainpnm', u'rdoc1.9.1', u'pnmpaste', u'ppmtoyuvsplit', u'pnmdepth', u'mformat', u'podchecker', u'ld.bfd', u'ps2pdf', u'objdump', u'idlj', u'sldtoppm', u'jhat', u'pgmslice', u'fc-list', u'jstatd', u'pg_receivexlog', u'conjure.im6', u'g3topbm', u'fiascotopnm', u'pnmtofits', u'dpkg-shlibdeps', u'zipdetails', u'x86_64-linux-gnu-strings', u'pkaction', u'autoupdate', u'xzfgrep', u'ppmshift', u'ntfsdecrypt', u'unzip', u'ptar', u'pod2usage', u'less', u'traceroute6', u'pnmquant', u'pygettext3.4', u'ps2ps2', u'bmptopnm', u'compile_et', u'pnminterp-gen', u'pbmtomgr', u'c89', u'rsync', u'xwininfo', u'groff', u'ssh-import-id-lp', u'py3compile', u'pygettext2.7', u'addpart', u'print', u'jarsigner', u'montage', u'xlsclients', u'wall', u'aclocal-1.14', u'procan', u'pnmscale', u'file', u'multilog', u'pydoc3.4', u'gtbl', u'jar', u'shasum', u'preconv', u'ruby', u'gtk-update-icon-cache-3.0', u'c99-gcc', u'ucfq', u'view', u'pnmfile', u'mkdiskimage', u'autoheader', u'ppmtompeg', u'thinkjettopbm', u'ppmtoxpm', u'x86_64-linux-gnu-gcc-ar-4.8', u'gobject-query', u'zipinfo', u'display.im6', u'pnmtotiff', u'dh_python3', u'eject', u'lzcat', u'java', u'xdpyinfo', u'qrttoppm', u'pnminterp', u'compose', u'svc', u'enc2xs', u'stream.im6', u'md5pass', u'fc-scan', u'git-upload-archive', u'ppmtopj', u'gsettings-schema-convert', u'glib-genmarshal', u'ld.gold', u'envuidgid', u'Magick-config', u'readelf', u'pbmtoepson', u'rev', u'bison', u'sha1pass', u'listres', u'syslinux2ansi', u'glib-gettextize', u'mbadblocks', u'composite', u'native2ascii', u'pgmbentley', u'createuser', u'createdb', u'wsgen', u'dpkg-gensymbols', u'pg_virtualenv', u'whereis', u'passwd', u'pcxtoppm', u'ifnames', u'leaftoppm', u'clusterdb', u'ppmshadow', u'xzegrep', u'gs', u'ucfr', u'softlimit', u'jexec', u'm4', u'ipcmk', u'taskset', u'rpcgen', u'pbmtogo', u'gtk-update-icon-cache', u'ppmtopict', u'troff', u'mogrify.im6', u'macptopbm', u'pnmrotate', u'reindexdb', u'isohybrid', u'h2xs', u'freetype-config', u'lzegrep', u'edit', u'pbmtoplot', u'fc-pattern', u'ssh', u'gnome-open', u'mogrify', u'git-upload-pack', u'chsh', u'ppmtotga', u'glib-mkenums', u'ppmtosixel', u'xjc', u'uz', u'pnmpad', u'pbmtonokia', u'desktop-file-validate', u'gconftool-2', u'ppmcie', u'javap', u'ppmtobmp', u'g++-4.8', u'zip', u'bioradtopgm', u'setterm', u'lzgrep', u'mcd', u'conjure', u'nslookup', u'scp', u'ssh-import-id', u'cd-create-profile', u'grotty', u'tifftopnm', u'pnmhistmap', u'automake-1.14', u'jps', u'ppmrelief', u'mcomp', u'krb5-config', u'gpasswd', u'git-receive-pack', u'pg_dump', u'getopt', u'dpkg-scansources', u'ppmbrighten', u'pbmupc', u'ppmtopcx', u'xmessage', u'pkexec', u'pbmtocmuwm', u'pngtopnm', u'ps2pdfwr', u'gencat', u'gslj', u'ps2ascii', u'411toppm', u'py3clean', u'eqn', u'python', u'svok', u'ps2txt', u'dpkg-buildflags', u'gethostip', u'xev', u'lzmainfo', u'unxz', u'mshortname', u'chfn', u'tai64nlocal', u'MagickCore-config', u'mcopy', u'ppmdim', u'update-gconf-defaults', u'pi1toppm', u'ppmflash', u'deb-systemd-helper', u'pod2man', u'wget', u'autoscan', u'mcookie', u'dropuser', u'openssl', u'gtester-report', u'x86_64-linux-gnu-cpp', u'pg_upgradecluster', u'ppmlabel', u'asciitopgm', u'stunnel3', u'ipcs', u'psed', u'pybuild', u'javac', u'pbmtopi3', u'fc-cat', u'compare', u'python2.7', u'pgmenhance', u'cc', u'fstopgm', u'x86_64-linux-gnu-as', u'icontopbm', u'pgmtoppm', u'erb1.9.1', u'prove', u'pnmarith', u'zipnote', u'gsdj', u'xlsfonts', u'imgtoppm', u'dbus-monitor', u'neotoppm', u'pbmtobbnbg', u'corelist', u'ppmcolormask', u'gdk-pixbuf-csource', u'yuvtoppm', u'serialver', u'ppmtorgb3', u'xzdiff', u'perlbug', u'i386', u'mysql_config', u'nm', u'pnmhisteq', u'dpkg-parsechangelog', u'sbigtopgm', u'pjtoppm', u'gdbus', u'mattrib', u'mmount', u'display', u'script', u'ppmmake', u'jdb', u'fallocate', u'piconv', u'ppmforge', u'pdf2ps', u'gsbj', u'animate', u'filan', u'sftp', u'pnmtofiasco', u'tgatoppm', u'lzcmp', u'lsattr', u'ruby1.9.1', u'x86_64-linux-gnu-gcc-nm-4.8', u'jstack', u'gcc-nm', u'pnmpsnr', u'libwmf-config', u'glib-compile-schemas', u'as', u'python2.7-config', u'automake', u'xpmtoppm', u'socat', u'javah', u'dropdb', u'expiry', u'gpg-error-config', u'appres', u'zipcloak', u'gcc-ranlib', u'x86_64-linux-gnu-gcov-4.8', u'lzless', u'unshare', u'python-config', u'c2ph', u'ppmtowinicon', u'palmtopnm', u'rename.ul', u'fakeroot-tcp', u'xzcmp', u'irb1.9.1', u'xslt-config', u'pbmtoicon', u'chage', u'traceroute6.iputils', u'x86_64-linux-gnu-g++-4.8', u'rawtoppm', u'x86_64-linux-gnu-gcc-nm', u'cautious-launcher', u'pkcheck', u'animate.im6', u'dh_installxmlcatalogs', u'fc-match', u'mtvtoppm', u'funzip', u'ppmmix', u'pg_dumpall', u'pbmtozinc', u'gcc-nm-4.8', u'curl-config', u'pg_lsclusters', u'config_data', u'tracepath6', u'ppmpat', u'ri1.9.1', u'wbmptopbm', u'pdf2dsc', u'ssh-agent', u'pnmsmooth', u'gem', u'ucf', u'ximtoppm', u'ppmtojpeg', u'mtrace', u'amuFormat.sh', u'mpartition', u'chacl', u'pg_archivecleanup', u'sotruss', u'viewres', u'pgmkernel', u'rdoc', u'mtools', u'pbmtogem', u'dh_autotools-dev_updateconfig', u'pstree.x11', u'py3versions', u'pbmtomacp', u'lzma', u'mmd', u'x86_64-linux-gnu-g++', u'python3.4m', u'pyclean', u'newgrp', u'xsubpp', u'tracepath', u'nroff', u'pgmtolispm', u'gsettings-data-convert', u'atktopbm', u'ppmrainbow', u'lispmtopgm', u'ri', u'pf2afm', u'pyvenv-3.4', u'syslinux', u'gconftool', u'mmove', u'ppmcolors', u'dpkg-architecture', u'ipcrm', u'ppmqvga', u'pygettext', u'addr2line', u'hipstopgm', u'gouldtoppm', u'chardet', u'mdeltree', u'patch', u'x86_64-linux-gnu-gprof', u'isohybrid.pl', u'fc-validate', u'instmodsh', u'pnmtosgi', u'pbmtox10bm', u'appletviewer', u'pnmcat', u'lss16toppm', u'setlock', u'lzdiff', u'composite.im6', u'pnmtopng', u'pkg-config', u'gem1.9.1', u'lesspipe', u'c++', u'mtype', u'pnmnlfilt', u'c89-gcc', u'chkdupexe', u'createlang', u'update-mime-database', u'pamoil', u'ddate', u'pg_config.libpq-dev', u'mtoolstest', u'dbus-send', u'bmptoppm', u'pbmmake', u'scriptreplay', u'stunnel4', u'wsimport', u'mrd', u'Wand-config', u'dpkg-mergechangelogs', u'renice', u'gconf-merge-tree', u'ar', u'dpkg-source', u'update-desktop-database', u'x86_64-linux-gnu-elfedit', u'libtool', u'fakeroot-sysv', u'unpack200', u'pycompile', u'tai64n', u'pygettext3', u'base64', u'tty', u'service', u'test', u'nl', u'numfmt', u'sha1sum', u'cmp', u'dpkg-split', u'ncurses5-config', u'apt-get', u'iconv', u'nstat', u'lsinitramfs', u'free', u'wc', u'debconf', u'lastb', u'hostid', u'ptx', u'tabs', u'diff3', u'pwdx', u'cksum', u'debconf-communicate', u'fold', u'captoinfo', u'rtstat', u'routef', u'groups', u'localedef', u'whoami', u'tic', u'od', u'gpgsplit', u'apt-config', u'pager', u'seq', u'arch', u'debconf-set-selections', u'tput', u'w', u'perl5.18.2', u'locale', u'md5sum', u'env', u'routel', u'md5sum.textutils', u'find', u'tzselect', u'logname', u'factor', u'awk', u'expr', u'gpg', u'ncursesw5-config', u'w.procps', u'tset', u'pinky', u'shred', u'zdump', u'sha224sum', u'apt-key', u'apt', u'apt-cache', u'shuf', u'pathchk', u'expand', u'timeout', u'tsort', u'initctl2dot', u'gpg-zip', u'ctstat', u'sha256sum', u'mawk', u'sensible-pager', u'gpgv', u'debconf-show', u'printf', u'comm', u'yes', u'rgrep', u'perl', u'debconf-copydb', u'init-checkconf', u'clear_console', u'nohup', u'infotocap', u'dpkg-statoverride', u'debconf-apt-progress', u'stdbuf', u'mkfifo', u'pldd', u'dpkg-trigger', u'cut', u'infocmp', u'sum', u'who', u'id', u'tload', u'reset', u'pmap', u'diff', u'pr', u'dpkg-query', u'dpkg-divert', u'csplit', u'touch', u'printenv', u'dircolors', u'savelog', u'bashbug', u'sensible-browser', u'which', u'update-alternatives', u'sg', u'oldfind', u'stat', u'basename', u'unlink', u'vmstat', u'apt-cdrom', u'fmt', u'nice', u'head', u'sensible-editor', u'getent', u'clear', u'watch', u'skill', u'pkill', u'split', u'sha512sum', u'dpkg', u'dpkg-deb', u'dirname', u'nproc', u'last', u'nawk', u'debconf-escape', u'ischroot', u'lspgpot', u'catchsegv', u'apt-mark', u'getconf', u'snice', u'lastlog', u'du', u'join', u'tail', u'sdiff', u'link', u'slabtop', u'tac', u'lnstat', u'users', u'tee', u'uniq', u'tr', u'top', u'paste', u'xargs', u'pgrep', u'uptime', u'ldd', u'runcon', u'truncate', u'sort', u'install', u'faillog', u'sha384sum', u'mesg', u'unexpand', u'select-editor', u'toe', u'chcon', u'dpkg-maintscript-helper', u'blockdev', u'ntfscp', u'fdisk', u'swapon', u'mount.ntfs-3g', u'hwclock', u'fsck.ext4dev', u'fsck', u'parted', u'unix_chkpwd', u'fsck.minix', u'fstrim', u'fsck.vfat', u'fsck.msdos', u'umount.udisks2', u'fsck.fat', u'sfdisk', u'sgdisk', u'mkfs.ext3', u'fsck.ext3', u'mkfs.ext2', u'mkfs.ext4dev', u'cfdisk', u'mkfs.bfs', u'mount.fuse', u'tune2fs', u'fstrim-all', u'pivot_root', u'mkdosfs', u'mkfs.minix', u'logsave', u'ntfsresize', u'ctrlaltdel', u'e2undo', u'e2image', u'ntfsclone', u'ntfsundelete', u'losetup', u'wipefs', u'partprobe', u'fsck.ext4', u'mkfs.ext4', u'switch_root', u'cgdisk', u'badblocks', u'findfs', u'isosize', u'ntfslabel', u'gdisk', u'mkfs.cramfs', u'fsck.cramfs', u'mkfs.fat', u'fsck.ext2', u'swaplabel', u'fatlabel', u'debugfs', u'mkfs.ntfs', u'e2label', u'dumpe2fs', u'dosfslabel', u'mount.lowntfs-3g', u'raw', u'dosfsck', u'mkntfs', u'fixparts', u'e2fsck', u'getty', u'mke2fs', u'mkswap', u'mkfs.msdos', u'resize2fs', u'mount.ntfs', u'dmsetup', u'blkid', u'agetty', u'mkfs.vfat', u'swapoff', u'mkfs', u'fsfreeze', u'sysctl', u'pam_tally2', u'udevadm', u'killall5', u'initctl', u'status', u'unix_update', u'fsck.nfs', u'ip', u'mountall', u'rmmod', u'shutdown', u'bridge', u'installkernel', u'pam_tally', u'lsmod', u'upstart-udev-bridge', u'upstart-socket-bridge', u'startpar', u'plymouthd', u'rtacct', u'start-stop-daemon', u'insmod', u'mkhomedir_helper', u'upstart-local-bridge', u'upstart-dbus-bridge', u'startpar-upstart-inject', u'start', u'reload', u'modprobe', u'ifup', u'upstart-file-bridge', u'ldconfig.real', u'shadowconfig', u'udevd', u'mntctl', u'modinfo', u'ifdown', u'initctl.distrib', u'poweroff', u'telinit', u'rtmon', u'reboot', u'ldconfig', u'MAKEDEV', u'tc', u'runlevel', u'restart', u'depmod', u'sulogin', u'ifquery', u'stop', u'halt', u'upstart-event-bridge', u'fstab-decode', u'init', u'bzcmp', u'findmnt', u'bzip2recover', u'bzip2', u'su', u'bzgrep', u'lowntfs-3g', u'ping6', u'mount', u'ntfscmp', u'tailf', u'lessecho', u'bzfgrep', u'lesskey', u'setfacl', u'ntfswipe', u'bzmore', u'umount', u'dbus-uuidgen', u'fusermount', u'loginctl', u'ntfsmove', u'ping', u'bzless', u'more', u'ntfsmftalloc', u'ntfscat', u'getfacl', u'lessfile', u'nc.openbsd', u'fuser', u'less', u'red', u'ntfs-3g.probe', u'ntfs-3g', u'ntfsdump_logfile', u'ntfstruncate', u'ntfsck', u'nc', u'bunzip2', u'ntfscluster', u'ntfsfix', u'dbus-daemon', u'bzdiff', u'dbus-cleanup-sockets', u'ulockmgr_server', u'bzegrep', u'chacl', u'lsblk', u'bzexe', u'dmesg', u'ntfs-3g.secaudit', u'ntfsinfo', u'ed', u'ntfsls', u'lesspipe', u'bzcat', u'netcat', u'ntfs-3g.usermap', u'ls', u'sh.distrib', u'dd', u'mountpoint', u'gzip', u'false', u'udevadm', u'pidof', u'pwd', u'mktemp', u'chgrp', u'grep', u'ss', u'sed', u'znew', u'rmdir', u'plymouth', u'ln', u'df', u'ip', u'cat', u'hostname', u'kill', u'mt-gnu', u'lsmod', u'stty', u'rbash', u'zcmp', u'login', u'fgrep', u'zcat', u'nisdomainname', u'zless', u'true', u'egrep', u'cp', u'readlink', u'uname', u'running-in-container', u'dnsdomainname', u'gunzip', u'touch', u'dir', u'which', u'mt', u'sh', u'tar', u'cpio', u'kmod', u'zdiff', u'vdir', u'bash', u'mkdir', u'sleep', u'domainname', u'uncompress', u'chown', u'chmod', u'rm', u'date', u'plymouth-upstart-bridge', u'gzexe', u'zegrep', u'tempfile', u'zfgrep', u'ps', u'sync', u'zgrep', u'ypdomainname', u'zforce', u'dash', u'echo', u'mv', u'zmore', u'mknod', u'run-parts']  # noqa


@mock.patch.object(
    CommandExtractor,
    'RE_ALL_COMMANDS',
    re.compile(CommandExtractor.BASE_CMDS_REX % '|'.join(map(re.escape, ALL_TESTS_COMMANDS)))
)
class TestCommandExtract(TestCase):

    def test_extract_commands(self):
        cmds = extract_commands(iter_html_docs(TEST_DATA_DIR))
        self.assertEqual(set(cmds.commands.keys()), MERGED_COMMANDS)

        cmds = extract_commands(iter_html_docs(TEST_DATA_DIR), 'xargs')
        self.assertEqual(set(cmds.commands.keys()), set([
            'find /tmp -name "*.tmp" | xargs rm',
            u'find ./music -name "*.mp3" -print0 | xargs -0 ls',
            'find . -name "*.sh" | xargs grep "ksh"',
            'find /tmp -name "*.tmp" -print0 | xargs -0 rm',
            'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts',
            u'find ./work -print | xargs grep "profit"']))

        cmds = extract_commands(
            get_html_doc(TEST_DATA_DIR, 'stackoverflow.com'), 'xargs')
        self.assertEqual(cmds.commands, {})

        doc = HtmlDocument('http://stackoverflow.com', b'')
        doc.body = None
        cmds = extract_commands(doc)
        self.assertEqual(cmds.nr_docs, 0)

    def test_iter_texts(self):
        extractor = CommandExtractor()
        for doc in iter_html_docs(TEST_DATA_DIR):
            nr_txts = 0
            for _ in extractor.iter_text_lines(doc):
                nr_txts += 1
            self.assertEqual(NR_TEXTS[doc.url.url], nr_txts)

    def test_iter_commands(self):
        extractor = CommandExtractor()
        for doc in iter_html_docs(TEST_DATA_DIR):
            for (line, cmd), correct in zip(extractor.iter_commands(doc),
                                            COMMANDS[doc.url.url]):
                self.assertEqual((line, cmd), correct)

    def test_get_command(self):
        ext = CommandExtractor('find')
        self.assertEqual(ext.get_command('$ find . -name "*.mp3"'),
                         'find . -name "*.mp3"')
        self.assertIsNone(ext.get_command('# ls -hl'))
        self.assertIsNone(ext.get_command('find a file'))
        self.assertIsNone(ext.get_command('Find . -name "*.mp3"'))

    def test_sudo(self):
        ext = CommandExtractor('ls')
        self.assertEqual(ext.get_command('# sudo ls -hl'),
                         'ls -hl')
        ext = CommandExtractor('sudo')
        self.assertEqual(
            ext.get_command('# sudo -u www vi ~www/htdocs/index.html'),
            'sudo -u www vi ~www/htdocs/index.html')

    def test_has_wanted_command(self):
        ext = CommandExtractor('xargs')
        self.assertTrue(ext.has_wanted_command(
            u'find ./music -name "*.mp3" -print0 | xargs -0 ls'))
        self.assertFalse(ext.has_wanted_command(
            u'find ./music -name "*.mp3" -print0 | grep xargs'))

        ext = CommandExtractor(['du', 'mv'])
        self.assertTrue(ext.has_wanted_command(
            u'du -h -s *'))
        self.assertFalse(ext.has_wanted_command(
            u'ls -hl'))

        ext = CommandExtractor(['git commit'])
        self.assertTrue(ext.has_wanted_command(
            u'git commit --amend'))
        self.assertFalse(ext.has_wanted_command(
            u'git pull origin master'))

    def test_is_command_name(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command_name('ls'))
        self.assertTrue(ext.is_command_name('l'))
        self.assertTrue(ext.is_command_name('7z'))
        self.assertTrue(ext.is_command_name('apt-get'))

        self.assertFalse(ext.is_command_name(''))
        self.assertFalse(ext.is_command_name('1'))
        self.assertFalse(ext.is_command_name('22'))
        self.assertFalse(ext.is_command_name('apt-'))
        self.assertFalse(ext.is_command_name('-'))
        self.assertFalse(ext.is_command_name('-ls'))
        self.assertFalse(ext.is_command_name('apt get'))
        self.assertFalse(ext.is_command_name('APT-GET'))

    def test_is_command_output(self):
        ext = CommandExtractor()
        self.assertTrue(ext.is_command_output(
            'drwxr-xr-x   3 root root 4,0K maj  5  2014 home'))
        self.assertFalse(ext.is_command_output('total 0'))

    def test_is_command(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command(
            u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d'))
        self.assertTrue(ext.is_command('uname -a'))
        self.assertTrue(ext.is_command('git log'))

        self.assertFalse(ext.is_command(''))
        self.assertFalse(ext.is_command('when I use:'))
        self.assertFalse(ext.is_command('is used.'))
        self.assertFalse(ext.is_command('thank you!!!!'))
        self.assertFalse(ext.is_command('thanks for sharing'))
        self.assertFalse(ext.is_command(
            'drwxr-xr-x   3 root root 4,0K maj  5  2014 home'))
        self.assertFalse(ext.is_command(
            'ls -al %s' % 'a'*ext.MAX_COMMAND_LENGTH))
        self.assertFalse(ext.is_command(
            ("you can use '-c' & '-w' with wc to obtain number of characters"
             "and words repectively")))
        self.assertFalse(ext.is_command('250 total'))

        # TODO
        self.assertTrue(ext.is_command('thanx :)'))
