{
  projectRootFile = "flake.nix";
  programs = {
    alejandra.enable = true; # nix
    rustfmt.enable = true; # rust
    typstyle.enable = true; # typst
    mdformat.enable = true; # md
    ruff.enable = true; # python
    stylua.enable = true; # Lua
    prettier.enable = true; # HTML/CSS/JSON
  };
  settings.global.excludes = ["flake.lock"];
}
