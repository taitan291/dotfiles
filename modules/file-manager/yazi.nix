_: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      mgr = {
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = false;
        sort_hidden_first = true;
        show_hidden = true;
      };
    };
    shellWrapperName = "y";
  };
}
