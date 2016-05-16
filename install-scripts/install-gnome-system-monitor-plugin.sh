if [[ -e "~/.local/share/system-monitor@paradoxxx.zero.gmail.com" ]]; then
	echo "Gnome extension system-monitor is already installed."
	exit 0;
fi
cd ~/repos
git clone git://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git
mkdir -p ~/.local/share/gnome-shell/extensions
cd ~/.local/share/gnome-shell/extensions
ln -s ~/repos/gnome-shell-system-monitor-applet/system-monitor@paradoxxx.zero.gmail.com
gnome-shell-extension-tool --enable-extension=system-monitor@paradoxxx.zero.gmail.com
