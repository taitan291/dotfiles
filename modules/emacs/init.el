;;; init.el --- -*- lexical-binding: t; -*-

(use-package magit)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-ui)
