# !/usr/bin/bash

# Installs fzf: https://github.com/junegunn/fzf
if [[ -d "~/.fzf" ]]; then 
	echo "fzf is already installed."
	exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
