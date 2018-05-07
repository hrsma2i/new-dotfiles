#!/bin/bash -eu

#--------------------------------------------------------------------
#
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# jupyter
#--------------------------------------------------------------------
PYTHON_MANAGER="pyenv"
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
case $PYTHON_MANAGER in
	"pyenv")
		pip install jupyter 
		python -c 'from notebook.auth import passwd;print(passwd())' > $DOTROOT/.jupyter/key
		# install extensions
		pip install jupyter_contrib_nbextensions
	;;
esac
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && true
chmod -R go-w vim_binding
