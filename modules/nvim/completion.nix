{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;
      autoEnableSources = true; # 対応するcmpソースプラグインを自動有効化
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
        };
        sources = [
          {name = "nvim_lsp";} # LSPからの補完
          {name = "luasnip";} # スニペット補完
          {name = "buffer";} # バッファ内のワード補完
          {name = "path";} # パス補完
        ];
      };
    };
  };
}
