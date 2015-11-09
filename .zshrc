local zdotdir=~/.zsh

# Add to function path
fpath=($zdotdir/functions $fpath)

# Needed for the globbing done below
setopt extended_glob

# Setup auto-loading of functions
for func in ${zdotdir}/functions/^_*(-.N:t); do
  autoload -Uz $func
done

# Add environment vars
if [[ -f ~/.env ]]; then
  source ~/.env
fi

# Ensure no duplicates in path var
typeset -U path

# Make sure /usr/local is in path
path=(/usr/local/bin "$path[@]")

# Include all brew-installed init scripts
if exists 'brew' && [[ -d $(brew --prefix)/etc/profile.d ]]; then
  for file in $(brew --prefix)/etc/profile.d/*; do
    source $file
  done
fi

# Add system specific paths
if [[ -f ~/.paths ]]; then
  while read dir; do
    if [ -d $dir ]; then
      path+=$dir
    fi
  done < ~/.paths
fi

# Custom scripts
if [[ -d ~/.scripts ]]; then
  path+=~/.scripts
fi

# At this point, exit if not interactive
if [[ $TERM == 'dumb' ]]; then
  exit
fi

# Always use MacVim if available
if exists mvim; then
  export VIM_CMD="mvim -v"
else
  export VIM_CMD="vim";
fi

# Default editor
export EDITOR=$VIM_CMD

# Default pager
export PAGER=less

# Default less options, the FX causes short files to be displayed inline
export LESS=-iFXRx2

# Add lesspipe.sh if available
if exists lesspipe.sh; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Characters that at considered part of a word, default is *?_-.[]~=/&;!#$%^(){}<>
WORDCHARS=${WORDCHARS//[&.;\/.]}

# History
if [ -z $HISTFILE ]; then
  HISTFILE=~/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# Use the java_home command if available to find the latest JRE
if [[ -x /usr/libexec/java_home ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

if [[ "$OSTYPE" == darwin* ]]; then
  # Update Terminal.app's CWD after every command to support opening
  # new tabs in the same directory
  autoload add-zsh-hook
  add-zsh-hook precmd terminal-cwd
fi

# Source all .zsh files in zdotdir
for file in ${zdotdir}/*.zsh; do
  source $file
done

# Enable plugins installed with brew
if exists 'brew'; then
  local brew_prefix=$(brew --prefix)

  # Add common zsh functions to function path
  if [[ -d $brew_prefix/zsh/share/site-functions ]]; then
    fpath=($brew_prefix/zsh/share/site-functions $fpath)
  fi

  # Add zsh-completions to function path
  if [[ -d $brew_prefix/share/zsh-completions ]]; then
    fpath=($brew_prefix/share/zsh-completions $fpath)
  fi

  # Source zsh-syntax-highlighting
  if [[ -d $brew_prefix/share/zsh-syntax-highlighting ]]; then
    source $brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi

  # Source zsh-history-substring-search
  if [[ -d $brew_prefix/opt/zsh-history-substring-search ]]; then
    source $brew_prefix/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
  fi

  # Add fzf functions and key bindings
  if [[ -d $brew_prefix/opt/fzf ]]; then
    source $brew_prefix/opt/fzf/shell/completion.zsh
    source $brew_prefix/opt/fzf/shell/key-bindings.zsh
  fi
fi
