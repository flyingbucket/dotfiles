#!/bin/bash
FLAGS_FILE="$HOME/.config/chrome-flags.conf"
USER_FLAGS=()

if [ -f "$FLAGS_FILE" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
    USER_FLAGS+=("$line")
  done <"$FLAGS_FILE"
fi

exec /usr/bin/google-chrome-stable "${USER_FLAGS[@]}" "$@"
