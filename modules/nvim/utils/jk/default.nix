{pkgs, ...}: {
  programs.nixvim = {
    # extraPlugins = with pkgs.vimPlugins; [
    #   tobira
    # ];
    extraConfigLua = builtins.readFile ./config.lua;
  };
}
