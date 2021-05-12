#!/bin/sh

# Exit on command fails
set -o errexit

# create backup folder and move the existed tmux configs
backup () {
    [ -f $HOME/.tmux ] && mv $HOME/.tmux $HOME/.tmux.bkp."$(datetime '+%Y%m%d%H%M%S')"
}

# clone repo
clone () {
    git clone https://github.com/daiyanze/my-tmux-config.git $HOME/.tmux
}

# create symlink
symlink () {
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
}

# Install Start Message
echo 'Installing My Tmux config...'

# Backup .tmux folder
backup

# clone
clone

# link the config file
symlink

# Post-install Instructions
echo "
To complete installation, press <Prefix> + I (capital) to fetch the plugins ($HOME/.tmux/plugins) after first-time of entering Tmux.
"
