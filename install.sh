#!/bin/bash

DOTFILES_DIR=$(pwd)
# 检查是否在 dotfiles 目录下运行
if [ "$(pwd)" != "$DOTFILES_DIR" ]; then
  echo "Please run this install.sh under $DOTFILES_DIR !"
  exit 1
fi

# tmux
echo "Installing .tmux.conf for tmux..."
if [ -f "$HOME/.tmux.conf" ]; then
  echo "~/.tmux.conf exists,skip..."
else
  ln -s "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
  echo "symbolink for ~/.tmux.conf created"
fi
echo

# starship
echo "Installing starship.toml for starship..."
if [ -f "$HOME/.config/starship.toml" ]; then
  echo "~/.config/starship.toml exits ,skip..."
else
  mkdir -p "$HOME/.config"
  ln -s "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
  echo "symbolonk for ~/.config/starship.toml created"
fi
echo

# nvim
echo "Installing nvim configs..."
if [ -d "$HOME/.config/nvim" ]; then
  echo "~/.config/nvim exists as a directory, skip..."
elif [ -f "$HOME/.config/nvim" ]; then
  echo "~/.config/nvim exists as a file, skip..."
elif [ -L "$HOME/.config/nvim" ]; then
  echo "~/.config/nvim is already a symlink, skip..."
else
  ln -s "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
  echo "symbolink for ~/.config/nvim created"
fi
echo

# wezterm
echo "Installing wezterm configs..."
if [ -d "$HOME/.config/wezterm" ]; then
  echo "~/.config/wezterm exists as a directory, skip..."
elif [ -f "$HOME/.config/wezterm" ]; then
  echo "~/.config/wezterm exists as a file, skip..."
elif [ -L "$HOME/.config/wezterm" ]; then
  echo "~/.config/wezterm is already a symlink, skip..."
else
  ln -s "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
  echo "symbolink for ~/.config/wezterm created"
fi
echo

# yazi
echo "Installing yazi configs..."
if [ -d "$HOME/.config/yazi" ]; then
  echo "~/.config/yazi exists as a directory, skip..."
elif [ -f "$HOME/.config/yazi" ]; then
  echo "~/.config/yazi exists as a file, skip..."
elif [ -L "$HOME/.config/yazi" ]; then
  echo "~/.config/yazi is already a symlink, skip..."
else
  ln -s "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
  echo "symbolink for ~/.config/yazi created"
fi
echo

echo "All done successfully！"
