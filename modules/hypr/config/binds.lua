-- アプリショートカット
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + N", hl.dsp.exit())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + Q", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("missioncenter"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + SHIFT + J", hl.dsp.layout("togglesplit"))

-- 機能ショートカット

-- 移動用ショートカット
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- workspaceのショートカット
for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + D", hl.dsp.focus({ workspace = 21 }))
hl.bind("SUPER + SHIFT + D", hl.dsp.window.move({ workspace = 21 }))

-- スペシャルワークスペース
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- マウスホイール（相対ワークスペース移動）
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- マウスドラッグ
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
