{pkgs, ...}: {
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
    };
  };
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  #  boot.plymouth = {
  #    enable = true;
  #    theme = "matrix";
  #    themePackages = [
  # 		pkgs.plymouth-matrix-theme
  #    ];
  #  };
  # boot.initrd.verbose = false;
  #  boot.initrd.systemd.enable = true;
  #
  #  boot.consoleLogLevel = 0;
  #  boot.kernelParams = [
  #    "quiet"
  #    "splash"
  #    "boot.shell_on_fail"
  #    "loglevel=3"
  #    "rd.systemd.show_status=false"
  #    "rd.udev.log_level=3"
  #    "udev.log_priority=3"
  #  ];
}
