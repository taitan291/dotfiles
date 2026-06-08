{pkgs, ...}: let
  /*
  skkeleton = pkgs.vimUtils.buildVimPlugin {
  name = "skkeleton";
  src = pkgs.fetchFromGitHub {
    owner = "vim-skk";
    repo = "skkeleton";
    rev = "2.0.0";
    sha256 = "sha256-PRYm015GqZ0JPIbsFG29Q89M4BDE9sG9Le/UakiaWEE=";
  };
  };
  skk-jisyo-l = pkgs.fetchurl {
  url = "https://github.com/skk-dev/dict/blob/master/SKK-JISYO.L";
  sha256 = "sha256-g4AAezS+AAq9rJ3wmO7uxaPRE2j5T+RAjUKk+m5qqWM=";
  };
  skk-jisyo-jinmei = pkgs.fetchurl {
  url = "https://github.com/skk-dev/dict/blob/master/SKK-JISYO.jinmei";
  sha256 = "sha256-NXkgkTIDR4RroKAfUx3JYdrc1D3nACkc6q7ooRqinnw=";
  };
  skk-jisyo-station = pkgs.fetchurl {
  url = "https://github.com/skk-dev/dict/blob/master/SKK-JISYO.station";
  sha256 = "sha256-+m1TcFMl3eD6r1n5sk6Kz+HuGJFrseOXmbKIL7OcgNg=";
  };
  skk-jisyo-emoji = pkgs.fetchurl {
  url = "https://github.com/skk-dev/dict/blob/master/SKK-JISYO.emoji";
  sha256 = "sha256-LIkVZ99MRRN1VGFS8qhsPtmzIox3eHZPyxeq7MpShXw=";
  };
  */
in {
  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;

    colorschemes.nightfox = {
      enable = true;
      flavor = "nightfox";
    };
  };

  /*
  xdg.configFile = {
  "skk/user.dict".text = "";
  "skk/SKK-JISYO.L".source = skk-jisyo-l;
  "skk/SKK-JISYO.jinmei".source = skk-jisyo-jinmei;
  "skk/SKK-JISYO.station".source = skk-jisyo-station;
  "skk/SKK-JISYO.emoji".source = skk-jisyo-emoji;
  };
  */

  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];
}
