#!/usr/bin/bash

function addMissing {
	if [[ -n $MISSING ]]; then
		MISSING=$MISSING" "
	fi
	MISSING=$MISSING$1
}

read -p "Install favorite applications? " -n 1 INSTALL
if [[ $INSTALL =~ ^[Yy]$ ]]; then
	APPLICATIONS=( "gvim" "git" "vlc" "hub" "guake" "gnome-tweak-tool" "redshift-gtk" "calc" )
	# TODO Before installation, add the repositories needed
	sudo dnf install -qy http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

	MISSING=""

	for dep in $APPLICATIONS; do
		if [[ -z $(command -v $dep) ]]; then
			addMissing $dep
		fi
	done

	if [[ -n $MISSING ]]; then
		sudo dnf -qy install ${MISSING}
		if [[ $? -ne 0 ]]; then
			echo "DNF install failed. Exiting."
			exit 1
		fi
	fi

	# Run install scripts
	cd install-scripts
	for script in `ls` 
	do sh $script
	done

	exit

	echo "These programs were installed: $MISSING"	
else
	echo "\nNot installing applications"
fi

read -p "Want to setup ssh?" -n 1 SSH
if [[ $SSH =~ ^[Yy]$ ]]; then
	if [[ -z $(command -v ssh) ]]; then
		echo "SSH is not installed. Not configuring ssh!";	
	else
		echo "Configuring sshd"
		sudo chkconfig sshd on
		read -p "Want to copy ssh config and keys from somewhere? " -n 1 -r COPY
		if [[ $COPY =~ ^[Yy]$ ]]; then
			read -p "Enter [user@]host: " COPYFROM
			LOCATION=$COPYFROM":~/.ssh/"
			scp -r $LOCATION ~/
		fi
	fi
fi

exit 0;
