# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html

# Set some human-friendly key aliases
typeset -gA keyinfo
keyinfo=(
  'Escape'    '\e'
  'Control'   '^'
  'Backspace' "^?"
  'Delete'    "$terminfo[kdch1]"
  'Up'        "$terminfo[kcuu1]"
  'Down'      "$terminfo[kcud1]"
  'Left'      "$terminfo[kcub1]"
  'Right'     "$terminfo[kcuf1]"
  'ShiftTab'  "$terminfo[kcbt]"
)

# Use Emacs emulation
bindkey -e

# Key bindings
bindkey "$keyinfo[Delete]"    delete-char                          # Delete forward
bindkey "$keyinfo[Backspace]" backward-delete-char                 # Delete backward
bindkey "$keyinfo[Right]"     forward-char                         # Forward one character
bindkey "$keyinfo[Left]"      backward-char                        # Backward one character
bindkey "$keyinfo[Up]"        up-line-or-search                    # Fuzzy find history forward
bindkey "$keyinfo[Down]"      down-line-or-search                  # Fuzzy find history backward
bindkey "$keyinfo[ShiftTab]"  reverse-menu-complete                # Move through the completion menu backwards
bindkey "$keyinfo[Control]R"  history-incremental-search-backward  # Search backward incrementally for a specified string
bindkey "$keyinfo[Control]L"  clear-screen                         # Clear the screen
bindkey "$keyinfo[Control]Q"  push-line-or-edit                    # Save the current command in the buffer stack
bindkey "$keyinfo[Control]X"  edit-command-line                    # Open the current command in an editor
bindkey "$keyinfo[Control]P"  history-substring-search-up          # History-substring search backward
bindkey "$keyinfo[Control]N"  history-substring-search-down        # History-substring search forward
bindkey "$keyinfo[Control]D"  confirm-exit                         # Confirm before exiting shell

bindkey ' '                   magic-space                          # History expansion

# Enter/exit terminal application mode to ensure valid $terminfo values
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  zle -N zle-line-init

  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-finish
fi
