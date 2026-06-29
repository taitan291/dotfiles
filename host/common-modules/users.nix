{pkgs, ...}: {
	programs.zsh.enable = true;
  users.users.taitan = {
    isNormalUser = true;
    description = "taitan";
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "video"
    ];
    shell = pkgs.zsh;
    home = "/home/taitan";
  };
}
