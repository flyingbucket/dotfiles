import os

# 定义组件信息：文件名, 显示名称, 执行命令, 图标名
dms_apps = [
    (
        "dms-clipboard",
        "Clipboard Manager",
        "dms ipc call clipboard toggle",
        "preferences-desktop-clipboard",
    ),
    (
        "dms-taskmanager",
        "Task Manager",
        "dms ipc call processlist focusOrToggle",
        "utilities-system-monitor",
    ),
    ("dms-powermenu", "Power Menu", "dms ipc call powermenu toggle", "system-log-out"),
    (
        "dms-settings",
        "DMS Settings",
        "dms ipc call settings focusOrToggle",
        "emblem-system",
    ),
    (
        "dms-wallpaper",
        "Browse Wallpapers",
        "dms ipc call dankdash wallpaper",
        "background",
    ),
    (
        "dms-notifications",
        "Notification Center",
        "dms ipc call notifications toggle",
        "preferences-desktop-notification",
    ),
    (
        "dms-notepad",
        "Notepad",
        "dms ipc call notepad toggle",
        "accessories-text-editor",
    ),
]

# target_dir = os.path.expanduser("~/.local/share/applications")
target_dir = "./dms_desktop"
# 确保目录存在
os.makedirs(target_dir, exist_ok=True)

for file_id, name, cmd, icon in dms_apps:
    file_path = os.path.join(target_dir, f"{file_id}.desktop")

    content = f"""[Desktop Entry]
Name={name}
Comment=DMS Component: {name}
Exec={cmd}
Icon={icon}
Terminal=false
Type=Application
Categories=Utility;System;
Keywords=dms;dank;shell;
"""

    with open(file_path, "w") as f:
        f.write(content)

    # 设置权限
    os.chmod(file_path, 0o755)
    print(f"已创建: {file_path}")

print("\n所有 DMS 组件已注册到应用列表。请尝试在 Fuzzel 中搜索它们！")
