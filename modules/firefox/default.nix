{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    nativeMessagingHosts = [
      pkgs.firefoxpwa
    ];
  };

  home.packages = with pkgs; [
    firefoxpwa
    wlrctl
  ];

  home.file.".local/bin/copilot-toggle" = {
    executable = true;
    text = ''
      #!/usr/bin/env zsh

      APP_ID="copilot"

      if pgrep -f "firefoxpwa.*$APP_ID" >/dev/null; then
        wlrctl window focus "Microsoft Copilot" 2>/dev/null || true
      else
        firefoxpwa site launch "$APP_ID"
      fi
    '';
  };
}
