;;; Package stuff
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package vterm :ensure t) ; vt100/etc.
(use-package slime :ensure t) ; nice lisp stuff
(use-package magit :ensure t) ; git integration
(require 'org)

(add-to-list 'load-path "~/emacs")
(load "k-mode")

(setq org-hide-emphasis-markers t)
(setq inferior-lisp-program "/bin/sbcl")

(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq backup-by-copying t)


;;; Obvious
(blink-cursor-mode 0)

;;; Highlight the current line
(global-hl-line-mode 1)

;;; Nicer font than the default
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;;; Colourscheme stuff
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#eeeeee" :background "#080808"))))
 '(font-lock-builtin-face ((t (:foreground "#90a0e0"))))
 '(font-lock-comment-face ((t (:foreground "#7766ee"))))
 '(font-lock-string-face ((t (:foreground "#cc2222"))))
 '(hl-line ((t (:background "#181818")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (vterm use-package slime org-link-minor-mode magit))))
