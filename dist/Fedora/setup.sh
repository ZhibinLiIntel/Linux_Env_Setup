#!/bin/bash

echo -e "${GREEN}\nSetting up Fedora...\n${RST}"

echo -e "${GREEN}==================================================================================${RST}"
echo "Setting up Vim ..."
sudo dnf install vim -y
cp -r $DIST_ROOT/vim/vim ~/.vim
cp $DIST_ROOT/vim/vimrc ~/.vimrc
echo "Vim Setup Done"
echo -e "${GREEN}==================================================================================${RST}"

echo -e "${GREEN}==================================================================================${RST}"
echo "Setting up Tmux ..."
sudo dnf install tmux -y
cp $DIST_ROOT/tmux/tmux.conf ~/.tmux.conf
cp $DIST_ROOT/tmux/tmux.conf.local ~/.tmux.conf.local
cp $DIST_ROOT/tmux/tmux.conf.debug ~/.tmux.conf.debug
echo "Tmux Setup Done"
echo -e "${GREEN}==================================================================================${RST}"

echo -e "${GREEN}==================================================================================${RST}"
echo "Setting up Powerline ..."
sudo dnf install powerline powerline-fonts -y
grep -q "powerline-daemon" ~/.bashrc
[ $? -ne 0 ] && cat powerline/bashrc >> ~/.bashrc
sudo dnf install python-pip
pip install powerline-gitstatus --user
POWERLINE_LOCAL_CONFIG=~/.config/powerline/
POWERLINE_GLOBAL_CONFIG=/etc/xdg/powerline/config_files/
mkdir -p $POWERLINE_LOCAL_CONFIG
sudo cp -r $POWERLINE_GLOBAL_CONFIG/* $POWERLINE_LOCAL_CONFIG
sudo chown $USER:$USER $POWERLINE_LOCAL_CONFIG -R
cp -r $DIST_ROOT/powerline/{colorschemes,themes} $POWERLINE_LOCAL_CONFIG
powerline-daemon --replace
echo "Powerline Setup Done"
echo -e "${GREEN}==================================================================================${RST}"

echo -e "${GREEN}==================================================================================${RST}"
echo "Setting up GDB"
sudo dnf install gdb -y
pip install pygments
cp $DIST_ROOT/gdb/gdbinit ~/.gdbinit
mkdir -p ~/.gdbinit.d
echo -e "${GREEN}==================================================================================${RST}"
