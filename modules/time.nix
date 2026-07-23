{ pkgs, ... }:

{
  home.packages = with pkgs; [
    coreutils # date コマンド（通常標準で利用可能）
    util-linux # cal コマンド（カレンダー表示用）
  ];

  programs.zsh.shellAliases = {
    now = "date '+%Y-%m-%d %H:%M:%S (%a)'";
    calm = "cal -m";
  };
}
