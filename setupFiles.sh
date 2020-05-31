#!/bin/bash

for file in ~/dotfiles/zsh/.z* ; do
  echo "Creating a symbolic link for $file"
  ln -fs $file ~/ 
done

for file in ~/dotfiles/vim/.vim* ; do
  echo "Creating a symbolic link for $file"
  ln -fs $file ~/
done 
