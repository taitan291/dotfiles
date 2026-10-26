;;; init.el --- -*- lexical-binding: t; -*-

(use-package magit)
(use-package catppuccin-theme)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-ui)
