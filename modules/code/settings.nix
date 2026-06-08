{...}: {
  programs.vscode = {
    profiles.default.userSettings = {
      "locale" = "ja";
      "security.workspace.trust.enabled" = false;
      #rust
      "rust-analyzer.server.path" = "rust-analyzer";
      "rust-analyzer.cargo.features" = "all";
      "rust-analyzer.checkOnSave.command" = "clippy";
      #copilot
      "github.copilot.enable" = {
        "*" = false;
        "plaintext" = false;
        "markdown" = false;
        "scminput" = false;
      };
      "editor.inlineSuggest.enabled" = false;
      "editor.inlayHints.enabled" = "off";
    };
  };
}
