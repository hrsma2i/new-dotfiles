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
# elementary commands
#--------------------------------------------------------------------

apt-get update
apt-get dist-upgrade -y
# elementary
apt-get install -y \
	apt-utils \
	build-essential \
	curl \
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
# pyenv pre-requirements
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev
#&& rm -rf /var/lib/apt/lists/*

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
	"conda")
		if ! has conda; then
		   echo -e $GREEN'installing miniconda ...'$RESET
			wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
				-O $HOME/miniconda.sh
			/bin/bash $HOME/miniconda.sh -b -p $HOME/.miniconda3
			/bin/rm $HOME/miniconda.sh
		   echo -e $GREEN'DONE miniconda ...'$RESET
		else
			echo -e $GREEN'miniconda is already installed'$RESET
		fi
		conda update -y conda
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
# Neovim
#--------------------------------------------------------------------
#
#if ! has nvim; then
#	echo -e $GREEN'installing neovim ...'$RESET
#	# install neovim
#	sudo apt-get update 
#	sudo apt-get install -y software-properties-common 
#	sudo add-apt-repository -y ppa:neovim-ppa/stable 
#	sudo apt-get update 
#	sudo apt-get install -y neovim 
#	#sudo apt-get install -y python-dev python-pip python3-dev python3-pip 
#	# alias vi, vim as nvim
#	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 
#	sudo update-alternatives --auto vi 
#	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 
#	sudo update-alternatives --auto vim 
#	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 
#	sudo update-alternatives --auto editor 
#	# link init.vim (for nvim) to .vimrc
#	echo -e $GREEN'DONE neovim ...'$RESET
#else
#	echo -e $GREEN'neovim is already installed'$RESET
#fi

#deoplete (completion plugin)
#conda install -y -c conda-forge neovim


#--------------------------------------------------------------------
# deploy (must be the last)
#--------------------------------------------------------------------
$DOTROOT/deploy.sh
