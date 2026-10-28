hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto-right",
	scale = 1,
})

-- Sunshine用の仮想ディスプレイ(物理画面の拡張)
hl.monitor({
	output = "HEADLESS-1",
	mode = "1652x1128@60",
	position = "auto-right",
	scale = 1,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl output create headless HEADLESS-1")
end)

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})
