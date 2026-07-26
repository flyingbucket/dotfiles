# texlive
TEXLIVE_BIN="$HOME/apps/texlive/current/bin/x86_64-linux"

if ! command -v xelatex &>/dev/null && [ -d "$TEXLIVE_BIN" ]; then
  case ":$PATH:" in
  *":$TEXLIVE_BIN:"*) ;;
  *) export PATH="$TEXLIVE_BIN:$PATH" ;;
  esac

  # 挂载 Man 与 Info 文档路径
  [ -d "$HOME/apps/texlive/current/texmf-dist/doc/man" ] &&
    export MANPATH="$HOME/apps/texlive/current/texmf-dist/doc/man:${MANPATH:-}"

  [ -d "$HOME/apps/texlive/current/texmf-dist/doc/info" ] &&
    export INFOPATH="$HOME/apps/texlive/current/texmf-dist/doc/info:${INFOPATH:-}"
fi

unset TEXLIVE_BIN
