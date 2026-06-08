(use-package web-mode
  :ensure nil
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.ts[x]?\\'" . web-mode)
	 ("\\.js[x]?\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t))

(use-package rust-ts-mode
	:ensure nil
  :mode (("\\.rs\\'" . rust-ts-mode)))

(use-package nix-ts-mode
  :ensure nil
  :mode "\\.nix\\'")

(use-package python-ts-mode
  :ensure nil
  :mode "\\.py\\'")

(use-package typst-ts-modE
	:mode "\\.typ\\'"
	:config
  ;; Eglotにtinymistを登録
  (with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
		`((typst-ts-mode) . ("tinymist" "lsp"))))
      
  ;; 保存時に自動でPDFエクスポートする場合の設定 (任意)
  (setq-default eglot-workspace-configuration
    '(:tinymist (:exportPdf "onSave")))
      
  :hook (typst-ts-mode . eglot-ensure))

