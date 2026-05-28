{...}: {
  services.hyprlock = {
    enable = true;
    settings = {
      ignore_empty_inpu = true;
    };
  };
}
