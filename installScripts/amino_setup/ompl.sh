rm install-ompl-ubuntu.sh
wget http://ompl.kavrakilab.org/core/install-ompl-ubuntu.sh
chmod u+x install-ompl-ubuntu.sh
<<'notes'
./install-ompl-ubuntu.sh will install OMPL without Python bindings
./install-ompl-ubuntu.sh --python will install OMPL with Python bindings
./install-ompl-ubuntu.sh --app will install OMPL.app with Python bindings
notes

./install-ompl-ubuntu.sh

rm install-ompl-ubuntu.sh
# create links for eigen for later use
sudo ln -sf /usr/include/eigen3/Eigen /usr/local/include/Eigen
sudo ln -sf /usr/include/eigen3/unsupported /usr/local/include/unsupported

echo "compiling test program to check for errors"
g++ progam.cpp -o my_program
./my_program
echo "did it compile and run?"
