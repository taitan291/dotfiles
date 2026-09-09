{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      mplus-outline-fonts.githubRelease
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];
        monospace = [
          "Noto Sans Mono CJK JP"
          "JetBrains Mono"
          "Noto Color Emoji"
        ];
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
}
