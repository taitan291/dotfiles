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
		# thefuck = {
		# 	enable = true;
		# 	enableZshIntegration = true; # Zsh用のエイリアスとフックを自動設定
		# };
		pay-respects = {
			enable = true;
			enableZshIntegration = true; # Zsh用の連携を有効化（Zsh有効時はデフォルトでtrueになります）
		};
  };

  # 必要に応じてエイリアスを設定
  home = {
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      cat = "bat";

      sl = "ls && sl";
      lgit = "lazygit";
    };
    packages = with pkgs; [
      hunspell
      git-graph
      lazygit
      gti
      sl

      ripgrep
      tokei
    ];
  };
}
