{...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    connect-timeout = 3;
    min-free-check-interval = 3;
    substituters = [
      "https://cache.nixos.org/"
    ];
    fallback = true;
  };

  nixpkgs.config.allowUnfree = true;
}
