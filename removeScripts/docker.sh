sudo apt-get purge docker.io
sudo apt-get purge docker-ce
sudo apt-get purge docker

sudo sed -ie 's/.*https:\/\/download\.docker\.com\/linux\/ubuntu.*//g' /etc/apt/sources.list /etc/apt/sources.list.save

sudo apt-get update
sudo apt-get autoremove
