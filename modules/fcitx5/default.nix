_: {
  xdg.dataFile."fcitx5/lua/imeapi/extensions/skk_config.lua".source = ./config.lua;
  xdg.configFile."fcitx5/conf/skk.conf".source = ./conf/skk.conf;
  xdg.configFile."fcitx5/config".source = ./fcitx5.conf;
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        # fcitx5
        "QT_IM_MODULE,fcitx5"
        "GTK_IM_MODULE=fcitx5"
        "XMODIFIERS,@im=fcitx5"
      ];
    };
  };
}
