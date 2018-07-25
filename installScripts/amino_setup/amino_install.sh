#!/usr/bin/env bash
# author: Matt Bussing
# modified from http://amino.golems.org/installation.html

<<'notes'
run this in amino_install.sh directory
installs all files at home
Changed libav-tools to ffmpeg
Compiled ompl from source
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

echo -n "Build OMPL from source? (y/n) "
read answer
# install dependecies
if [ "$answer" != "${answer#[Yy]}" ]; then
    bash ompl.sh
fi

echo -n "Install quickLisp? (y/n) "
read answer
# install dependecies
if [ "$answer" != "${answer#[Yy]}" ]; then
    bash quicklisp.sh
fi

cd $HOME

if [ ! -d "amino" ]; then
    echo "downloading amino"
    git clone --recursive https://github.com/golems/amino.git
    git submodule init && git submodule update && autoreconf -i
fi

echo -n "Build amino without demos? (y/n) "
read answer
# install dependecies
if [ "$answer" != "${answer#[Yy]}" ]; then
    cd $HOME/amino
    ./configure
    make
    sudo make install
    # uninstall "make uninstall
fi

echo -n "Build Demos? (y/n) "
read answer
# install dependecies
if [ "$answer" != "${answer#[Yy]}" ]; then
    cd $HOME
    git clone https://github.com/RethinkRobotics/baxter_common
    export ROS_PACKAGE_PATH=`pwd`/baxter_common

    cd amino
    ./configure --enable-demos --enable-demo-baxter
    make
    sudo make install

    find ./demo -type f -executable \
    -not  -name '*.so' \
    -not -path '*.libs*'
fi
