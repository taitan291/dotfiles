{ pkgs, inputs, ... }: {
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
	/*
	boot.plymouth = {
    enable = true;
    theme = "my-custom-theme";
		themePackages = [ inputs.plymouth-theme.packages.${pkgs.system}.myCustomTheme ];
  };
	*/
}
