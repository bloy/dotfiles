# vim: set sw=2 sts=2:

if [ -d ~/.keychain ]; then
        eval `keychain --eval --inherit local-once --noask --nolock --quick --quiet`
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
# redhat
fi
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc  
# debian
fi

# Environment

PAGER=less
LESS='-m -R'
EDITOR=vim
VISUAL=$EDITOR
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/local/sbin:$PATH
PATH="$HOME/bin:$PATH"
BASH_ENV="$HOME/.bashrc"
RSYNC_RSH=ssh
export NCURSES_NO_UTF8_ACS=1

export PATH BASH_ENV USERNAME RSYNC_RSH
export PAGER LESS EDITOR VISUAL 

# aliases

alias ls='ls -bhF'
alias du='du -h'
alias df='df -h'
alias rs='eval `resize -s 24 80`'
alias vi=vim
if [ "1$OSTYPE" = "1cygwin" ]; then
  alias start='cygstart'
  alias traceroute='tracert'
fi

# functions

svndiff() {
        svn diff "${@}" | colordiff
}

# color ls -- if dircolors is present, assume we've got a recent gnu ls also
founddc=0
for dir in /bin /usr/bin /usr/local/bin; do
  if [ -e $dir/dircolors ]; then
    founddc=1
  fi
done
if [ "x"$founddc == "x1" ]; then
  eval `dircolors -b ~/.dircolors`
  alias ls='ls -bhF --color'
  alias rgrep='rgrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias grep='grep --color=auto'
fi
unset founddc

# shell behavior

set -o ignoreeof
set -o interactive-comments
set -o notify
shopt -s histappend
FIGNORE=~:.o:CVS:RCS:.svn:~
HISTCONTROL=ignoredups

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ "PS1" ]; then
  PROMPTCOLOR=""
  NOCOLOR=""
  PROMPT_COMMAND='history -a'

  PS1="$PROMPTCOLOR\h$NOCOLOR [\w]\$(__git_ps1 ' |%s|')$PROMPTCOLOR\\\$$NOCOLOR "
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

. ~/.dotfiles/.bash/bash_completion_tmux.sh

if [ -f ~/.bashrc-local ]; then
  . ~/.bashrc-local
fi
