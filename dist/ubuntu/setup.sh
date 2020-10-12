#!/bin/bash

echo -e "\nEntering Ubuntu configuration directory ...\n"

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
source ~/.bashrc
echo "Powerline Setup Done"
echo "=================================================================================="
