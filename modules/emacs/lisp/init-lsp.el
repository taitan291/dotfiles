;;; init-lsp.el --- Eglot -*- lexical-binding: t; -*-

;; --- Eglot (組み込みLSPクライアント) ---
(require 'eglot)

(setq eglot-autoshutdown t           ; 最後のバッファを閉じたらサーバも終了
      eglot-sync-connect nil         ; 接続中にUIをブロックしない
      eglot-events-buffer-config '(:size 0)) ; イベントログを無効化(軽量化)

(define-key eglot-mode-map (kbd "C-c l r") #'eglot-rename)
(define-key eglot-mode-map (kbd "C-c l a") #'eglot-code-actions)
(define-key eglot-mode-map (kbd "C-c l f") #'eglot-format)
(define-key eglot-mode-map (kbd "C-c l h") #'eldoc)

;; --- Nix: nixd ---
(add-to-list 'eglot-server-programs
             '((nix-mode nix-ts-mode) . ("nixd")))

(add-hook 'nix-mode-hook #'eglot-ensure)
(add-hook 'nix-ts-mode-hook #'eglot-ensure)

;; 保存時に整形
(defun my/eglot-format-on-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer nil t))
(add-hook 'eglot-managed-mode-hook #'my/eglot-format-on-save)

(provide 'init-lsp)
