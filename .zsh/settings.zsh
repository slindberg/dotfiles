# http://zsh.sourceforge.net/Doc/Release/Options.html#Options

# Input/Output
setopt correct                 # Attempt to correct command typo when there's a close match
unsetopt flow_control          # Disable ctrl-s/ctrl-q for stopping/starting output

# History
setopt extended_history        # Save timestamps along with history items
setopt hist_expire_dups_first  # Trim duplicate commands from history before uniques
setopt hist_ignore_dups        # Don't add a command that is a duplicate of the previous command
setopt hist_ignore_space       # Don't add commands that begin with a space to history
setopt hist_verify             # Don't automatically execute commands with history expansion
setopt inc_append_history      # Append to history file as commands are executed, instead of on exit
setopt share_history           # Always use the latest version of history

# Completion
setopt complete_in_word        # Complete from both ends of a word
setopt always_to_end           # Move cursor to the end of a completed word.

# Miscellaneous
unsetopt nomatch               # Fix using the special globbing character ^ (for git)
setopt combining_chars         # Assume terminals display characters with accents correctly


# Addons

# Auto-escape shell special chars in URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
