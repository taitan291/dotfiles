{
  networking.hostName = "desktop";

  imports = [
    ./hardware-configuration.nix
    ../common-modules
    ./modules/nvidia.nix
    ../../modules/steam
  ];
}
