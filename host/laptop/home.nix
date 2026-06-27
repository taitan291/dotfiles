{...}:let
  home = ../../modules;
in  {
  imports = [
		(home + "/bash-laptop.nix")
  ];
}
