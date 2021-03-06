#---------------------------------------------------------------
# ENV
#---------------------------------------------------------------
export EDITOR=vim

#---------------------------------------------------------------
# Alias
#---------------------------------------------------------------
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

#---------------------------------------------------------------
# .bashrc along with each OS
#---------------------------------------------------------------
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  source $HOME/.dotfiles/bashrc_mac.sh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  source $HOME/.dotfiles/bashrc_linux.sh
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
#---------------------------------------------------------------
# loacl aliases
#---------------------------------------------------------------

if [[ -e $HOME/.local_aliases.sh ]]; then
	source $HOME/.local_aliases.sh
fi
alias al="vim $HOME/.local_aliases.sh"
alias sal="source $HOME/.local_aliases.sh"

