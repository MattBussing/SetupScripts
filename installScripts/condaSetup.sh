#Authors: ProKarma, Matt Bussing
# This script is designed to work with Ubuntu 16.04 LTS

# Installation includes but not limited to: Anaconda 3.5 (Python 3.6), Keras with backend TensorFlow for CPU,
#     and a password protected Jupter Notebook setup

echo -n "This script installs a quick start data science environment. Proceed with installation? (y/n) "
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
    # ensure system is updated and has build tools
	sudo apt-get update
	sudo apt-get --assume-yes upgrade
	sudo apt-get --assume-yes install git
	sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
	sudo apt-get --assume-yes install software-properties-common


	echo "-------- DOWNLOADING & INSTALLING ANACONDA --------"
	if [ ! -d "downloads" ]; then
		mkdir downloads
	fi

	cd downloads

	# if anaconda3 not already installed
	if [ ! -d $HOME/anaconda3/ ]; then
		# install Anaconda for current user
		if [ -e ./Anaconda3-5.1.0-Linux-x86_64.sh ]; then
			bash "Anaconda3-5.1.0-Linux-x86_64.sh" -b
		else
			wget "https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh" -O "Anaconda3-5.1.0-Linux-x86_64.sh"
			bash "Anaconda3-5.1.0-Linux-x86_64.sh" -b
		fi
		echo "export PATH=$HOME/anaconda3/bin:$PATH" >> ~/.bashrc
		export PATH="$HOME/anaconda3/bin:$PATH"
	fi
	conda update -n base conda
	conda install -y bcolz
	conda upgrade -y --all

	echo "-------- INSTALLING TENSORFLOW & KERAS --------"
	# install and configure tensorflow and keras
	pip install --upgrade pip
	yes | pip install tensorflow
	yes | pip install keras
	# yes | pip install pyaudio

	if [ ! -d ~/.keras ];then
		mkdir ~/.keras
		echo "making keras"
	fi

	echo '{
		"image_dim_ordering": "tf",
		"epsilon": 1e-07,
		"floatx": "float32",
		"backend": "tensorflow"
	}' > ~/.keras/keras.json

	echo "-------- CONFIGURE JUPYTER NOTEBOOK --------"
	# configure jupyter and prompt for password
	jupyter notebook --generate-config
	jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
	echo "c.NotebookApp.password = u'"$jupass"'" >> $HOME/.jupyter/jupyter_notebook_config.py

	echo "+++++++++++ Quick Start data science environment setup complete +++++++++++"
	echo "You can now start a jupyter notebook session. If you're connecting to a remote machine, create an ssh tunnel to this \
remote jupyter server from your local machine, and use the password you just setup to access the session in a browser"

	#update conda
else
    echo "If you would like to install the quick start data science environment enter 'y'"
fi
