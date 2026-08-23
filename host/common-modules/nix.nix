_: {
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    connect-timeout = 3;
    min-free-check-interval = 3;
    substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
    ];
    fallback = true;
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    trusted-users = ["root" "@wheel"];
  };

  nixpkgs.config.allowUnfree = true;
}
