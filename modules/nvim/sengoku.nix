{pkgs, ...}: let
  sengoku = pkgs.vimUtils.buildVimPlugin {
    name = "sengoku";
    src = builtins.fetchGit {
      url = "https://github.com/miraihack/VimnaganoYabo";
      rev = "9b38919e5f0cb597a1518d5de35d00e7693cd560";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
			sengoku
    ];
  };
}
