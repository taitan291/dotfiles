{
  networking.hostName = "laptop";
  boot.kernelParams = [
    "i915.force_probe=!7d55"
    "xe.force_probe=7d55"
  ];

  nixpkgs.overlays = [
    (import ./modules/overlays.nix)
  ];

  imports = [
    ./hardware-configuration.nix
    ../common-modules
    # ./modules/fingerprint.nix
    ../../modules/steam
  ];
}
