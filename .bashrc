# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Environment

PAGER=less
LESS='-m'
EDITOR=vim
VISUAL=$EDITOR
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$HOME/bin:$PATH
BASH_ENV=$HOME/.bashrc
USERNAME=bloy
CVS_RSH=ssh
RSYNC_RSH=ssh

export PATH BASH_ENV USERNAME CVS_RSH RSYNC_RSH
export PAGER LESS EDITOR VISUAL

function fgcolor { 
  echo -en '\e]39;' 
  echo -n $*
  echo -ne '\a'
}
function bgcolor { 
  echo -en '\e]49;' 
  echo -n $*
  echo -ne '\a'
}
function windowtitle { 
  echo -en '\e]0;' 
  echo -n $*
  echo -ne '\a'
}
function big-vim {
  eval `resize`
  local OLDLINES=$LINES
  local OLDCOLUMNS=$COLUMNS
  eval `resize -s 43 105`
  clear
  echo "Loading VIM. Please Wait"
  echo -en '\e]0;' 
  echo -n ${HOSTNAME}: VIM
  echo -ne '\a'
  vim -c WMToggle $*
  clear
  eval `resize -s $OLDLINES $OLDCOLUMNS`
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

if [ -f $HOME/.dircolors ]; then
  eval `dircolors --sh $HOME/.dircolors`
fi

if [ -f $HOME/.bash_complete ]; then
    . $HOME/.bash_complete
fi

if [ "PS1" ]; then
  XTERM_TITLE="\[\e]0;\u@\h:\w\a\]";
  PROMPTCOLOR="\[\e[1m\]"
  NOCOLOR="\[\e[0m\]"

  case $TERM in
    screen)
      ;;
    xterm*)
      ;;
    cygwin)
      ;;
    *)
      XTERM_TITLE=""
      ;;
  esac
  
  PS1="${XTERM_TITLE}${PROMPTCOLOR}\h${NOCOLOR} [\w]${PROMPTCOLOR}\\\$${NOCOLOR} "
fi
