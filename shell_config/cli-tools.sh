# --- CLI Tools Initialization (Bash & Zsh Compatible) ---

if [ -n "$ZSH_VERSION" ]; then
  CURRENT_SHELL="zsh"
elif [ -n "$BASH_VERSION" ]; then
  CURRENT_SHELL="bash"
fi

# Starship
if command -v starship &>/dev/null && [ -n "$CURRENT_SHELL" ]; then
  eval "$(starship init "$CURRENT_SHELL")"
fi

# fzf
if command -v fzf &>/dev/null && [ -n "$CURRENT_SHELL" ]; then
  eval "$(fzf --"$CURRENT_SHELL")"
fi

# thefuck
if command -v thefuck &>/dev/null; then
  eval "$(thefuck --alias)"
fi

unset CURRENT_SHELL
