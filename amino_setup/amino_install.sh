#run via bahs amino_install.sh

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git gcc g++ make

cd $HOME/git
if [! -d "amino"]; then
git pull https://github.com/golems/amino.git
fi
cd amino
cd tmsmt && autoreconf -i
