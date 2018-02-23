from jupyter_core.paths import jupyter_config_dir, jupyter_data_dir
import os.path
import sys

sys.path.append(os.path.join(jupyter_data_dir(), 'extensions'))

c = get_config()

c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.password = u'sha1:XXXXXXXXX' 
c.NotebookApp.extra_template_paths = [os.path.join(jupyter_data_dir(), 'templates') ]
c.NotebookApp.server_extensions = ['nbextensions']
