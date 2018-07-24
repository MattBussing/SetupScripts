rm install-ompl-ubuntu.sh
wget http://ompl.kavrakilab.org/core/install-ompl-ubuntu.sh
chmod u+x install-ompl-ubuntu.sh
<<'notes'
./install-ompl-ubuntu.sh will install OMPL without Python bindings
./install-ompl-ubuntu.sh --python will install OMPL with Python bindings
./install-ompl-ubuntu.sh --app will install OMPL.app with Python bindings
notes

./install-ompl-ubuntu.sh --python

rm install-ompl-ubuntu.sh
