{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
  ];

  # wayland.windowManager.hyprland.settings = {
  #   windowrulev2 = [
  #     "workspace 11, class:^(Discord|discord)$"
  #   ];
  # };

  home.file.".config/discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true
    }
  '';
}
