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
conda env create --name ml_base -f ~/.dotfiles/conda_envs/data_analysis_minimal.yaml

source activate ml_base

.dotfiles/init_jupyter.py
```
