{ config, pkgs, ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "shutdown now";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "l";
      }
      {
        label = "poweroff";
        action = "poweroff";
        text = "Poweroff";
        keybind = "p";
      }
    ];
  };
}
