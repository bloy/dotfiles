if [ -f ~/.zshrc-local-pre ]; then
  . ~/.zshrc-local-pre
fi

fpath=(~/.dotfiles/zsh ~/.dotfiles/zsh-completions/src $fpath)

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
bindkey -v
bindkey '^R' history-incremental-search-backward

if [[ -d ~/.keychain ]]; then
  eval `keychain --eval --inherit local-once --noask --nolock --quick --quiet`
fi

export PAGER=less
export LESS='-m -R'
export EDITOR=vi
export VISUAL=$EDITOR
export RSYNC_RSH=ssh
export NCURSES_NO_UTF8_ACS=1

prepend_path() {
  if [[ ${path[(i)$1]} -gt ${#path} ]]; then
    path[1]=($1 $path[1])
  else
    path[${path[(i)$1]}]=()
    path[1]=($1 $path[1])
  fi
}

prepend_path "/usr/local/sbin"
prepend_path "/usr/sbin"
prepend_path "/sbin"
prepend_path "$HOME/.dotfiles/bin"
prepend_path "$HOME/bin"

# python
export PIP_RESPECT_VIRTUALENV=true

# aliases

alias ls='ls -bhF'
alias du='du -h'
alias df='df -h'

if (whence dircolors >& /dev/null); then
  eval `dircolors -b`
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls -bhF --color'
  alias rgrep='rgrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias grep='grep --color=auto'
fi

# functions

svndiff() {
  svn diff "${*}" | colordiff
}

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
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

if [[ -d "$HOME/.rbenv/bin" ]]; then
  prepend_path "$HOME/.rbenv/bin"
  prepend_path "$HOME/.rbenv/shims"
  source "$HOME/.rbenv/completions/rbenv.zsh"
fi

if [[ -d "$HOME/.rvm" ]]; then
  prepend_path "$HOME/.rvm/bin"
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

if [[ -d "$HOME/.pyenv/bin" ]]; then
  prepend_path "$HOME/.pyenv/bin"
  prepend_path "$HOME/.pyenv/shims"
  source "$HOME/.pyenv/completions/pyenv.zsh"
fi

if [ -f ~/.zshrc-local ]; then
  . ~/.zshrc-local
fi
