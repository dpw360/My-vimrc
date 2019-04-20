#!/bin/bash

## This script is designed to install the full software collection for a fresh
## install of an Ubuntu-style distribution. Software to be installed includes:
##     - Snap
##     - VSCode
##     - Vim
##     - vim-plug
##     - Spotify
##     - Chrome
##     - Gnome-Tweaks and theme
##     - VLC
##     - git

## Download snap
sudo apt install snap

## Download git and initialize
sudo apt install git
git config --global user.email "dpw360@gmail.com"
git config --global user.name "dpw360"

## Add the Google Chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

## Update the repositories and install Chrome
sudo apt update
sudo apt install google-chrome-stable

## Remove Firefox
sudo apt remove Firefox

## Install Vim
sudo apt install vim

## Install vim-plug
sudo apt install curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Download my .vimrc file from my github repo
curl fLo ~/.vimrc https://raw.githubusercontent.com/dpw360/startup/master/.vimrc

## Install VSCode
snap install code --classic

## Install Spotify
snap install spotify

## Install VLC
sudo apt install vlc

## Install Gnome-Tweaks and related themes
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install arc-theme

## Update everything
sudo apt update

## Install Java
sudo apt install default-jdk
