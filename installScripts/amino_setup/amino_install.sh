#!/usr/bin/env bash
# author: Matt Bussing
# http://amino.golems.org/installation.html

<<'notes'
Changed libav-tools to ffmpeg

notes

echo -n "Update packages? (y/n) "
read answer
# install dependecies
if [ "$answer" != "${answer#[Yy]}" ]; then
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install git gcc g++ make build-essential\
        gfortran autoconf automake libtool autoconf-archive \
        autotools-dev maxima libblas-dev liblapack-dev \
        libglew-dev libsdl2-dev libfcl-dev \
        sbcl default-jdk blender flex povray ffmpeg \
        coinor-libclp-dev libglpk-dev liblpsolve55-dev
fi

bash ompl.sh
##### testing ###
# cd $HOME/git
# TODO fix install location
if [ ! -d "test" ]; then
    mkdir test
fi
cd test
##### end #####

if [ ! -d "amino" ]; then
    echo "downloading amino"
    git clone --recursive https://github.com/golems/amino.git
fi

bash ../quicklisp.sh

cd amino
git submodule init && git submodule update && autoreconf -i
./configure
make
sudo make install
# uninstall "make uninstall
