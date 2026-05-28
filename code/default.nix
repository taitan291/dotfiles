{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = "--locale=ja";
    };
    profiles.default.extensions = with pkgs.vscode-extensions; [
      #japanese
      ms-ceintl.vscode-language-pack-ja
      #color
      oderwat.indent-rainbow
      #auth
      formulahendry.auto-rename-tag
      streetsidesoftware.code-spell-checker
      shardulm94.trailing-spaces
      #github copilot
      github.copilot
      github.copilot-chat
      #git
      eamodio.gitlens
      donjayamanne.githistory
      mhutchie.git-graph
      #csv
      mechatroner.rainbow-csv
      #tinymist
      myriad-dreamin.tinymist
      #
      jnoortheen.nix-ide
      #rust
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      tamasfe.even-better-toml
      # astro
      astro-build.astro-vscode
    ];
  };
  imports = [
    ./settings.nix
  ];
}
