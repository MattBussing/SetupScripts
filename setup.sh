<<'comment'
Other things needed to be done:
1. Setup mirrors by going to settings-> Software & Updates -> Download...:
    choose best server.
2. Change background
comment

#remove unwanted programs
bash remove.sh

#update everything
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get full-upgrade

#install packages needed for other programs
sudo apt-get install -y curl

#chrome repo setup
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#atom repository setup
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

#install packages
sudo apt-get -y install git atom vim google-chrome-stable openvpn
#install spotify
sudo snap install spotify

# sudo apt-get install python3-pip gcc g++ -y

#git setup
bash gitSetup.sh
#git setup
bash directorySetup.sh
