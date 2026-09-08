{
  xdg.configFile = {
    # Fcitx5 reads these files from ~/.config/fcitx5.
    "fcitx5/config".source = ./fcitx5.conf;
    "fcitx5/conf/skk.conf".source = ./conf/skk.conf;
  };

  # Lua extensions are loaded from ~/.local/share/fcitx5, rather than the
  # configuration directory.
  xdg.dataFile."fcitx5/lua/imeapi/extensions/skk_config.lua".source = ./config.lua;
}
