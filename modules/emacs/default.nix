{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.programs.emacs-twist;
  emacsPkgs = pkgs.extend inputs.emacs-overlay.overlays.default;
  emacs = inputs.twist.lib.makeEnv {
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
  };
in {
  options.programs.emacs-twist.enable = lib.mkEnableOption "emacs-twist environment";

  config = lib.mkMerge [
    {programs.emacs-twist.enable = lib.mkDefault true;}
    (lib.mkIf cfg.enable {
      home.packages = [emacs];
      xdg.configFile."emacs/lisp".source = ./lisp;
    })
  ];
}
