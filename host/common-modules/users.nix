{pkgs, ...}: {
  users.users.taitan = {
    isNormalUser = true;
    description = "taitan";
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "video"
    ];
    shell = pkgs.bash;
    home = "/home/taitan";
  };
}
