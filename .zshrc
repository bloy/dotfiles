autoload Misc/colors

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/mike/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt incappendhistory sharehistory extendedhistory histallowclobber
setopt histignoredups histexpiredupsfirst histsavenodups histfindnodups
setopt notify noclobber
unsetopt beep
bindkey -v

if [[ -d ~/.keychain ]]; then
  eval `keychain --eval --inherit local-once --noask --nolock --quick --quiet`
fi

export PAGER=less
export LESS='-m -R'
export EDITOR=vi
export VISUAL=EDITOR
export PATH="$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH"
export RSYNC_RSH=ssh
export NCURSES_NO_UTF8_ACS=1

PS1="%B%T%b %n@%m:%1~%B%#%b "
RPS1="[%B%~%b]"

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

if [ -f ~/.zshrc-local ]; then
  . ~/.zshrc-local
fi
