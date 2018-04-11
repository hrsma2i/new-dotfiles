# My Dotfiles

Setup development environment.

1. Ubuntu without root
2. Ubuntu with root
3. Mac

## installation

### Ubuntu **without root**

```sh
git clone https://github.com/hrsma2i/new-dotfiles.git ~/.dotfiles &&\
~/.dotfiles/init_linux.sh -p pyenv &&\
source ~/.bashrc
```


### Ubuntu with **root**

```sh
apt-get update &&\
apt-get -y install git &&\
git clone https://github.com/hrsma2i/new-dotfiles.git ~/.dotfiles &&\
~/.dotfiles/init_root.sh -p pyenv &&\
source ~/.bashrc
```


### Mac

```sh
git clone https://github.com/hrsma2i/new-dotfiles.git ~/.dotfiles &&\
~/.dotfiles/init_mac.sh -p pyenv &&\
source ~/.bashrc
```
