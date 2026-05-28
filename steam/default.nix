{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Remote Play用
    dedicatedServer.openFirewall = true; # Sourceゲーム用
    protontricks.enable = true;
    gamescopeSession.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
      vulkan-loader
      vulkan-validation-layers

      mesa
    ];
  };
}
