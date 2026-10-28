{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.programs.emacs-twist;
  emacs = import ./env.nix {inherit pkgs inputs;};
in {
  options.programs.emacs-twist.enable = lib.mkEnableOption "emacs-twist environment";

  config = lib.mkMerge [
    {programs.emacs-twist.enable = lib.mkDefault true;}
    (lib.mkIf cfg.enable {
      home.packages = [emacs pkgs.skkDictionaries.l pkgs.nixd];
      xdg.configFile."emacs/init.el".source = ./init.el;
      xdg.configFile."emacs/lisp".source = ./lisp;
    })
  ];
}
