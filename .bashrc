# vim: set sw=2 sts=2:

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.bashrc-local ]; then
  . ~/.bashrc-local
fi

# Environment

PAGER=less
LESS='-m'
EDITOR=vim
VISUAL=$EDITOR
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/sbin:$PATH
PATH="$HOME/bin:$PATH"
BASH_ENV="$HOME/.bashrc"
CVS_RSH=ssh
RSYNC_RSH=ssh

export PATH BASH_ENV USERNAME CVS_RSH RSYNC_RSH
export PAGER LESS EDITOR VISUAL

function fgcolor { 
  echo -en '\e]10;' 
  echo -n $*
  echo -ne '\a'
}
function bgcolor { 
  echo -en '\e]11;' 
  echo -n $*
  echo -ne '\a'
}
function crcolor { 
  echo -en '\e]12;' 
  echo -n $*
  echo -ne '\a'
}
function windowtitle { 
  echo -en '\e]0;' 
  echo -n $*
  echo -ne '\a'
}

# aliases

alias ls='ls -bhF --color=tty'
alias du='du -h'
alias df='df -h'
alias rs='eval `resize -s 24 80`'
alias vi=vim
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

if [ -f "$HOME/.dircolors" ]; then
  eval `dircolors --sh "$HOME/.dircolors"`
fi

if [ "PS1" ]; then
  if [ "x$WINDOW" != "x" ]; then
    SCREENTITLE="screen $WINDOW: "
  else
    SCREENTITLE=""
  fi
  TITLEBAR="\[\e]0;\h: ${SCREENTITLE}\w\a\]";
  PROMPTCOLOR="\[\033[1m\]"
  NOCOLOR="\[\033[0m\]"

  case $TERM in
    screen)
      ;;
    xterm*)
      ;;
    cygwin)
      ;;
    *)
      TITLEBAR=""
      ;;
  esac
  
  PS1="$TITLEBAR\h [\w]\\\$ "
fi
