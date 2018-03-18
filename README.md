# My Dotfiles

This assumes that the platform is Ubuntu.

## installation

```sh
apt-get update &&\
apt-get install -y git &&\
git clone https://github.com/hrsma2i/new-dotfiles.git ~/.dotfiles &&\
~/.dotfiles/init.sh &&\
~/.dotfiles/deploy.sh &&\
source ~/.bashrc &&\
nvim -c UpdateRemotePlugins -c q
```

## Data Science

```sh
.dotfiles/init_ml.py
```
