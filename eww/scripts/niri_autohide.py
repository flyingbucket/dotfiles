import subprocess
import json


def toggle_eww(show):
    try:
        if show:
            # 确保 eww.yuck 中定义的是 (defwindow monitor ...) [cite: 5, 7]
            subprocess.run(["eww", "open", "monitor"], capture_output=True)
        else:
            subprocess.run(["eww", "close", "monitor"], capture_output=True)
    except:
        pass


# 开启 Niri 监听
proc = subprocess.Popen(["niri", "msg", "-j", "event-stream"], stdout=subprocess.PIPE)

for line in iter(proc.stdout.readline, b""):
    try:
        event = json.loads(line)

        # 核心逻辑：无论发生什么变化，都检查当前工作区有没有窗口
        # 监听 WindowsChanged 或 WorkspaceActivated 都能覆盖大部分场景
        if (
            "WindowsChanged" in event
            or "WorkspaceActivated" in event
            or "WorkspaceActiveWindowChanged" in event
        ):
            # 主动查询当前活跃的工作区 ID
            res = subprocess.run(
                ["niri", "msg", "-j", "workspaces"], capture_output=True, text=True
            )
            if res.stdout:
                workspaces = json.loads(res.stdout)
                # 找到当前聚焦(is_focused)的工作区
                active_ws = next(
                    (ws for ws in workspaces if ws.get("is_focused")), None
                )

                if active_ws:
                    # 如果该工作区没有活动窗口(active_window_id 为 None)，则显示
                    if active_ws.get("active_window_id") is None:
                        toggle_eww(True)
                    else:
                        toggle_eww(False)
    except Exception:
        continue
