{...}:let
  home = ../../modules;
in  {
  imports = [
		(home + "/bash-desktop.nix")
  ];
}
