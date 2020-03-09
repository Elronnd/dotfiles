;;; Nicer font than the default
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;(add-to-list 'default-frame-alist '(scroll-bar-width . 12))

;;; Colourscheme stuff
(custom-set-faces
 '(default ((t (:foreground "#eeeeee" :background "#080808"))))
 '(font-lock-builtin-face ((t (:foreground "#90a0e0"))))
 '(font-lock-comment-face ((t (:foreground "#5599ff"))))
 '(font-lock-string-face ((t (:foreground "#ff2222"))))
 '(font-lock-keyword-face ((t (:foreground "#22ee33"))))
 '(hl-line ((t (:background "#181818")))))
