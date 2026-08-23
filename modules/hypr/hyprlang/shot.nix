_: {
  home = {
    file = {
      "Pictures/Screenshots/.keep".text = "";
    };
  };
  programs.hyprshot = {
    enable = true;
  };
  wayland.windowManager.hyprland.settings = {
    bind = [
      # スクリーンショット
      ", Print, exec, hyprshot -m window --clipboard-only"
      "SHIFT, Print , exec, hyprshot -m window -o /home/taitan/Pictures/Screenshots"
      "SUPER, Print, exec, hyprshot -m region --clipboard-only"
      "SUPER SHIFT, Print, exec, hyprshot -m region -o /home/taitan/Pictures/Screenshots"
    ];
  };
}
