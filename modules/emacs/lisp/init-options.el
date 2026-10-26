;;; init-options.el --- 編集まわりの設定 -*- lexical-binding: t; -*-

;; --- 編集まわり ---
(setq-default indent-tabs-mode nil)  ; タブではなくスペース
(electric-pair-mode 1)               ; 括弧の自動補完
(show-paren-mode 1)
(global-auto-revert-mode 1)          ; 外部で変更されたファイルを自動再読込
(delete-selection-mode 1)            ; 選択範囲に上書き入力
(setq ring-bell-function 'ignore)

;; --- バックアップ・履歴 ---
(setq make-backup-files nil          ; foo~ を作らない
      auto-save-default nil          ; #foo# を作らない
      create-lockfiles nil)
(recentf-mode 1)                     ; 最近開いたファイル
(save-place-mode 1)                  ; 前回のカーソル位置を復元
(savehist-mode 1)                    ; ミニバッファ履歴を保存

;; --- customize の出力を init.el から分離 ---
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;; --- 文字コード ---
(prefer-coding-system 'utf-8)

(provide 'init-options)
