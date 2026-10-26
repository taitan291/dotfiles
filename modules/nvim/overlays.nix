final: prev: {
  vimPlugins =
    prev.vimPlugins
    // {
      skkeleton = prev.vimUtils.buildVimPlugin {
        name = "skkeleton";
        src = builtins.fetchGit {
          url = "https://github.com/vim-skk/skkeleton";
          rev = "42b7b62062e5eb4ba157b9e8d12a104777bbd9b3";
        };
      };

      tobira = prev.vimUtils.buildVimPlugin {
        name = "tobira";
        src = builtins.fetchGit {
          url = "https://github.com/kamegoro/tobira.nvim";
          rev = "681388ff25aaf287ca2c6c8d93a55016de4ec6d3";
        };
      };
    };
}
