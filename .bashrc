# vim: set sw=2 sts=2:

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

scm_prompt() {
        SCM_PROMPT_DIRTY=' ✗'
        SCM_PROMPT_CLEAN=' ✓'
        gitstat=$(git status -s 2>/dev/null)
        if [ $? -eq 0 ]; then 
                SCM='git'
                SCM_CHAR=' ±'
                if [[ -n $gitstat ]]; then
                        state=$SCM_PROMPT_DIRTY
                else
                        state=$SCM_PROMPT_CLEAN
                fi
                ref=$(git symbolic-ref HEAD 2> /dev/null)
                SCM_INFO="$state |${ref#refs/heads/}|"
        elif [[ -d .svn ]]; then
                SCM='svn'
                SCM_CHAR=' σ'
                if [[ -n $(svn status 2> /dev/null) ]]; then 
                        state=$SCM_PROMPT_DIRTY
                else
                        state=$SCM_PROMPT_CLEAN
                fi
                ref=$(svn info 2> /dev/null | awk -F/ '/^URL:/ { for (i=0; i<=NF; i++) { if ($i == "branches" || $i == "tags" ) { print $(i+1); break }; if ($i == "trunk") { print $i; break } } }') || return
                SCM_INFO="$state |$ref|"
        else 
                SCM='NONE'
                SCM_CHAR=''
                SCM_INFO=''
        fi
        echo -n "$SCM_CHAR$SCM_INFO"
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
  TITLEBAR='\[\e]2;\h: \w\e\\\]'
  PROMPTCOLOR="\[\033[1m\]"
  NOCOLOR="\[\033[0m\]"
  PROMPT_COMMAND='history -a'

  PS1="$TITLEBAR$PROMPTCOLOR\h$NOCOLOR [\w]\$(scm_prompt)$PROMPTCOLOR\\\$$NOCOLOR "
fi

if [ -f ~/.bashrc-local ]; then
  . ~/.bashrc-local
fi
