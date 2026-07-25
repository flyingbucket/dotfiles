# Doom Emacs
DOOM_EMACS_BIN="$HOME/.config/emacs/bin"

if [ -d "$DOOM_EMACS_BIN" ]; then
  case ":$PATH:" in
  *":$DOOM_EMACS_BIN:"*) ;;
  *) export PATH="$DOOM_EMACS_BIN:$PATH" ;;
  esac
fi

unset DOOM_EMACS_BIN
