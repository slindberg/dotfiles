# Grep colors for highlighting match
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='37;45'

# Ls colors, 'LS_COLORS' is the equivalent linux version for use with completion coloring
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# Less colors, helpful mostly for man pages
export LESS_TERMCAP_md=$'\e[1;38;5;146m'  # start bold
export LESS_TERMCAP_so=$'\e[1;44;33m'     # start stand-out
export LESS_TERMCAP_us=$'\e[1;37m'        # start underline
export LESS_TERMCAP_se=$'\e[0m'           # end stand-out
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_me=$'\e[0m'           # end all modes
