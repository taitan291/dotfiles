{...}: {
  programs.nixvim = {
    opts = {
      list = true;
      listchars = {
        tab = "▸ ";
        trail = "·";
        nbsp = "␣";
        extends = "⟩";
        precedes = "⟨";
      };
    };

    extraConfigLua = builtins.readFile ./config.lua;
  };
}
