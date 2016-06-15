# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#export PS1="\[$(tput bold && tput setaf 2)\]\! \[$(tput setaf 3)\]\j \[$(tput setaf 1)\]\$? \[$(tput setaf 7)\][\[$(tput setaf 6)\]\h \[$(tput setaf 4)\]\W$(tput setaf 5)\$(git branch 2> /dev/null | sed -e '/^[^*]/d')\[$(tput setaf 7)\]] $(tput bold)\$ \[$(tput sgr0)\]"

#export PS1="\[$(tput setaf 6)\]\!,\j,\$? [\H \W]\$ \[$(tput sgr0)\]"
#export PS1="?\$? &\j [\H-\l \W] \[$(tput bold)\]!\! \[$(tput sgr0)\]"
# rainbow style
#export PS1="\[$(tput setaf 1 && tput bold)\]?\$?\[$(tput setaf 2)\]!\!\[$(tput setaf 3)\]&\j\[$(tput setaf 4)\]{\W}\[$(tput setaf 5)\]@\H\[$(tput setaf 6)\]-\l\[$(tput setaf 7)\]\$\[$(tput sgr0)\] "

export PATH=$PATH:/usr/local/android-studio/bin
alias rm="rm -i"
alias vimrc="vim ~/.vimrc"
