{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "p";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "s";
      }
			{
				label = "hibernate";
				action = "systemctl hibernate";
				text = "Hibernate";
				keybind = "h";
			}
    ];
		style = builtins.replaceStrings
			[ "@WLOGOUT@" ]
			[ "${pkgs.wlogout}" ]
			(builtins.readFile ./style.css);
	};
}
