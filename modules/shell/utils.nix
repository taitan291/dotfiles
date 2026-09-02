{pkgs, ...}: {
  programs = {
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    eza = {
      enable = true;
      icons = "auto";
      git = true;
    };
    bat.enable = true;
    fd = {
      enable = true;
      hidden = true;
      extraOptions = [
        "--exclude"
        ".git"
      ];
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    pay-respects = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # 必要に応じてエイリアスを設定
  home = {
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      cat = "bat";

      lgit = "lazygit";
    };
    packages = with pkgs; [
      hunspell
      git-graph
      lazygit

      ripgrep
      tokei
    ];
  };
}
