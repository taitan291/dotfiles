{
  pkgs,
  inputs,
  ...
}: let
  ms-office = inputs.ms-office.packages.${pkgs.stdenv.hostPlatform.system};
in {
  home.packages = [
    ms-office.ms365
  ];
}
