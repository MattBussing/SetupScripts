#!/usr/bin/env bash
# author: Matt Bussing
echo "git setup, assuming you want to store your password"
echo "enter your email: "
read email
echo "enter your user name:"
read user
git config --global user.email $email
git config --global user.name $user
git config --global credential.helper store
git config --global core.editor "vim"
