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
