{...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = ''
        $directory $username $git_branch $nix_shell
        $character'';

      directory = {
        format = "[$path](bold green)[$read_only](bold red)";
        truncation_length = 5;
        truncate_to_repo = false;
      };

      username = {
        format = "[\\[$user\\]](bold #F067A6)";
        show_always = true;
      };

      git_branch = {
        format = "[\\(($branch)\\)](bold #65BBE9)";
        only_attached = false;
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      nix_shell = {
        symbol = "❄️ ";
        format = "[$symbol]($style)";
        style = "bold blue";
        impure_msg = "impure";
        pure_msg = "pure";
        unknown_msg = "";
      };
    };
  };
}
