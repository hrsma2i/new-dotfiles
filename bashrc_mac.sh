#---------------------------------------------------------------
# 
#---------------------------------------------------------------
function has(){
	# check whether the command exists
	type "$1" > /dev/null 2>&1
	return $?
}


#---------------------------------------------------------------
# Alias
#---------------------------------------------------------------
# enable color support of ls and also add handy aliases
alias ls="ls -G"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


#---------------------------------------------------------------
# pyenv
#---------------------------------------------------------------
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if has pyenv;then
	eval "$(pyenv init -)"
	alias pyenv-update="cd $(pyenv root);git pull;cd -"
fi
#if has conda;then
#	export PATH="$HOME/.miniconda3/bin:$PATH"
#fi


#---------------------------------------------------------------
# Trash
#---------------------------------------------------------------
alias rm='echo "Use /bin/rm -rf instead."; false'
alias del='trash-put'


#---------------------------------------------------------------
# jupyter
#---------------------------------------------------------------
alias note="jupyter notebook"

##---------------------------------------------------------------
## Neovim
##---------------------------------------------------------------
## dein.vim root dir
#export XDG_CONFIG_HOME=$HOME/.dotfiles
