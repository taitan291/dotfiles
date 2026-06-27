;; カラースキーム
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)

;; メニューバー、ツールバー、スクロールバーを消す
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
	(scroll-bar-mode -1))(menu-bar-mode -1)

;; 行番号を表示する
(global-display-line-numbers-mode t)
