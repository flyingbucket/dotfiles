# --- WezTerm Shell Integration Auto-Cleanup ---
if [[ "$TERM_PROGRAM" != "WezTerm" ]]; then
  # 定义空函数来“占位”，防止 Bash 报错
  __wezterm_semantic_precmd() { :; }
  __wezterm_semantic_preexec() { :; }
  __wezterm_set_user_var() { :; }
  __wezterm_user_vars_precmd() { :; }
  __wezterm_osc7() { :; }

  # 将它们导出为只读,防止被意外修改）
  export -f __wezterm_semantic_precmd __wezterm_semantic_preexec __wezterm_set_user_var __wezterm_user_vars_precmd __wezterm_osc7

  # 从 precmd_functions 数组中剔除
  if [[ -n "${precmd_functions+x}" ]]; then
    targets=("__wezterm_semantic_precmd" "__wezterm_user_vars_precmd" "__wezterm_osc7")
    new_arr=()
    for func in "${precmd_functions[@]}"; do
      is_wez=false
      for t in "${targets[@]}"; do [[ "$func" == "$t" ]] && is_wez=true; done
      [[ "$is_wez" == false ]] && new_arr+=("$func")
    done
    precmd_functions=("${new_arr[@]}")
  fi

  # 清理 PROMPT_COMMAND 中的残余调用
  # 这里的 :; 确保了即使匹配错误，也不会执行不存在的命令
  if [[ -n "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND=$(echo "$PROMPT_COMMAND" | sed 's/__wezterm_[^; ]*//g' | sed 's/;;*/;/g')
  fi
fi
