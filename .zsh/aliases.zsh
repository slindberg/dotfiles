# Global
alias -g ...='../..'
alias -g ....='../../..'
alias -g G='| grep'
alias -g H='| head -n 30'
alias -g L='| less'
alias -g T='| tail -n 30'
alias -g TF='| tail -f'
alias -g WC='| wc'

# Navigation
alias -- -='cd -'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls -G'
alias l='ls -lh'
alias ll='ls -lhA'

# Git
alias g=git

# Make sure the correct version of Vim is used
alias vim=$VIM_CMD

# Force re-make
alias fake='make clean && make'

# Search processes
alias psgrep='ps aux | grep'

# Show top processes sorted by cpu usage or real memory
alias cpu='top -o cpu'
alias mem='top -o vsize'

# Enable color and always list directories first
alias tree='tree -C --dirsfirst'

# Lists processes that are listening on a port
alias listen='lsof -i | grep LISTEN'

# List human readable size of files and dirs in cwd
alias duch='du -csh *'
