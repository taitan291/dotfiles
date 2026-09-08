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
    ./shot.nix
    ./land.nix
    ./cursor.nix
    ./lock.nix
    ./sounds.nix
  ];
}
