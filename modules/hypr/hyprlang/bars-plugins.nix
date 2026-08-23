{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [inputs.hypr-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars];
    settings = {
      plugin.hyprbars = {
        bar_height = 24;
        bar_buttons_alignment = "left";
        bar_title_enabled = false;
        bar_blur = false;
        bar_part_of_window = true;
        on_double_click = "hyprctl dispatch fullscreen 1";
        bar_color = "0xFAE18A";

        hyprbars-button = [
          "rgb(ffeeeb), 10, 󰖭, hyprctl dispatch killactive"
          "rgb(ffeeeb), 10, □, hyprctl dispatch fullscreen 1"
          "rgb(ffeeeb), 10, ー, hyprctl dispatch movetoworkspacesilent special:minimized"
        ];
      };
      # windowrulev2 = [
      #   "plugin:hyprbars:bar_color 0x897E76, class:^(Brave-browser)$"
      #   "plugin:hyprbars:bar_color 0xFAE18A, class:^(Ghostty)$"
      #   "plugin:hyprbars:bar_color 0xFF7B87, class:^(thunar)$"
      #   "workspace 11, class:^(Discord|discord)$"
      # ];
    };
  };
}
