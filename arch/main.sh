#!/usr/bin/env bash
# author: Matt Bussing

DOTFILES="$HOME/documents/setup/SetupScripts/dotfiles"
I3CONFIG="$HOME/.config/i3"
function ask {
    echo -n "$1 (y/n) "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        $2
    fi
}

function linkDotFiles(){
  # sets up a linked bashrc
  ln -sf $DOTFILES/.bashrc $HOME
  ln -sf $DOTFILES/config $I3CONFIG
}


function gitSetup {
    echo "git setup, assuming you want to store your password"
    echo "enter your email: "
    read email
    echo "enter your user name:"
    read user
    git config --global user.email $email
    git config --global user.name $user
    git config --global credential.helper store
    git config --global core.editor "vim"
}



ask "set up git?" gitSetup
ask "link dot files" linkDotFiles
