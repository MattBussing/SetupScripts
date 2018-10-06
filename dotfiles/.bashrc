#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias vpn='sudo openvpn --config ~/client.ovpn '

# sets cd to change and list the directory
changeDirectory(){
  cd $1
  ls ./
}

wmv2avi(){
  for file in *.wmv;do
  f=${file%.wmv};
  ffmpeg -i $file $f.avi;
  rm $file;
  done
}

alias cd='changeDirectory'
export EDITOR="atom"
export VISUAL=$EDITOR
export UNCRUSTIFY_CONFIG="/home/matt/git/SetupScripts/dotfiles/ben.cfg"



alias sch='cd ~/documents/School'
alias act='source ENV/bin/activate'
