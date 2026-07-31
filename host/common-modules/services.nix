_: {
  services.logind.settings = {
    Login = {
      HandleLidSwitch = "suspend";
    };
  };

  programs.dconf.enable = true;
}
