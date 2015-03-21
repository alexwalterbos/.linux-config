# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias ll='ls -lah'
alias l='ll'
alias fucking='sudo' 
alias fuck='sudo $( history -p !! )' 
alias please='sudo $( history -p !! )' 

export PS1='$(git branch &>/dev/null; if [ $? -eq 0 ]; then \
echo "\[\e[0;32m\][GIT: \[\e[0;31m\]$(basename "`pwd`"); \[\e[0;33m\]$(git branch | grep ^*|sed s/\*\ //) \
$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; if [ "$?" -eq "0" ]; then \
echo "\[\e[0;32m\]clean"; else \
echo "\[\e[0;31m\]dirty"; fi)\[\e[0;32m\]] \$ "; else \
echo "[\u@\h \w] \$ "; fi)\[\e[0m\]'
export TERM=xterm-256color
export EDITOR=vim
export JAVA_HOME=/usr/java/latest/
export MAVEN_OPTS="-Xmx4096m -Xms512m"
alias vim='gvim -v'
alias mv='mv -v'
alias cp='cp -v'
export ANDROID_HOME=/opt/android/android-sdk-linux/
