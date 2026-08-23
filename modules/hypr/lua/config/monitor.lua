hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1,

	cm = "hdr",
	sdrbrightness = 1.2,
	sdrsaturation = 0.98,
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.env("GDK_SCALE", "2")
hl.env("XCURSOR_SIZE", "32")
