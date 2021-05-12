#!/bin/sh

# Exit on command fails
set -o errexit

# create backup folder and move the existed tmux configs
backup () {
    if [ -d $HOME/.tmux ]; then
        bkp_dir=$HOME/.tmux.bkp."$(date '+%Y%m%d%H%M%S')"
        mv $HOME/.tmux $bkp_dir
        echo "Moved .tmux/ to backup folder $bkp_dir"
        echo ''
    fi
}

# clone repo
clone () {
    git clone https://github.com/daiyanze/my-tmux-config.git $HOME/.tmux
    mkdir -p $HOME/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    echo ''
}

# create symlink
symlink () {
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
    echo "Created symlink to $HOME/.tmux.conf"
    echo ''
}

# Install Start Message
echo 'Installing My Tmux config...'
echo ''

# Backup .tmux folder
backup

# clone
clone

# link the config file
symlink

# Post-install Instructions
echo '========================'
echo 'To complete installation' 
echo '========================'
echo "press <Prefix> + I (capital) to fetch the plugins ($HOME/.tmux/plugins) after first-time of entering Tmux."
echo ''

