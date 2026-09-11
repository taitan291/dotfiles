{
  pkgs,
  inputs,
  ...
}: let
  plymouth-uindows = inputs.uindows-themes.packages.${pkgs.stdenv.hostPlatform.system}.plymouth-uindows-theme;
in {
  boot.loader = {
    timeout = 60;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 5;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth = {
    enable = true;
    # theme = "matrix";
    theme = "plymouth-uindows-theme";
    themePackages = [
      # pkgs.plymouth-matrix-theme
      plymouth-uindows
    ];
  };
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;

  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "splash"

    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"

    "i915.force_probe=!7d55"
    "xe.force_probe=7d55"
  ];
}
