# add any system specific paths
if [ -f ~/.paths ]; then
  while read line; do
    PATH=$line:$PATH
  done < ~/.paths
fi

# add personal bin folder to path
if [ -d ~/.bin ]; then
	PATH=~/.bin:$PATH
fi

# export PATH to the shell
export PATH

# set default commands
export EDITOR=vim
export GIT_EDITOR=vim
export PAGER=less

# If not running interactively, skip the rest
[ -z "$PS1" ] && return

# include bash aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# run homebrew profile scripts
for script in /usr/local/etc/profile.d/*.sh; do
  if [ -r $script ]; then
    . $script
  fi
done

# set some options to colorize things
export TERM=xterm-color
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# bash history settings
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
shopt -s histappend # append to the history file, don't overwrite it

# bash completion settings (actually, these are readline settings)
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous on" # show list automatically, without double tab

# enable git PS1 integration if possible
if [ "`type -t __git_ps1`" = 'function' ]; then
  GIT_PROMPT='$(__git_ps1 " (%s)")'
  GIT_PS1_SHOWDIRTYSTATE=true
fi

# set up named colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
UNDERLINE="\[\033[4m\]"
NO_COLOUR="\[\033[0m\]"

# outputs a warning if the last command failed
function return_value_indicator {
  if [ $? != 0 ]; then
    echo '!'
  fi
}

# defines what will appear in the command prompt
function prompt {
  PS1="$WHITE\n$RED\$(return_value_indicator)$GREEN\u$WHITE@$CYAN\h$WHITE:$BLUE\w$RED$GIT_PROMPT$WHITE\n> "
}

# set the prompt
prompt
