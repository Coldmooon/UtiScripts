# Determine platform
SYSTEM_NAME=$(uname -s)


if [ SYSTEM_NAME == "Linux" ] ;then
	LINUX=1
elif [ SYSTEM_NAME == "Darwin"] ; then
	OSX=1
else
	OTHER=1
fi

# for Linux
if [ $LINUX == 1 ]; then
	sudo echo "echo \"*** now executing /etc/profile ***\"" >> /etc/profile
	echo "echo \"*** now executing ~/.bashrc ***\"" >> ~/.bashrc
	echo "echo \"*** now executing ~/.profile ***\"" >> ~/.profile
elif [ $OSX == 1]; then
	sudo echo "echo \"*** now executing /etc/profile *** \" " >> /etc/profile
	echo "echo \"*** now executing /etc/bashrc *** \" " >> /etc/bashrc
	echo "echo \"*** now executing ~/.bash_profile *** \" " >> ~/.bash_profile
if

echo "done!"