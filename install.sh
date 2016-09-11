echo "export path variable to src folder"
export PATH=$PATH:`pwd`/src
chmod +x `pwd`/src/*
# permanent export by appending it to .bash profile
echo "export PATH=$PATH:`pwd`/src \n chmod +x `pwd`/src/*" >> ~/.bash_profile
echo "finish"
