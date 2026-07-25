# distrobox
if command -v podman &>/dev/null || command -v docker &>/dev/null; then
  export DISTROBOX_ENGINE="podman"
  if [ -n "$DISPLAY" ] && command -v xhost &>/dev/null; then
    xhost +local:docker >/dev/null 2>&1
  fi
fi
