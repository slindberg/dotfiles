# Global
alias -g G='| grep'
alias -g A='| ack'
alias -g H='| head -n 30'
alias -g L='| less'
alias -g T='| tail -n 30'
alias -g TF='| tail -f'
alias -g S='| gsort'
alias -g SN='| gsort -n'
alias -g SH='| gsort -h'
alias -g WC='| wc'

# Navigation
alias -- -='cd -'
alias ~='cd ~'

# Listing
alias ls='ls -G'
alias l='ls -lh'
alias la='ls -lhA'

# Permissions
alias chr='chmod -R u+rwX,go+rX,go-w'

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
alias duch='du -csh -- *(D)'

# JavaScript package managers >:U
alias nom='npm cache clear && rm -rf node_modules && npm install'
alias bom='bower cache clean && rm -rf bower_components && bower install'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
