{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
		nativeMessagingHosts = [
			pkgs.firefoxpwa
		];
  };
}
