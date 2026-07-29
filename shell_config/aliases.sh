alias ll='ls -lhF' 2>/dev/null

if command -v radian &>/dev/null; then
  alias r='radian'
fi

if command -v sshfs &>/dev/null; then
  alias mount_a30='sshfs flyingbucket@A30:/home/flyingbucket /mnt/A30 -o allow_other,uid=1000,gid=1000,reconnect,cache=no'
fi

if [ -f "$HOME/CODE/scripts/texInit.sh" ]; then
  alias texInit='bash $HOME/CODE/scripts/texInit.sh'
fi

if [ -f "$HOME/CODE/scripts/rnvim" ]; then
  alias rnvim='$HOME/CODE/scripts/rnvim'
fi

if command -v eza &>/dev/null; then
  alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
  alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
  alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
  alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
  alias l.="eza -a | grep -e '^\.'"                                          # show only dotfiles
fi

if command -v nvim &>/dev/null; then
  export MANPAGER='nvim +Man!'
fi
