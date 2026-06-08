{ ... }: {
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = false;
    xkb = {
      layout = "jp";
      variant = "106";
      options = "ctrl:nocaps";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
