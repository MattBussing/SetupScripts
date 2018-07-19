sudo apt-get update
# remove old viewers
sudo apt-get purge atril
sudo apt-get purge evince
sudo apt-get autoremove
# add new viewer
sudo apt-get install okular
# grep -r "application/pdf=" "/usr/share/applications/defaults.list" "/usr/share/xubuntu/applications/defaults.list"
# sudo sed -ie 's/application\/pdf=.*/application\/pdf=okular.desktop/g' /usr/share/applications/defaults.list /usr/share/xubuntu/applications/defaults.list
# grep -r "application/pdf=" "/usr/share/applications/defaults.list" "/usr/share/xubuntu/applications/defaults.list"
