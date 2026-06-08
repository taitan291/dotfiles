;; インデント設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; 検索の挙動
(setq case-fold-search t)

(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
;; 時間も表示
(display-time)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)
;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))
;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)
;; 対応する括弧をハイライト
(show-paren-mode 1)
;; リージョンのハイライト
(transient-mark-mode 1)
;; current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))
;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
;; buffer の最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))
;; active window move
(global-set-key (kbd "<c-left>")  'windmove-left)
(global-set-key (kbd "<c-down>")  'windmove-down)
(global-set-key (kbd "<c-up>")    'windmove-up)
(global-set-key (kbd "<c-right>") 'windmove-right)
;; rgrep の header message を消去
(defun delete-grep-header ()
  (save-excursion
    (with-current-buffer grep-last-buffer
      (goto-line 5)
      (narrow-to-region (point) (point-max)))))
(defadvice grep (after delete-grep-header activate) (delete-grep-header))
(defadvice rgrep (after delete-grep-header activate) (delete-grep-header))
;; "grep バッファに切り替える"
(defun my-switch-grep-buffer()
  (interactive)
    (if (get-buffer "*grep*")
            (pop-to-buffer "*grep*")
      (message "No grep buffer")))
(global-set-key (kbd "s-e") 'my-switch-grep-buffer)
;; 履歴参照
(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))
;; Terminal 化
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-c o") 'shell-pop)
;;
;; setq
;;
;; ⌘  キーを super として割り当てる
(setq mac-command-modifier 'super)
;; クリップボードへのコピー
(setq x-select-enable-clipboard t)
;; C-k で行全体を削除する
(setq kill-whole-line t)
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)
;; エラー音をならなくする
(setq ring-bell-function 'ignore)
;; *.~  バックアップファイルを作らない
(setq make-backup-files nil)
;; .#*  バックアップファイルを作らない
(setq auto-save-default nil)
;; tabサイズ
(setq default-tab-width 4)
;; タイトルにフルパス表示
(setq frame-title-format "%f")
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)
;; scratch の初期メッセージ消去
(setq initial-scratch-message "")
;; スクロールは 1 行ごと
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))
;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)
;; 大文字・小文字を区別しない
(setq case-fold-search t)
;; rgrep 時などに新規に window を立ち上げる
(setq special-display-buffer-names '("*Help*" "*compilation*" "*interpretation*" "*grep*" ))
;;
;; define-key
;;
;; Contol H で 1 文字削除
;; (define-key global-map "\C-h" 'delete-backward-char)
;; 上記定義では Mini Buffer 内では削除できない可能性があるので以下を再定義
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
;; ヘルプの表示を M-? 変更
(define-key global-map "\M-?" 'help-for-help)
;; ファイル名検索
(define-key global-map [(super i)] 'find-name-dired)
;; ファイル内検索
(define-key global-map [(super f)] 'rgrep)
;;
;; put
;;
;; リージョンの大文字小文字変換
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; emacs/init.el 等
(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

;; 起動キーバインド例 (C-c t)
(global-set-key (kbd "C-c t") 'vterm)

;; Dired: ディレクトリ表示の強化
(setq dired-listing-switches "-alh --group-directories-first") ; ディレクトリを先に、詳細表示
(setq dired-dwim-target t) ; 2画面開いている時に移動先を自動推測

;; Projectile: プロジェクト内のファイル移動
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Neotree: サイドバーのトグル設定
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow)) ; グラフィカル環境ならアイコン使用

;; クリップボードの共有（OSのクリップボードと同期）
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; ペースト（Yank）時に直後のインデントを自動調整
(defun yank-with-indent ()
  (interactive)
  (let ((indent-threshold 500)) ; 大規模なペーストでのフリーズ防止
    (yank)
    (when (and (not (derived-mode-p 'python-mode)) ; Python等インデントに意味がある言語は除外
               (< (abs (- (point) (mark))) indent-threshold))
      (indent-region (mark) (point)))))

;; キーバインド（標準の C-y を自動インデント版に差し替え）
(global-set-key (kbd "C-y") 'yank-with-indent)

;; browse-kill-ringの設定（履歴から選んでペースト）
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings) ;

;; undo-treeの設定
(require 'undo-tree)
(global-undo-tree-mode t)

;; C-z を undo に割り当て（標準の C-/ も使用可能）
(global-set-key (kbd "C-z") 'undo)
;; C-S-z (Shift + C-z) を redo に割り当て
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; 永続化（履歴をファイルに保存）を無効にする場合（~/.emacs.d/undo-tree 配下の汚れ防止）
(setq undo-tree-auto-save-history nil)
