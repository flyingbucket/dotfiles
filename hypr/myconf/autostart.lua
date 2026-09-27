-- DMS_STARTUP_BEGIN // auto start
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")

	-- Start Fcitx5
	hl.exec_cmd("fcitx5 -d")
	-- Start Clash Verge
	hl.exec_cmd("clash-verge")
	hl.exec_cmd("hyprpm reload -n")
end)
-- DMS_STARTUP_END
