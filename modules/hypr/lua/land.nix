{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    extraConfig = ''
      ${builtins.readFile ./config/settings.lua}
      ${builtins.readFile ./config/monitor.lua}
      ${builtins.readFile ./config/inputs.lua}
      ${builtins.readFile ./config/binds.lua}
      ${builtins.readFile ./config/layouts.lua}
      ${builtins.readFile ./config/animetions.lua}
    '';
  };
}
