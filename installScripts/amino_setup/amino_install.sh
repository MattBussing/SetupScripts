#!/usr/bin/env bash
# author: Matt Bussing

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
        libglew-dev libsdl2-dev libfcl-dev libompl-dev \
        sbcl default-jdk blender flex povray ffmpeg \
        coinor-libclp-dev libglpk-dev liblpsolve55-dev
fi

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

# http://amino.golems.org/installation.html
bash quicklisp.sh

<<'paste'
Paste this into terminal for final install
cd amino
cd tmsmt && autoreconf -i don't know if this is needed
./configure && make && make install

paste
