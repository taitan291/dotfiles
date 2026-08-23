-- アプリショートカット
hl.bind("SUPER + Q", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("missioncenter"))

-- 機能ショートカット
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + N", hl.dsp.exit())

-- 移動用ショートカット
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- グループ（タブ）にまとめる
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + SHIFT + G", hl.dsp.window({ out_of_group = true }))
hl.bind("SUPER + T", hl.dsp.group.next())
hl.bind("SUPER + Tab", hl.dsp.group.next())
hl.bind("SUPER + B", hl.dsp.group.prev())
hl.bind("SUPER + SHIFT + Tab", hl.dsp.group.prev())

-- workspaceのショートカット
for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + CTRL_L + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- スペシャルワークスペース
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special:magic"))

-- マウスホイール（相対ワークスペース移動）
hl.bind("SUPER + mouse_scroll_up", hl.dsp.exec_cmd("hyprctl dispatch workspace e+1"))
hl.bind("SUPER + mouse_scroll_down", hl.dsp.exec_cmd("hyprctl dispatch workspace e-1"))

-- マウスドラッグ
-- hl.bindm("SUPER + mouse:272", hl.dsp.window.move())
-- hl.bindm("SUPER + mouse:273", hl.dsp.window.resize())
