{
  pkgs,
  inputs,
}: let
  emacsPkgs = pkgs.extend inputs.emacs-overlay.overlays.default;
in
  inputs.twist.lib.makeEnv {
    pkgs = emacsPkgs;
    emacsPackage = emacsPkgs.emacs-pgtk;
    initFiles = [./init.el];
    initParser = inputs.twist.lib.parseUsePackages {inherit (emacsPkgs) lib;} {alwaysEnsure = true;};
    lockDir = ./lock;
    registries = [
      {
        name = "melpa";
        type = "melpa";
        path = inputs.melpa.outPath + "/recipes";
        exclude = ["org"];
      }
      {
        name = "gnu-elpa";
        type = "elpa";
        path = inputs.gnu-elpa.outPath + "/elpa-packages";
      }
    ];
    inventories = [];
  }
