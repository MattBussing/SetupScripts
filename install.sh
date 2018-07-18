sudo apt-get update
sudo apt-get install okular
grep -r "application/pdf=" "/usr/share/applications/defaults.list" "/usr/share/xubuntu/applications/defaults.list"
sudo sed -ie 's/application\/pdf=.*/application\/pdf=okular.desktop/g' /usr/share/applications/defaults.list /usr/share/xubuntu/applications/defaults.list
grep -r "application/pdf=" "/usr/share/applications/defaults.list" "/usr/share/xubuntu/applications/defaults.list"
