;;; init.el --- -*- lexical-binding: t; -*-

(use-package magit)
(use-package catppuccin-theme)
(use-package nix-mode :mode "\\.nix\\'")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-ui)
(require 'init-options)
(require 'init-lsp)
(require 'init-skk)
