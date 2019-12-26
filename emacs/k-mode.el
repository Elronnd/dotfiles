;; emacs major mode for k

(setq k-highlights
      '(("\\(`i\\|`f\\|`j\\|`c\\|`n\\|`D\\|`t\\|`a\\|`A\\|`\\.\\)[^[:alpha:]]" . font-lock-type-face)
	(" /.*\\|^/.*" . font-lock-comment-face)
	("ø\\|Ø\\|∞\\|π" . font-lock-constant-face)
	("\\([[:digit:]]+\\.?[[:digit:]]*\\)\\|\\([[:digit:]]*\\.?[[:digit:]]+\\)\\|\\(\\\".*\\\"\\)\\|\\(`[[:alpha:]]+\\)" . font-lock-string-face)))

(define-derived-mode k-mode fundamental-mode "k"
  "k7 major mode"
  (setq font-lock-defaults '(k-highlights)))

(provide 'k-mode)
