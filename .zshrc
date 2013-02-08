# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to custom oh-my-zsh files
ZSH_CUSTOM=$HOME/.zsh

# Set name of the theme to load.
ZSH_THEME="arrmaroen"

# Use case-sensitive completion
CASE_SENSITIVE="true"

# Disable auto-update checks
DISABLE_AUTO_UPDATE="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Load oh-my-zsh plugins
plugins=(history-substring-search osx brew gitfast npm pip encode64 urltools)

source $ZSH/oh-my-zsh.sh

# Include shell-agnostic resource file
[[ -s "$HOME/.shrc" ]] && source "$HOME/.shrc"

# Fix using the special globbing character ^ (for git)
unsetopt nomatch

# don't add commands that begin with a space to the history
setopt histignorespace
