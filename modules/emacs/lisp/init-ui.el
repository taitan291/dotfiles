;;; init-ui.el --- 見た目 -*- lexical-binding: t; -*-

(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)

;;; 見た目(非表示設定)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; 起動時にScratchバッファーを起動
(setq inhibit-startup-screen t)

;;; 行
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1) ;;; 行番号の表示
(column-number-mode 1) ;;; (行,列)の形で表示

; フォントの指定
(set-face-attribute 'default nil :font "M PLUS 1 Code JP-12")

(provide 'init-ui)
