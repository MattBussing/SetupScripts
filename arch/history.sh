<<'comment'

yaourt -S atom gvfs kde-cli-tools  trash-cli xdg-utils
#issues kdebase-runtime
yaourt -S plasma-desktop

sudo pacman -Syu
sudo pacman -S git
git clone https://gitlab.com/sumner/scripts.git
cd scripts/
bash arch.sh
sudo vim /etc/fstab
yaourt -S lightdm
yaourt -S xfce4
systemctl list-unit-files
systemctl enable lightdm
sudo systemctl enable lightdm.service
yaourt -S lightdm-gtk-greeter xorg-server
echo "add greeter to session-greeter"
sudo vim /etc/lightdm/lightdm.conf

ls /usr/share/xgreeters/
systemctl list-unit-files
sudo systemctl enable NetworkManager
systemctl list-units

yaourt -S spotify


# git clone https://aur.archlinux.org/package-query.git
# pushd package-query makepkg
# 	makepkg -si
# popdf
# git clone https://aur.archlinux.org/yaourt.git
# pushd yaourt
# 	makepkg -si
# popd
# sudo pacman -S xorg xinit-xsession
echo "alias vpn=sudo openvpn --config client.ovpn" >> .bashrc
# ln -sf /path/to/file /path/to/symlink

sets up a linked bashrc
export SCRIPTS="$HOME/documents/setup/"
ln -s $SCRIPTS/.bashrc $HOME
bash main.sh
git clone https://github.com/MattBussing/SetupScripts.git

sudo pacman -S  alsa-utils pulseaudio
sudo pacman -S playerctl
xmodmap -pke
yaourt -S brillo #bakclight
comment
#uninstall from running weird script
yaourt -Rscn ghc-libs
yaourt -S python-virtualenv
virtualenv ENV
sudo pacman -S gcc

yaourt -Syu --aur
yaourt -S thunar
yaourt -Rscn plasma-desktop xfce4
yaourt -S gnome-terminal
yaourt -Rscn zsh
yaourt -S spotifyd
apm install script atom-beautify
yaourt -Rscn nano
yaourt -S base-devel opencv opencv-samples
yaourt -S tk
yaourt -S tk
yaourt -S hdf5
find / -name 'videocapture_starter.cpp' 2>/dev/null
yaourt -S opencv-git
systemctl --user enable onedrive
systemctl --user start onedrive
yaourt -S gdb
yaourt -S ristretto
yaourt -S tumbler
yaourt -S imagemagick
yaourt -S uncrustify
yaourt -S ctags 
yaourt -S ctags for atom
