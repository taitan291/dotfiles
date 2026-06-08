{ pkgs, ... }: {
  environment = {
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    systemPackages = with pkgs; [
      git
      wget
      zip
      unzip
      gzip
      wl-clipboard
      ripgrep
      os-prober
    ];
  };
}
