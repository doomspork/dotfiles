#!/bin/bash
CWD=$(pwd -P)

ln -Fs ${CWD}/nvim/plugins/user.lua ~/.config/nvim/lua/plugins/user.lua 
ln -Fs ${CWD}/nvim/user ~/.config/nvim/lua/user
ln -Fs ${CWD}/.zshrc ~/.zshrc

git clone --depth 1 https://github.com/utensils/colors.vim ~/.config/nvim/colors
