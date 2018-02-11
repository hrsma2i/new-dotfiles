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


#--------------------------------------------------------------------
# Trash
#--------------------------------------------------------------------
if ! has trash; then
   echo -e $GREEN'installing trash-cli ...'$RESET
   pip install --upgrade pip
   pip install trash-cli
   echo -e $GREEN'DONE trash-cli ...'$RESET
else
	echo -e $GREEN'trash-cli is already installed'$RESET
fi

#--------------------------------------------------------------------
# Neovim
#--------------------------------------------------------------------

if ! has nvim; then
	echo -e $GREEN'installing neovim ...'$RESET
	# install neovim
	sudo apt-get update 
	sudo apt-get install -y software-properties-common 
	sudo add-apt-repository -y ppa:neovim-ppa/stable 
	sudo apt-get update 
	sudo apt-get install -y neovim 
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip 
	# alias vi, vim as nvim
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 
	sudo update-alternatives --config vi 
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 
	sudo update-alternatives --config vim 
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 
	sudo update-alternatives --config editor 
	# link init.vim (for nvim) to .vimrc
	ln -s $DOTROOT/.vim $DOTROOT/nvim
	ln -s $DOTROOT/.vimrc $DOTROOT/nvim/init.vim
	echo -e $GREEN'DONE neovim ...'$RESET
else
	echo -e $GREEN'neovim is already installed'$RESET
fi


#--------------------------------------------------------------------
#
#--------------------------------------------------------------------
