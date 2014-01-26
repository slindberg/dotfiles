# Fun characters: ✔ ✘ ✓ ✗ ✕ ✖ ✚ ─ ═ ● ◦ ◆ ◇ ■ □ ∅ ⊛ ⊙ ⊚ ✹ ✭ ➤ ❯»‹ ↵ ← ➞ ↑ ↓ ⬇ ⬆ ⬅ ➡ ⬌ ➧ ➜ … ➕ ➖ ❗ ⭕ ❌ ❎ ✅ ⬛ ⬜

# Perform expansions in the prompt
setopt prompt_subst

# Call git-info before each new command
autoload -Uz add-zsh-hook
add-zsh-hook precmd git-info

# Git prompt components
zstyle ':git-info'           verbose 'yes'
zstyle ':git-info:remote'    format '%F{white}%R%f'      # %R
zstyle ':git-info:action'    format ' (%F{red}%s%f)'     # %s
zstyle ':git-info:branch'    format '%F{white}%b%f'      # %b
zstyle ':git-info:position'  format '%F{white}%p%f'      # %p
zstyle ':git-info:commit'    format '%F{white}%.7c%f'    # %c
zstyle ':git-info:ahead'     format ' ⬆'                 # %A
zstyle ':git-info:behind'    format ' ⬇'                 # %B
zstyle ':git-info:diverged'  format ' ⤨'                 # %X
zstyle ':git-info:stashed'   format ' ≡'                 # %S
zstyle ':git-info:unmerged'  format '%F{red}●%f'         # %U
zstyle ':git-info:clean'     format '%F{green}●%f'       # %C
zstyle ':git-info:dirty'     format '%F{red}●%f'         # %D
zstyle ':git-info:modified'  format '%F{yellow}●%f'      # %m
zstyle ':git-info:added'     format '%F{green}●%f'       # %a
zstyle ':git-info:deleted'   format '%F{red}●%f'         # %d
zstyle ':git-info:renamed'   format '%F{green}∗%f'       # %r
zstyle ':git-info:untracked' format '◦'                  # %u
zstyle ':git-info:keys'      format 'prompt' '‹ $(coalesce "%b" "%p" "%c")%s$(coalesce "%X" "%A%B") %m%a%d%U%r%u'

# Prompt sub components
local remote_host; remote && remote_host='%F{blue}remote%f » '
local user='%(!.%F{red}.%F{cyan})%n%f'
local host='%F{green}%M%f'
local directory='%F{yellow}%~%f'
local git_status='${git_info:+${(e)git_info[prompt]}}'
local exit_status='%(?..%F{red}%? ↵  %f)'
local prompt_char='%(!.%F{red}.%F{yellow})❯%f'
local timestamp='%D{%L:%M:%S %p'

# Set the prompt
PROMPT='
%K{black}${remote_host}${user}@${host}:${directory} ${(e)git_status}%E%k
${prompt_char} '

# Right-justified prompt
RPROMPT='${exit_status}${timestamp}'
