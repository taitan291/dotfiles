{ pkgs, ... }: {
  hardware.enableAllFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.opengl = {
    enable = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vpl-gpu-rt
    intel-compute-runtime
    vulkan-loader
    vulkan-validation-layers
    mesa
  ];
}
