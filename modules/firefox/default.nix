{ pkgs, config, lib, ... }: {
  programs.firefox = {
    enable = true;
		configPath = "${config.xdg.configHome}/mozilla/firefox";
		nativeMessagingHosts = [
			pkgs.firefoxpwa
		];
  };
	home.activation = {
    # 既存のディレクトリが存在する場合のみ、XDGパスへ移行を実行
    migrateFirefoxConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ -d "$HOME/.mozilla/firefox" ]; then
        $DRY_RUN_CMD mkdir -p "''${XDG_CONFIG_HOME:-$HOME/.config}/mozilla"
        $DRY_RUN_CMD mv "$HOME/.mozilla/firefox" "''${XDG_CONFIG_HOME:-$HOME/.config}/mozilla/firefox"
        $DRY_RUN_CMD rmdir "$HOME/.mozilla" 2>/dev/null || true
      fi
    '';
  };
}
