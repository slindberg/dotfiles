# ls is hard
alias ls='ls -G' # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
alias ll='ls -lh'
alias la='ls -lha'

# cd is hard too
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# grep'n
alias grep='grep -n'
alias rgrep='grep -r'
alias psgrep='ps aux | grep'

# misc
alias top='top -o cpu'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias tree='tree -C --dirsfirst'
alias listen='lsof -i | \grep LISTEN' # Lists processes that are listening on a port
