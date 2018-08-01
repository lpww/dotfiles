#!/usr/bin/env bash

# install packages
pacman -S zsh tmux vim ack python3

# set zsh as default shell
chsh -s /bin/zsh

# backup existing 
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux ~/.tmux.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.ackrc ~/.ackrc.old
mv ~/.gitconfig ~/.gitconfig.old

# create symlinks
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# copy files that cannot be symlinked
cp ~/dotfiles/.ackrc ~/.ackrc
cp ~/dotfiles/.gitconfig ~/.gitconfig

