;; 文字コードをUTF-8にする
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; バックアップファイル（ファイル名~）を作らないようにする
(setq make-backup-files nil)

;; オートセーブファイル（#ファイル名#）を作らないようにする
(setq auto-save-default nil)
