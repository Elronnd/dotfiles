;;; Nicer font than the default
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;(add-to-list 'default-frame-alist '(scroll-bar-width . 12))

;;; Colourscheme stuff
(custom-set-faces
 '(default ((t (:foreground "#eeeeee" :background "#000000"))))
 '(font-lock-builtin-face ((t (:foreground "#90a0e0"))))
 '(font-lock-comment-face ((t (:foreground "#5599ff"))))
 '(font-lock-string-face ((t (:foreground "#ff2222"))))
 '(font-lock-keyword-face ((t (:foreground "#22ee33"))))
 '(hl-line ((t (:background "#181818"))))
 '(show-paren-match ((t (:foreground "#ffffff" :weight bold :underline t))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#eeeeee"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#00cccc"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#00cc00" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#cc00cc"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#0000cc" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cccc00"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#00cc00" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#cc0000"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#cccc00" :weight bold)))))
