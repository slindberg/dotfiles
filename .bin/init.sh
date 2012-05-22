#!/bin/bash

function exists {
  command -v "$1" > /dev/null
}

function assert_exists {
  if ! exists $1 > /dev/null; then
    if [ "$#" -gt 1 ]; then
      echo -e  $2
    else
      echo -e "${RED}could not find command '$1' in path.${WHITE}"
    fi
    exit 1
  fi
}

# run script from the home directory
cd ~

#
# Homebrew
#

if ! exists brew; then
  # check to ensure xcode/gcc is installed
  assert_exists gcc "Brew requires XCode to be installed."

  assert_exists ruby "Unable to install Homebrew without Ruby."
  echo "Installing Homebrew..."
  ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
  assert_exists brew "Brew install failed."
fi

# install basic packages
# brew install git bash-completion ack tree watch wget node

#
# Node Package Manager
#

if ! exists npm; then
  echo "Installing Node Package Manager."
  curl http://npmjs.org/install.sh | sh
  assert_exists npm "Node Package Manager install failed."
fi

# install basic node packages
# npm install -g jshint uglify-js less requirejs

#
# VIM
#

if [ ! -d "$HOME/.vim" ]; then
  # clone dotvim repo
  git clone git@github.com:slindberg/dotvim .vim

  # link the repo's vimrc to .vimrc
  if [ ! -f "$HOME/.vimrc" ]; then
    ln -s ~/.vim/vimrc .vimrc
  fi

  # create a system-specific .gvimrc that sources the repo version
  if [ ! -f "$HOME/.gvimrc" ]; then
    cat 'source ~/.vim/gvimrc' > .gvimrc
  fi

  # run make to initialize plugins, etc.
  (cd .vim && make)
fi

#
# Reminders
#

ALLISWELL=true

if [ ! -d "$HOME/.ssh" ]; then
  ALLISWELL=false
  echo "No SSH keys are installed."
fi

if [ `head -n 1 /etc/paths` != "/usr/local/bin" ]; then
  ALLISWELL=false
  echo "'/usr/local/bin' is NOT the top of /etc/paths."
fi

if $ALLISWELL; then
  echo "All is right in the world."
fi
