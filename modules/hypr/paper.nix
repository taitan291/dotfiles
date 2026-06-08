{...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "/home/taitan/Pictures/wallpapers/";
          fit_mode = "cover";
          timeout = 600;
        }
      ];
    };
  };
}
