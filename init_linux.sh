#!/bin/bash -eu

#--------------------------------------------------------------------
#
#--------------------------------------------------------------------
# read options
while [ $# -gt 0 ];
do
	case $1 in
		
		--python | -p)
			PYTHON_MANAGER=$2
		;;
	esac
	shift
done

DOTROOT=$(cd $(dirname $0);pwd)

GREEN='\e[32m'
  RED='\e[31m'
RESET=' \e[m'

# colorize the error as red
#exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

function has(){
	# check whether the command exists
	type "$1" > /dev/null 2>&1
	return $?
}

#--------------------------------------------------------------------
# python
#--------------------------------------------------------------------
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
PYTHON_VER=3.6.4
case $PYTHON_MANAGER in
	"pyenv")
		if ! has pyenv; then
			git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
			eval "$(pyenv init -)"
		fi
		## install zlib
		## This part does not work
		#ZLIB_URL="https://zlib.net/zlib-1.2.11.tar.gz" 
		#ZLIB_NAME=$(basename $ZLIB_URL .tar.gz)
		#curl -O $ZLIB_URL
		#mkdir -p $HOME/local/src
		#tar -zxvf $(basename $ZLIB_URL) -C $HOME/local/src
		#cd $HOME/local/src/$ZLIB_NAME
		#./configure --prefix=$HOME/local/lib/$ZLIB_NAME
		#make
		#make install
		#ln -s $HOME/local/lib/$ZLIB_NAME $HOME/local/zlib
		#export LD_LIBRARY_PATH="$HOME/local/lib/$ZLIB_NAME/lib:$LD_LIBRARY_PATH"

		# install pyenv-virtualenv
		git clone https://github.com/pyenv/pyenv-virtualenv.git \
				  $(pyenv root)/plugins/pyenv-virtualenv && true
		# "&& true": cancel shebang's -e option 
		#			(avoid stopping this scritp when an error occurs)

		# install python
		pyenv install -s $PYTHON_VER
		# -s: skip if the version appears to be installed already

		# make base virtual env
		pyenv virtualenv $PYTHON_VER base_env && true
		cd $HOME
		pyenv local base_env
	;;
esac


#--------------------------------------------------------------------
# trash-cli
#--------------------------------------------------------------------
if ! has trash; then
	echo -e $GREEN'installing trash-cli ...'$RESET
	pip install --upgrade pip
	pip install trash-cli
	ln -s $HOME/.local/share/Trash $HOME/.Trash
	echo -e $GREEN'DONE trash-cli ...'$RESET
else
	echo -e $GREEN'trash-cli is already installed'$RESET
fi


#--------------------------------------------------------------------
# jupyter
#--------------------------------------------------------------------
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
cd $HOME


#--------------------------------------------------------------------
# deploy (must be the last)
#--------------------------------------------------------------------
$DOTROOT/deploy.sh
