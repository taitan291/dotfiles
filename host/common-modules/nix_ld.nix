{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # workerd や Node.js 拡張が必要とする一般的なライブラリ
    stdenv.cc.cc
    zlib
    # 必要に応じて他に追加（通常は stdenv.cc.cc があれば動くことが多いです）
  ];
}
