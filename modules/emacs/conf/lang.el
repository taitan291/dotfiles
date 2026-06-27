;; Typstの設定
(use-package typst-ts-mode
  :mode "\\.typ\\'"
  :custom
  (typst-ts-mode-watch-options "--open")
  :hook
  (typst-ts-mode . (lambda ()
                     (require 'eglot)
                     (add-to-list 'eglot-server-programs
                                  '((typst-ts-mode) . ("tinymist")))
                     (eglot-ensure))))
