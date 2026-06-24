{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      ipaexfont
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
}
