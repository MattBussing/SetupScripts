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
export EDITOR="vim"
export VISUAL=$EDITOR
export UNCRUSTIFY_CONFIG="/home/matt/git/SetupScripts/dotfiles/ben.cfg"



alias sch='cd ~/Documents/School'
alias act='source ENV/bin/activate'

export VLFEATROOT='/home/matt/src/'

updateLuna(){
	scp -r ~/Documents/School/445/main/* mbussing@luna.mines.edu:/var/www/html/fall_2018/mbussing/
}
final(){
	scp -r ~/Documents/School/445/final_project/* mbussing@luna.mines.edu:/var/www/html/fall_2018/mbussing/final_project/
}
sendLuna(){
	scp  $1 mbussing@luna.mines.edu:/var/www/html/fall_2018/mbussing/$1
}

connectLuna(){
	ssh mbussing@luna.mines.edu
}
