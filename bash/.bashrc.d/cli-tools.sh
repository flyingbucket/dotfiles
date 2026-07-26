# --- CLI Tools Initialization ---

# Starship
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# fzf
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# thefuck
if command -v thefuck &>/dev/null; then
  eval "$(thefuck --alias)"
fi
