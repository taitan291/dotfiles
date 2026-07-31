{ ... }:

{
  # Bluetooth機能の有効化
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Bluetooth GUIマネージャー(blueman)の有効化
  services.blueman.enable = true;
}
