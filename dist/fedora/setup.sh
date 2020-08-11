#!/bin/bash

echo -e "\nEntering Fedora configuration directory ...\n"

echo "=================================================================================="
echo "Setuping Vim ..."
sudo dnf install vim -y
cp -r $DIST_ROOT/vim/vim ~/.vim
cp $DIST_ROOT/vim/vimrc ~/.vimrc
echo "Vim Setup Done"
echo "=================================================================================="

echo -e "\n=================================================================================="
echo "Setuping Tmux ..."
sudo dnf install tmux -y
cp $DIST_ROOT/tmux/tmux.conf ~/.tmux.conf
cp $DIST_ROOT/tmux/tmux.conf.local ~/.tmux.conf.local
echo "Tmux Setup Done"
echo "=================================================================================="

echo -e "=================================================================================="
echo "Setuping Powerline ..."
sudo dnf install powerline powerline-fonts -y
grep -q "powerline-daemon" ~/.bashrc
[ $? -ne 0 ] && cat powerline/bashrc >> ~/.bashrc
source ~/.bashrc
echo "Powerline Setup Done"
echo "=================================================================================="
