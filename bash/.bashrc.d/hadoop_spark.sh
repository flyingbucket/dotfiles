# --- Big Data Tools (Hadoop & Spark) ---
HADOOP_DIR=$(find "$HOME/apps" -maxdepth 1 -type d -name "hadoop*" 2>/dev/null | head -n 1)
if [ -n "$HADOOP_DIR" ] && [ -d "$HADOOP_DIR" ]; then
  export HADOOP_HOME="$HADOOP_DIR"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
  export YARN_CONF_DIR="$HADOOP_HOME/etc/hadoop"
  export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"
fi

SPARK_DIR=$(find "$HOME/apps" -maxdepth 1 -type d -name "spark*" 2>/dev/null | head -n 1)
if [ -n "$SPARK_DIR" ] && [ -d "$SPARK_DIR" ]; then
  export SPARK_HOME="$SPARK_DIR"
  export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
fi
