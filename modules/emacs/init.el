(add-to-list 'load-path
             (expand-file-name "conf" (file-name-directory user-init-file)))

(load "ui")
(load "lang")
(load "base")
