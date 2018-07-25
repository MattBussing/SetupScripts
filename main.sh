#!/usr/bin/env bash
# author: Matt Bussing

function ask {
    echo -n "$1 (y/n) "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        $2
    fi
}

function removePrograms {
    declare -a unwanted=(pidgin thunderbird firefox gnome-mines gnome-sudoku sgt-puzzles firefox-locale-en mousepad atril evince)
    for i in "${unwanted[@]}"
    do
        sudo apt-get -y purge --autoremove $i
    done
    ask "Remove Docker?" removeDocker
}

function installPrograms {
    ask "Set up Chrome?" setupChrome
    ask "Set up Atom?" setupAtom
    sudo apt-get update
    declare -a unwanted=(curl git atom vim google-chrome-stable openvpn python3-pip gcc g++ texmaker texlive okular)
    for i in "${unwanted[@]}"
    do
        sudo apt-get -y install $i
    done
    sudo snap install spotify
    ask "Install Postman?" installPostman
    ask "Install Inkscape?" installInkscape
    ask "Install Teamviewer?" installTeamviewer
}

function update {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    sudo apt-get full-upgrade
}

function installPostman {
    #used from https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/
    wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/bin/postman
}

function setupChrome {
    #chrome repo setup
    sudo apt-get -y install curl
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
}

function setupAtom {
    #atom repository setup
    curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

}

function gitSetup {
    echo "git setup, assuming you want to store your password"
    echo "enter your email: "
    read email
    echo "enter your user name:"
    read user
    git config --global user.email $email
    git config --global user.name $user
    git config --global credential.helper store
    git config --global core.editor "vim"
}

function setupGitDirectory {
    #git folder setup
    cd $HOME
    mkdir git
    cd git
    git clone https://github.com/MattBussing/DistancePi.git
    git clone https://github.com/MattBussing/SetupScripts.git
}

function removeDocker {
    sudo apt-get purge docker.io
    sudo apt-get purge docker-ce
    sudo apt-get purge docker

    sudo sed -ie 's/.*https:\/\/download\.docker\.com\/linux\/ubuntu.*//g' /etc/apt/sources.list /etc/apt/sources.list.save

    sudo apt-get update
    sudo apt-get autoremove
}

function installInkscape {
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt-get update
    sudo apt-get -y install inkscape
}

function installTeamviewer {
    echo "broken"
    # wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -
    # apt install ./teamviewer_13.x.yyy_[arch].deb
}
########### MAIN ################################
ask "Remove unwanted programs?" removePrograms
ask "Update system?" update
ask "Install programs?" installPrograms
ask "Set up git?" gitSetup
ask "Set up git directories?" setupGitDirectory
