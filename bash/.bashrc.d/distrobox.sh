export DISTROBOX_ENGINE="podman"
if [ -n "$DISPLAY" ]; then
  xhost +local:docker >/dev/null 2>&1
fi
