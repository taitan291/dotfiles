{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = false;
    xkb = {
      layout = "jp";
      variant = "106";
      options = "ctrl:nocaps";
    };
  };

  services.libinput.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    theme = "sddm-uindows-theme";
    package = pkgs.kdePackages.sddm;
  };
  environment.systemPackages = with pkgs; [
    sddm-uindows-theme
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
