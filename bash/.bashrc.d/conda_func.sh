conda() {
  unset -f conda
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
  conda "$@"
}
