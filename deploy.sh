#!/bin/bash -eu

#--------------------------------------------------------------------
#
#--------------------------------------------------------------------

function has(){
	# check whether the command exists
	type "$1" > /dev/null 2>&1
	return $?
}

DOTROOT=$(cd $(dirname $0);pwd)

ln -fns $DOTROOT/.bashrc $HOME/.bashrc
ln -fns $DOTROOT/nvim/init.vim $HOME/.vimrc
ln -fns $DOTROOT/nvim $HOME/.vim

source $HOME/.bashrc
