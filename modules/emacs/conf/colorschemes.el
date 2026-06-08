;; doom-palenight は Nightfox (Duskfox系) に近い配色
(load-theme 'doom-palenight t)
      
;; 既存の doom-themes のフラッシュ機能などを有効化
(doom-themes-visual-bell-config)
(doom-themes-neotree-config)

(custom-set-faces
 '(font-lock-comment-face ((t (:slant italic))))           ;; コメントを斜体に
 '(font-lock-keyword-face ((t (:weight bold))))           ;; キーワードを太字に
 '(tree-sitter-hl-face:function ((t (:foreground "#89b4fa")))) ;; 関数のハイライト色
)
