hl.on("hyprland.start", function()
	hl.exec_cmd(
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
	)
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("dunst")
	hl.exec_cmd("fcitx5 -d")
	-- hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
end)

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_TYPE", "Hyprland")

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

-- pluginの有効化
hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})
