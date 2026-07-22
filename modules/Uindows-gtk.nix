{pkgs, config, ...}:let
  uindowsGtk = pkgs.stdenv.mkDerivation {
    pname = "uindows-theme";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "Davidy22";
      repo = "Uindows";
      rev = "a1f1a6ee503a5f499e3c9c985d567c8a98dcbf83";
      hash = "sha256-Tq/Wq6fAOFuQVeU0cC82jY7iYJChp2neUj/2d3ZuRsk=";
    };
    installPhase = ''
      mkdir -p $out/share/themes/Uindows
      cp -r * $out/share/themes/Uindows/
    '';
  };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Uindows";
      package = uindowsGtk;
    };
		gtk3.extraConfig = {
      gtk-theme-name = "Uindows";
    };
    gtk4 = {
			extraConfig = {
				gtk-theme-name = "Uindows";
			};
			theme = config.gtk.theme;
		};
  };
	home.sessionVariables = {
    GTK_THEME = "Uindows";
  };
}
