-- 連続トリガー許可バインド（bindel）
hl.bindel("", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
hl.bindel("", "XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))
hl.bindel("", "XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
hl.bindel("", "XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bindel("", "XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))

-- ロック状態でも機能するバインド（bindl）
hl.bindl("", "XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bindl("", "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bindl("", "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bindl("", "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bindl("", "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
