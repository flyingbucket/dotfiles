# --- Conda Lazy Loading ---
if [ -d "$HOME/miniconda3" ] || [ -d "$HOME/anaconda3" ]; then
  CONDA_ROOT=""
  [ -d "$HOME/miniconda3" ] && CONDA_ROOT="$HOME/miniconda3"
  [ -d "$HOME/anaconda3" ] && CONDA_ROOT="$HOME/anaconda3"

  alias loadconda="source $CONDA_ROOT/etc/profile.d/conda.sh"

  conda() {
    unset -f conda
    if [ -f "$CONDA_ROOT/etc/profile.d/conda.sh" ]; then
      source "$CONDA_ROOT/etc/profile.d/conda.sh"
      conda "$@"
    else
      echo "Conda profile.d script not found in $CONDA_ROOT" >&2
      return 1
    fi
  }
fi
