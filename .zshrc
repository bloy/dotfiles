if [ -f ~/.zshrc-local-pre ]; then
  . ~/.zshrc-local-pre
fi

fpath=(~/.dotfiles/zsh ~/.dotfiles/zsh-completions $fpath)

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

autoload -Uz compinit
if [[ $OSTYPE == "cygwin" ]]; then
  compinit -u
  # ignore security checks on compinit for cygwin, because cygwin
else
  compinit
fi
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt incappendhistory sharehistory extendedhistory histallowclobber
setopt histignoredups histexpiredupsfirst histsavenodups histfindnodups
setopt notify noclobber promptsubst
unsetopt beep
bindkey -e

if [[ -d ~/.keychain ]]; then
  eval `keychain --eval --inherit local-once --noask --nolock --quick --quiet`
fi

export PAGER=less
export LESS='-m -R'
export EDITOR=vi
export VISUAL=$EDITOR
export PATH="$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH"
export RSYNC_RSH=ssh
export NCURSES_NO_UTF8_ACS=1

# aliases

alias ls='ls -bhF'
alias du='du -h'
alias df='df -h'

whence dircolors >& /dev/null
if [[ $? -eq 0 ]]; then
  eval `dircolors -b ~/.dircolors`
  alias ls='ls -bhF --color'
  alias rgrep='rgrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias grep='grep --color=auto'
fi

# functions

svndiff() {
  svn diff "${0}" | colordiff
}

autoload -Uz colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn

autoload -Uz promptinit && promptinit
prompt mike

xterm_title_precmd() {
  print -Pn "\e]0;%n@%M: %~\a"
}

if [[ -z $ZSH_NO_PRECMD ]]; then
  case $TERM in
    *xterm*)
      add-zsh-hook precmd xterm_title_precmd
  esac
fi

if [ -f ~/.zshrc-local ]; then
  . ~/.zshrc-local
fi
