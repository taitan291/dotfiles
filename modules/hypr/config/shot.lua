hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window -o @SCREENSHOT_DIR@"))
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region -o @SCREENSHOT_DIR@"))
