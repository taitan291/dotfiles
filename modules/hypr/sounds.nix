{pkgs, ...}: {
  services.swayosd.enable = true;

  wayland.windowManager.hyprland.settings = {
    bindel = [
      # 音量調節（100%制限 / 音声表示付き）
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      # マイクミュート設定
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      # 輝度調節（OSD表示付き）
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
    ];

    bindl = [
      # スピーカーミュート（トグル）
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"

      # メディアキー（既存の設定を維持）
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
