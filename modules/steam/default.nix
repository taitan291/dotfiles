{...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Remote Play用ポートの開放（任意）
    dedicatedServer.openFirewall = true; # Dedicated Server用（任意）
    localNetworkGameTransfers.openFirewall = true; # ローカル転送用（任意）
  };
}
