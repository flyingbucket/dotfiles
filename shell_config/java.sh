# --- Java Environment ---
if [ -z "$JAVA_HOME" ]; then
  if command -v archlinux-java &>/dev/null; then
    # Arch Linux 风格
    export JAVA_HOME="/usr/lib/jvm/default"
  elif command -v update-alternatives &>/dev/null; then
    # Debian/Ubuntu/Fedora 风格
    JAVA_PATH=$(readlink -f $(command -v java 2>/dev/null) 2>/dev/null)
    if [ -n "$JAVA_PATH" ]; then
      export JAVA_HOME=$(dirname $(dirname "$JAVA_PATH"))
    fi
  fi
fi

# 回退机制：如果上面没找到，再看具体的固定路径
if [ -z "$JAVA_HOME" ] || [ ! -d "$JAVA_HOME" ]; then
  for j_path in "/usr/lib/jvm/java-21-openjdk" "/usr/lib/jvm/default-java"; do
    if [ -d "$j_path" ]; then
      export JAVA_HOME="$j_path"
      break
    fi
  done
fi

if [ -n "$JAVA_HOME" ] && [ -d "$JAVA_HOME/bin" ]; then
  [[ ":$PATH:" != *":$JAVA_HOME/bin:"* ]] && export PATH="$JAVA_HOME/bin:$PATH"
fi
