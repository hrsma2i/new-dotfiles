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
# make environment
#--------------------------------------------------------------------

cp $DOTROOT/requirements.txt $HOME
vim $HOME/requirements.txt
conda install -y --file $HOME/requirements.txt

#--------------------------------------------------------------------
# jupyter
#--------------------------------------------------------------------

#conda install -y jupyter
#
#if ! has jupyter; then
#	echo -e $GREEN'installing jupyter ...'$RESET
#	echo -e $GREEN'DONE jupyter ...'$RESET
#else
#	echo -e $GREEN'jupyter is already installed'$RESET
#fi
