-- Hyprspace workspace overview
-- SUPER + TAB opens/closes the overview on the current monitor.
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("hyprctl dispatch overview:toggle"))

-- Hyprspace's plugin options are still exposed through Hyprland's keyword
-- interface.  Applying them after Hyprland starts keeps this file usable with
-- the Lua configuration backend as well.
hl.on("hyprland.start", function()
	local options = {
		{ "plugin:overview:panelColor", "rgba(1e1e2eff)" },
		{ "plugin:overview:panelBorderColor", "rgba(89b4faff)" },
		{ "plugin:overview:workspaceActiveBackground", "rgba(89b4fa33)" },
		{ "plugin:overview:workspaceInactiveBackground", "rgba(313244cc)" },
		{ "plugin:overview:workspaceActiveBorder", "rgba(89b4faff)" },
		{ "plugin:overview:workspaceInactiveBorder", "rgba(585b70ff)" },
		{ "plugin:overview:panelHeight", "320" },
		{ "plugin:overview:workspaceMargin", "12" },
		{ "plugin:overview:workspaceBorderSize", "2" },
		{ "plugin:overview:centerAligned", "1" },
		{ "plugin:overview:exitOnClick", "1" },
		{ "plugin:overview:exitOnSwitch", "1" },
		{ "plugin:overview:showNewWorkspace", "0" },
		{ "plugin:overview:showEmptyWorkspace", "1" },
	}

	for _, option in ipairs(options) do
		hl.exec_cmd("hyprctl keyword " .. option[1] .. " " .. option[2])
	end
end)
