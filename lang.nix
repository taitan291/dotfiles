{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # C++
      gcc
      gnumake
      cmake

      # Rust
      (rust-bin.stable.latest.default.override {
        extensions = [
          "rust-src"
          "rustfmt"
          "clippy"
          "rust-analyzer"
        ];
      })

      # Python
      python3
      uv

      # JS
      nodejs_22
      pnpm

      # Latex
      texlive.combined.scheme-full

      # Typst
      typst
    ];
  };
}
