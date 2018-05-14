#<<'comment'
sudo apt-get update
sudo apt-get upgrade
#install packages needed for other programs
sudo apt-get install git curl -y

#comment

#git setup
sudo chmod +x gitSetup.sh
./gitSetup.sh

#git folder setup
sudo chmod +x directorySetup.sh
./directorySetup.sh

#<<'comment'

#chrome setup
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#atom repository setup
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

#update packages
sudo apt-get update
sudo apt-get install atom vim google-chrome-stable openvpn -y

#comment
