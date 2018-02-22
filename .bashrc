#---------------------------------------------------------------
# Alias
#---------------------------------------------------------------
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias br="git branch"
alias co="git checkout"
alias cob="git checkout -b"
alias st="git status"
alias add="git add"
alias cm="git commit"
alias amend="git commit --amend"
alias push="git push"
alias pull="git pull"
alias merge="git merge"
alias reset="git reset"


# local aliases
if [[ -e $HOME/.local_aliases.sh ]]; then
	source $HOME/.local_aliases.sh
	alias al="vim $HOME/.local_aliases.sh"
fi


#---------------------------------------------------------------
# Python & Miniconda
#---------------------------------------------------------------
export PATH="$HOME/.miniconda3/bin:$PATH"


#---------------------------------------------------------------
# Trash
#---------------------------------------------------------------
alias rm='echo "This is not the command you are looking for."; false'
alias del='trash-put'


#---------------------------------------------------------------
# Neovim
#---------------------------------------------------------------
# dein.vim root dir
export XDG_CONFIG_HOME=$HOME/.dotfiles


#---------------------------------------------------------------
# jupyter notebook
#---------------------------------------------------------------

if type jupyter &> /dev/null; then
	# excute jupyter notebook in background
	alias note="jupyter notebook --allow-root &> /dev/null &"
fi
