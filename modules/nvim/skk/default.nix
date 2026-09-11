{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      skkeleton
      denops-vim
      ddc-vim
      ddc-ui-native
    ];
    extraPackages = with pkgs; [
      deno
      skkDictionaries.l
      skkDictionaries.station
      skkDictionaries.fullname
    ];
    globals.skk_dict_path = "${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L";
  };
  imports = [
    ./keymaps.nix
    ./skkeleton
    ./fcitx5
  ];
}
