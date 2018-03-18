#!/bin/bash -eu

#--------------------------------------------------------------------
#
#--------------------------------------------------------------------

DOTROOT=$(cd $(dirname $0);pwd)
GREEN='\e[32m'
  RED='\e[31m'
RESET=' \e[m'

# colorize the error as red
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

function has(){
	# check whether the command exists
	type "$1" > /dev/null 2>&1
	return $?
}

source $DOTROOT/.bashrc

#--------------------------------------------------------------------
# install minimal library for data science
#--------------------------------------------------------------------

cp $DOTROOT/requirements.txt $HOME
vim $HOME/requirements.txt
conda install -y --file $HOME/requirements.txt


#--------------------------------------------------------------------
# jupyter
#--------------------------------------------------------------------

if ! has jupyter; then
	conda install -y jupyter
fi
cp -r $DOTROOT/.jupyter $HOME
jupyter notebook --generate-config
python $DOTROOT/add_key_to_jupyter_config.py # write sha1 key in config file

