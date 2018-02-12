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
# elementary commands
#--------------------------------------------------------------------

apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get install -y \
	apt-utils \
	build-essential \
	curl \
	git \
	m4 \
	ruby \
	texinfo \
	libbz2-dev \
	libcurl4-openssl-dev \
	libexpat-dev \
	libncurses-dev \
	zlib1g-dev \
	gettext \
	sudo \
	less \
	man \
	wget \
	vim \
#&& rm -rf /var/lib/apt/lists/*

#--------------------------------------------------------------------
# Python & miniconda
#--------------------------------------------------------------------
if ! has conda; then
   echo -e $GREEN'installing miniconda ...'$RESET
	wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
		-O $HOME/miniconda.sh
	/bin/bash $HOME/miniconda.sh -b -p
	/bin/rm $HOME/miniconda.sh
   echo -e $GREEN'DONE miniconda ...'$RESET
else
	echo -e $GREEN'miniconda is already installed'$RESET
fi


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
	echo -e $GREEN'DONE neovim ...'$RESET
else
	echo -e $GREEN'neovim is already installed'$RESET
fi

