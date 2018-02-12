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

# local aliases
if [[ -e $HOME/.local_aliases.zsh ]]; then
	source $HOME/.local_aliases.zsh
fi


#---------------------------------------------------------------
# Python & Miniconda
#---------------------------------------------------------------
export PATH="$HOME/miniconda3/bin:$PATH"


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

