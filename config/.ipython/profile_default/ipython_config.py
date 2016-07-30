# Configuration file for ipython.

c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20

c.InteractiveShellApp.exec_lines = [
    'import re',
    'import os',
    'import sys',
    'import requests',
    'from bs4 import BeautifulSoup'
]

c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'Linux'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]

# Suppress warning messages about legacy config files
c.TerminalIPythonApp.ignore_old_config = True

c.TerminalInteractiveShell.readline_parse_and_bind = [
    'tab: complete',
    '"\\C-l": clear-screen',
    'set show-all-if-ambiguous on',
    '"\\C-o": tab-insert',
    '"\\C-r": reverse-search-history',
    '"\\C-s": forward-search-history',
    '"\\ep": history-search-backward',
    '"\\eP": history-search-forward',
    '"\\C-p": history-search-backward',
    '"\\C-n": history-search-forward',
    '"\\C-k": kill-line',
    '"\\C-u": unix-line-discard',
    '"\\C-P": history-search-forward',
    '"\\C-d": "\\C-a\\C-k\\C-d"',
]

c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.display_completions_in_columns = True
