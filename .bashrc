# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Environment

PAGER=less
LESS='-m'
EDITOR=vi
VISUAL=$EDITOR
PATH=$HOME/bin:$PATH
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/sbin:$PATH
BASH_ENV=$HOME/.bashrc
USERNAME=bloy
CVS_RSH=ssh
RSYNC_RSH=ssh

export PATH BASH_ENV USERNAME CVS_RSH RSYNC_RSH
export PAGER LESS EDITOR VISUAL

# aliases

alias ls='ls -bhF --color=tty'
alias du='du -h'
alias df='df -h'
if [ "1$OSTYPE" = "1cygwin" ]; then
  alias start='cygstart'
  alias traceroute='tracert'
fi

# shell behavior

set -o ignoreeof
set -o interactive-comments
set -o noclobber
set -o notify
FIGNORE=~:.o:CVS:RCS
HISTCONTROL=ignoredups

if [ -f $HOME/.dircolors ]; then
  eval `dircolors --sh $HOME/.dircolors`
fi

if [ -f $HOME/.bash_complete ]; then
    . $HOME/.bash_complete
fi

if [ "PS1" ]; then
  PS1_EXTRA="\e]0;\u@\h: [\w]\a";

  case $TERM in
    screen)
      ;;
    xterm*)
      ;;
    cygwin)
      ;;
    *)
      PS1_EXTRA=""
      ;;
  esac
  
  PS1="\[$PS1_EXTRA\e[1;37m\]\h\[\e[0m\] [\w]\[\e[1;37m\]\\\$\[\e[0m\] "
fi
