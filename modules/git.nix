{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "taitan291";
        email = "194503384+taitan291@users.noreply.github.com";
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "TaiTan291";
        email = "194503384+taitan291@users.noreply.github.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview]; # オススメ
    settings = {
      editor = "nvim";
      git_protocol = "https";
    };
  };
}
