{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.Hyprspace.packages.${pkgs.stdenv.hostPlatform.system}.Hyprspace
    ];

    extraConfig = ''
      ${builtins.readFile ./config/plugin-space.lua}
    '';
  };
}
