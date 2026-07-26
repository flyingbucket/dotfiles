# >>> coursier install directory >>>
COURSIER_BIN="$HOME/.local/share/coursier/bin"

if [ -d "$COURSIER_BIN" ]; then
  case ":$PATH:" in
  *":$COURSIER_BIN:"*) ;;
  *) export PATH="$PATH:$COURSIER_BIN" ;;
  esac
fi
unset COURSIER_BIN
# <<< coursier install directory <<<
