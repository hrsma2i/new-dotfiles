#!/bin/bash -eu

#--------------------------------------------------------------------
#
#--------------------------------------------------------------------

DOTROOT=$(cd $(dirname $0);pwd)

ln -fns $DOTROOT/.bashrc $HOME/.bashrc
ln -fns $DOTROOT/nvim/init.vim $HOME/.vimrc
ln -fns $DOTROOT/nvim $HOME/.vim
