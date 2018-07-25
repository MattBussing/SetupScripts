#!/usr/bin/env bash
# author: Matt Bussing
# modified from http://amino.golems.org/installation.html

<<'notes'
Can be run from anywhere
installs all files at home
Changed libav-tools to ffmpeg
Compiled ompl from source

ompl notes
./install-ompl-ubuntu.sh will install OMPL without Python bindings
./install-ompl-ubuntu.sh --python will install OMPL with Python bindings
./install-ompl-ubuntu.sh --app will install OMPL.app with Python bindings
notes

function omplInstall {
    # installs ompl at home
    cd $HOME
    rm install-ompl-ubuntu.sh
    wget http://ompl.kavrakilab.org/core/install-ompl-ubuntu.sh
    chmod u+x install-ompl-ubuntu.sh

    ./install-ompl-ubuntu.sh

    cd $HOME
    rm install-ompl-ubuntu.sh

    # create links for eigen for later use
    sudo ln -sf /usr/include/eigen3/Eigen /usr/local/include/Eigen
    sudo ln -sf /usr/include/eigen3/unsupported /usr/local/include/unsupported

    echo "compiling test program to check for errors"
    # test program from https://eigen.tuxfamily.org/dox/GettingStarted.html
    echo '#include <iostream>
#include <Eigen/Dense>
using Eigen::MatrixXd;
int main()
{
  MatrixXd m(2,2);
  m(0,0) = 3;
  m(1,0) = 2.5;
  m(0,1) = -1;
  m(1,1) = m(1,0) + m(0,1);
  std::cout << m << std::endl;
}' > program.cpp

    g++ program.cpp -o program
    ./program
    echo "did it compile and run?"
    read answer
    rm program
    rm program.cpp
}

function quicklispInstall {
    rm quicklisp.lisp
    wget https://beta.quicklisp.org/quicklisp.lisp
    sbcl --load quicklisp.lisp \
         --eval '(quicklisp-quickstart:install)' \
         --eval '(ql:add-to-init-file)' \
         --eval '(quit)'
    rm quicklisp.lisp
}

function run {
    echo -n $2
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        $1
    fi
}

function installAmino {
    cd $HOME/amino
    run ./configure "configure? (y/n)" $1
    echo "Check to see if configured properly. Press any key to continue"
    read answer
    make
    sudo make install
    # uninstall "make uninstall
}

function runDemo {
    echo -n $1
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        bash $2
    fi
}

################ main ############################
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

run omplInstall "Build OMPL from source? (y/n) "
run quicklispInstall "Install quickLisp? Be careful. If it is already installed it will not reinstall this way (y/n) "

echo -n "Update or clone amino's repo? (y/n) "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    cd $HOME
    if [ ! -d "amino" ]; then
        echo "downloading amino"
        git clone --recursive https://github.com/golems/amino.git
        cd amino
    else
        cd amino
        git pull
    fi
    git submodule init && git submodule update && autoreconf -i
fi

run installAmino "Build amino without demos? (y/n) "

echo -n "Build amino with demos? (y/n) "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    cd $HOME
    echo "update or clone baxter_common? (y/n) "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        if [ ! -d "baxter_common" ]; then
            echo "downloading baxter"
            git clone https://github.com/RethinkRobotics/baxter_common
            cd baxter_common
        else
            cd baxter_common
            git pull
        fi
    else
        cd baxter_common
    fi
    ROS_PACKAGE_PATH=`pwd`/baxter_common
    export ROS_PACKAGE_PATH

    installAmino --enable-demos --enable-demo-baxter

    runDemo "Open static demo? (y/n) " $HOME/amino/demo/urdf/baxter/baxter-simple

    runDemo "Open dynamic demo? (y/n) " $HOME/amino/demo/urdf/baxter/baxter-ompl-sequence

    echo "Here are all the demos"
    find ./demo -type f -executable \
    -not  -name '*.so' \
    -not -path '*.libs*'

fi
