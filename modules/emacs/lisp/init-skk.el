;;; init-skk.el --- ddskk と fcitx5 の制御 -*- lexical-binding: t; -*-

;; --- DDSKK ---
(use-package ddskk
  :init
  (setq skk-user-directory (locate-user-emacs-file "ddskk")
        skk-large-jisyo (or (getenv "SKK_LARGE_JISYO") (expand-file-name "~/.nix-profile/share/skk/SKK-JISYO.L"))
        skk-egg-like-newline t
        skk-show-inline 'vertical
        skk-use-azik nil)
  :bind (("C-x C-j" . skk-mode)))

;; --- Emacsにフォーカスがある間は fcitx5 を止める ---
(defvar my/fcitx5-was-running nil)

(defun my/fcitx5-running-p ()
  (zerop (call-process "pgrep" nil nil nil "-f" "^[^ ]*fcitx5( |$)")))

(defun my/fcitx5-stop ()
  (when (my/fcitx5-running-p)
    (setq my/fcitx5-was-running t)
    (call-process "pkill" nil nil nil "-f" "^[^ ]*fcitx5( |$)")))

(defun my/fcitx5-restore ()
  (when (and my/fcitx5-was-running (not (my/fcitx5-running-p)))
    (start-process "fcitx5" nil "fcitx5" "-d"))
  (setq my/fcitx5-was-running nil))

(defun my/fcitx5-focus ()
  (if (seq-some #'frame-focus-state (frame-list))
      (my/fcitx5-stop)
    (my/fcitx5-restore)))

(my/fcitx5-stop)
(add-function :after after-focus-change-function #'my/fcitx5-focus)
(add-hook 'kill-emacs-hook #'my/fcitx5-restore)

(provide 'init-skk)
