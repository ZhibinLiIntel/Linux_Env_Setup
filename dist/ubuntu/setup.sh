#!/bin/bash

echo -e "\nEntering Ubuntu configuration directory ...\n"

sudo apt update

echo "=================================================================================="
echo "Setuping Vim ..."
sudo apt install vim -y
cp -r $DIST_ROOT/vim/vim ~/.vim
cp $DIST_ROOT/vim/vimrc ~/.vimrc
echo "Vim Setup Done"
echo "=================================================================================="

echo -e "\n=================================================================================="
echo "Setuping Tmux ..."
sudo apt install tmux -y
cp $DIST_ROOT/tmux/tmux.conf ~/.tmux.conf
cp $DIST_ROOT/tmux/tmux.conf.local ~/.tmux.conf.local
echo "Tmux Setup Done"
echo "=================================================================================="

echo -e "\n=================================================================================="
echo "Setuping Powerline ..."
sudo apt install powerline fonts-powerline -y
grep -q "powerline-daemon" ~/.bashrc
[ $? -ne 0 ] && cat $DIST_ROOT/powerline/bashrc >> ~/.bashrc
sudo apt install python-pip
pip install powerline-gitstatus --user
POWERLINE_LOCAL_CONFIG=~/.config/powerline/
POWERLINE_GLOBAL_CONFIG=/usr/share/powerline/config_files/
mkdir -p $POWERLINE_LOCAL_CONFIG
sudo cp -r $POWERLINE_GLOBAL_CONFIG/* $POWERLINE_LOCAL_CONFIG
sudo chown $USER:$USER $POWERLINE_LOCAL_CONFIG -R
cp -r $DIST_ROOT/powerline/{colorschemes,themes} $POWERLINE_LOCAL_CONFIG
powerline-daemon --replace
exec bash
echo "Powerline Setup Done"
echo "=================================================================================="
