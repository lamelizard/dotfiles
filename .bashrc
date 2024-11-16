# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# allow usage of Ctrl-s
bind -r '\C-s'
stty -ixon

# edit like vi
# set -o vi

#don't write "cd"
shopt -s autocd

#enable globstar **
shopt -s globstar

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Path
export PATH="$HOME/.bin:$PATH"
# snap
export PATH="/snap/bin:$PATH"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# FZF completion
if [ -f ~/.bash_fzf ]; then
    . ~/.bash_fzf
fi

# prompt
if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
else
  # simple prompt
  PS1=" \[\033[1;36m\]\w \$>\[\033[1;34m\]>\[\033[0m\] "
fi

# less:
# ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

#untested:
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# add color to man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# libsecret: ask for password on credentials request (e.g. for git)
export SECRET_SEARCH_UNLOCK=1

# start tmux with bash (if it exists)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # Check if a bash -c command is being executed
  if [[ -n "$BASH_COMMAND" ]]; then
    exec tmux new-session -u -d "$BASH_COMMAND"
  else
    exec tmux -u
  fi
fi
