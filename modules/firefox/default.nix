{pkgs, config, ...}: {
  programs.firefox = {
    enable = true;
		configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      search = {
        default = "google";
        force = true;
      };

      settings = {
        "browser.startup.homepage" = "https://www.google.com";

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;

        "signon.rememberSignons" = false; # パスワード保存プロンプトの無効化
        "privacy.trackingprotection.enabled" = true; # トラッキング保護

        "sidebar.position_start" = true;
        "sidebar.visible" = true;
      };
      userChrome = builtins.readFile ./chrome.css;
    };
  };
}
