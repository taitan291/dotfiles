{
  lib,
  config,
  ...
}: {
  boot.loader = {
    grub.enable = lib.mkForce false;
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = lib.mkForce false;
  };

  # WSLではカーネルはWindows側のものを使用する
  boot.kernelPackages = lib.mkForce null;
  # 必要なら systemd を有効化
  boot.initrd.enable = lib.mkForce false;
}
