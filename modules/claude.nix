{
  pkgs,
  inputs,
  ...
}: let
  # upstream は pkgs.nodePackages.asar を参照しているが nixpkgs から削除されたため差し替える
  src = inputs.claude-desktop;
  patchy-cnb = pkgs.callPackage "${src}/pkgs/patchy-cnb.nix" {};
  claude-desktop = pkgs.callPackage "${src}/pkgs/claude-desktop.nix" {
    inherit patchy-cnb;
    nodePackages = {inherit (pkgs) asar;};
  };
  claude-desktop-with-fhs = pkgs.buildFHSEnv {
    name = "claude-desktop";
    targetPkgs = pkgs:
      with pkgs; [
        docker
        glibc
        openssl
        nodejs
        uv
      ];
    runScript = "${claude-desktop}/bin/claude-desktop";
    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cp ${claude-desktop}/share/applications/claude.desktop $out/share/applications/

      mkdir -p $out/share/icons
      cp -r ${claude-desktop}/share/icons/* $out/share/icons/
    '';
  };
in {
  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code;
  };

  # Claude Desktop (非公式 Linux ビルド)
  home.packages = [claude-desktop-with-fhs];
}
