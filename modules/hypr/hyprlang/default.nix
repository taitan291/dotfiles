{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      hyprshot # スクリーンショット
      pavucontrol # 音量調整(GUI)
      playerctl # 音量調整(CUI)
      alsa-utils
      dunst
      brightnessctl # 画面高度
    ];
  };
  imports = [
    ./hyprland.nix
    ./binds.nix
    ./cursor.nix
    ./sounds.nix
    ./lock.nix
    ./shot.nix
    ./layouts.nix
    # ./bars-plugins.nix
  ];
}
