{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          tinymist = {
            enable = true;
            settings = {
              exportPdf = "onSave";
              formatterMode = "typstyle";
              preview = {
                exportPdf = "onSave";
                refresh = "onSave";
                http = "127.0.0.1:23333";
              };
            };
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      typst-preview-nvim
    ];

    extraConfigLua = ''
      -- Typstプレビューの初期化設定
      require('typst-preview').setup {
        -- nixpkgs経由でインストールしたtinymistのパスを明示的に指定し連携
        dependencies_bin = {
          ['tinymist'] = "${pkgs.tinymist}/bin/tinymist",
        },
      }
    '';
  };
  home.packages = with pkgs; [
    typst
    tinymist
  ];
  imports = [
    ./keymaps.nix
  ];
}
