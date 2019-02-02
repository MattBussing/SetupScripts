#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="vim"
export VISUAL="atom"

alias ls='ls --color=auto'
# sets cd to change and list the directory
changeDirectory(){
  cd $1
  ls ./
}
alias cd='changeDirectory'


alias vpn='sudo openvpn --config ~/.client.ovpn '

connect440(){
	ssh mbussing@eecs-hpc-1.mines.edu
}

copyHw(){
	scp -r ~/Documents/School/440/hw/ mbussing@eecs-hpc-1.mines.edu:/home/mbussing/
}

alias sch='cd ~/Documents/School'
alias act='source ENV/bin/activate'

#export VLFEATROOT='/home/matt/src/'
#export UNCRUSTIFY_CONFIG="/home/matt/git/SetupScripts/dotfiles/ben.cfg"
#PS1='[\u@\h \W]\$ '
#wmv2avi(){
#  for file in *.wmv;do
#  f=${file%.wmv};
#  ffmpeg -i $file $f.avi;
#  rm $file;
#  done
#}
