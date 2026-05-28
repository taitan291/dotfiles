{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      hyprcursor #カーソル
      hyprshot #スクリーンショット
      hyprlock # hyprlock
      kitty #ターミナル
      wofi #ランチャー
      pavucontrol #音量調整(GUI)
      playerctl #音量調整(CUI)
      alsa-utils
      dunst
      fastfetch
      brightnessctl #画面高度
    ];
    file = {
      "Pictures/Screenshots/.keep".text = "";
      "Pictures/wallpapers/.keep".text = "";
    };
  };

  imports = [
    ./hyprland.nix
    ./paper.nix
    #./lock.nix
    #./cursor.nix
  ];
}
