#!/bin/bash

DOTFILES_DIR=$(pwd)
# 检查是否在 dotfiles 目录下运行
if [ "$(pwd)" != "$DOTFILES_DIR" ]; then
  echo "Please run this install.sh under $DOTFILES_DIR !"
  exit 1
fi

# 安装 tmux 配置
echo "Installing .tmux.conf for tmux..."
if [ -f "$HOME/.tmux.conf" ]; then
  echo "~/.tmux.conf exists,skip..."
else
  ln -s "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
  echo "symbolink for ~/.tmux.conf created"
fi

# 安装 starship 配置
echo "Installing starship.toml for starship..."
if [ -f "$HOME/.config/starship.toml" ]; then
  echo "~/.config/starship.toml exits ,skip..."
else
  mkdir -p "$HOME/.config"
  ln -s "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
  echo "symbolonk for ~/.config/starship.toml created"
fi

# 安装 wezterm 配置
echo "Installing wezterm configs..."
if [ -d "$HOME/.config/wezterm" ]; then
  echo "~/.config/wezterm exists,skip..."
else
  mkdir -p "$HOME/.config/wezterm"
  ln -s "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
  echo "symbolink for ~/.config/wezterm created"
fi

# 安装其他配置文件（例如 yazi）
echo "Installing yazi configs..."
if [ -d "$HOME/.config/yazi" ]; then
  echo "~/.config/yazi exists,skip..."
else
  mkdir -p "$HOME/.config/yazi"
  ln -s "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
  echo "symbolink for ~/.config/yazi created"
fi

echo "All done successfully！"
