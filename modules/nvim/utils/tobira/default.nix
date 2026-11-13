{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      accelerated-jk
    ];
    extraConfigLua = builtins.readFile ./config.lua;
  };
  keymaps = [
    {
      mode = "n";
      key = "j";
      action = "<Plug>(accelerated_jk_gj)";
      options.remap = true;
    }
    {
      mode = "n";
      key = "k";
      action = "<Plug>(accelerated_jk_gk)";
      options.remap = true;
    }
  ];
}
