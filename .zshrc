# Include functions
if [ -f ~/.functions ]; then
  source ~/.functions
fi

# Include aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Include environment variables
[[ -s "$HOME/.env" ]] && source "$HOME/.env"

# Include all brew-installed init scripts
if  exists 'brew' && [ -d "$(brew --prefix)/etc/profile.d" ]; then
  for file in $(brew --prefix)/etc/profile.d/*; do
    source $file
  done
fi

# Add system specific paths
if [ -f ~/.paths ]; then
  while read dir; do
    if [ -d $dir ]; then
      PATH=$dir:$PATH
    fi
  done < ~/.paths
fi

# Custom scripts
if [ -d ~/.scripts ]; then
  PATH=~/.scripts:$PATH
fi

export PATH

# Default editor
export EDITOR="mvim -v"

# Default Pager
export PAGER=less

# Default less options, the FX causes short files to be displayed inline
export LESS=-iFXRx4

# Add lesspipe.sh if available
if exists lesspipe.sh; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Add some variables for easy colors (http://pthree.org/2009/12/18/add-colors-to-your-zsh-scripts/)
autoload colors
if [[ "$terminfo[colors]" -gt 8 ]]; then
    colors
fi
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='$fg_no_bold[${(L)COLOR}]'
    eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval RESET='$reset_color'

# Fix using the special globbing character ^ (for git)
unsetopt nomatch

# Don't add commands that begin with a space to the history
setopt histignorespace

# Stop trying to auto-correct git aliases
alias git='nocorrect git'
