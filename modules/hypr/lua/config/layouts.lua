hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 0,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 12,
		rounding_power = 10.0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
	},
	dwindle = {
		force_split = 2,
		preserve_split = false,
		smart_split = false,
		smart_resizing = true,
		permanent_direction_override = false,
		special_scale_factor = 1,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		default_split_ratio = 1.0,
		split_bias = 0,
		precise_mouse_move = false,
	},
})
