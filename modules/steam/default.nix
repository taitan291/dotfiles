_: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Remote Play用
    dedicatedServer.openFirewall = true; # Sourceゲーム用
    protontricks.enable = true;
    gamescopeSession.enable = true;
  };
}
