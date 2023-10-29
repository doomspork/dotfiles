#!/bin/bash
CWD=$(pwd -P)

mv ~/.zshrc ~/.zshrc.bak

rm -f ~/.config/nvim/lua/plugins/user.lua 
rm -rf ~/.config/nvim/lua/user

ln -fs ${cwd}/nvim/plugins/user.lua ~/.config/nvim/lua/plugins/user.lua 
ln -Fs ${CWD}/nvim/user ~/.config/nvim/lua
ln -Fs ${CWD}/.zshrc ~/.zshrc

git clone --depth 1 https://github.com/utensils/colors.vim

rm -rf ~/.config/nvim/colors
ln -Fs ${CWD}/colors.vim ~/.config/nvim/colors
