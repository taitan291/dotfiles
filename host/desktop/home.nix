_: let
  home = ../../modules;
in {
  imports = [
    (home + "/home.nix")

    (home + "/shell/desktop.nix")
  ];
}
