#! /usr/bin/env python
import os
from notebook.auth import passwd
from jupyter_core.paths import jupyter_config_dir

content = """
from jupyter_core.paths import jupyter_config_dir, jupyter_data_dir
import os.path
import sys

sys.path.append(os.path.join(jupyter_data_dir(), 'extensions'))

c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.password = u'{}'
c.NotebookApp.extra_template_paths = [os.path.join(jupyter_data_dir(), 'templates') ]
c.NotebookApp.server_extensions = ['nbextensions']
""".format(passwd())

config_file = os.path.join(jupyter_config_dir(), "jupyter_notebook_config.py")
with open(config_file, "a") as f:
    f.write(content)
