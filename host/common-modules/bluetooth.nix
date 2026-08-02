{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Privacy = "device";
        JustWorksRepairing = "always";
        FastConnectable = true;
        ControllerMode = "dual";
        ClassicBondedOnly = false;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
  ];

  environment.pathsToLink = [
    "/share/icons"
  ];
  services.blueman.enable = true;
}
