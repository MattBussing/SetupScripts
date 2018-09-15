#!/usr/bin/env bash
# author: Matt Bussing

DOTFILES="$HOME/documents/git/SetupScripts/dotfiles"
CONFIG="$HOME/.config"
I3="i3"
I3STATUS="i3status"

function ask {
    echo -n "$1 (y/n) "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        $2
    fi
}

function linkDotFiles(){
  # sets up directory
  if [ ! -d $CONFIG/i3status ]; then
  mkdir $CONFIG/i3status
  fi

  # sets up a linked config files
  ln -sf $DOTFILES/.bashrc $HOME
  ln -sf $DOTFILES/i3/config $CONFIG/$I3/
  ln -sf $DOTFILES/i3status/config $CONFIG/$I3STATUS/
  ln -sf $DOTFILEs/.profile $HOME
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
