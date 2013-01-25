# Fun characters: ✔ ✘ ✓ ✗ ✕ ✖ ✚ ─ ═ ● ◦ ◆ ◇ ■ □ ✹ ✭ ➜ ➤ ‹ ↵ ← ➞ ↑ ↓ ⬇ ⬆ ⬅ ➡ … ╭ ╰

# Break the prompt out into components for sanity's sake
local user="%(!.%{%F{red}%}.%{%F{cyan}%})%n%{%f%}"
local host="%{%F{green}%}%M%{%f%}"
local directory="%{%F{yellow}%}%~%{%f%}"
local prompt_char="%(!.%{%F{red}%}.%{%F{yellow}%})➤ %{%f%}"
local exit_status="%(?..%{%F{red}%}%? ↵  %{%f%})"

# Set the prompt
PROMPT='
%{%K{black}%}$(remote)${user}@${host}:${directory} $(git_prompt_info) $(git_remote_status) $(git_prompt_status)%E%{%k%}
${prompt_char} '

# Right-justified prompt
RPROMPT='${exit_status}%t'

# Git prompt components
ZSH_THEME_GIT_PROMPT_PREFIX="‹ %{%F{white}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{%F{green}%}●%{%f%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{%F{green}%}●%{%f%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{%F{green}%}●%{%f%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%F{red}%}●%{%f%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="◦"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⬆"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⤨"

# Is this a shell on a remote host?
function remote() {
  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
    echo "%{%F{magetna}%B%}(remote)%{%f%b%} "
  fi
}
