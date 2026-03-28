function _refresh_ssh_agent() {
  # 如果 Socket 文件不存在，或者 ssh-add 连不上 Agent
  if [ ! -S "$SSH_AUTH_SOCK" ] || ! ssh-add -l [ $? -eq 2 ] >/dev/null 2>&1; then
    # 杀掉可能存在的僵尸 agent 进程
    pkill -u "$USER" ssh-agent >/dev/null 2>&1
    # 重新启动
    eval $(ssh-agent -s) >/dev/null
    # 自动加载你的核心密钥
    find ~/.ssh -type f ! -name "*.pub" ! -name "config" ! -name "known_hosts*" \
      -exec ssh-add -q {} + 2>/dev/null
  fi
}

_refresh_ssh_agent
