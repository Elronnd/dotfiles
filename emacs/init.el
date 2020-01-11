;;; Package stuff
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package vterm :ensure t)
(use-package slime :ensure t)
(use-package magit :ensure t)
(use-package d-mode :ensure t)
(use-package evil :ensure t)
(use-package rust-mode :ensure t)
(require 'org)

(add-to-list 'load-path "~/emacs")
(load "k-mode")

(setq org-hide-emphasis-markers t)
(setq inferior-lisp-program "/bin/sbcl")

(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq backup-by-copying t)

;;; don't show startup message/splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq initial-scratch-message nil)

(menu-bar-mode 0)
(tool-bar-mode 0)

;;; Don't have folds in org-mode
(setq org-startup-folded nil)

;;; Obvious
(blink-cursor-mode 0)

;;; Nicer font than the default
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;;; Colourscheme stuff
(custom-set-faces
 '(default ((t (:foreground "#eeeeee" :background "#080808"))))
 '(font-lock-builtin-face ((t (:foreground "#90a0e0"))))
 '(font-lock-comment-face ((t (:foreground "#5599ff"))))
 '(font-lock-string-face ((t (:foreground "#ff2222"))))
 '(font-lock-keyword-face ((t (:foreground "#22ee33"))))
 '(hl-line ((t (:background "#181818")))))

(advice-add 'get-buffer-create :after
	    (lambda (name)
	      (let ((enabled (not (equal name "vterm"))))
		(hl-line-mode enabled)
		(display-line-numbers-mode enabled))))

(add-hook 'buffer-list-update-hook
	  (lambda ()
		(evil-mode
		 (if (equal major-mode 'vterm-mode) 0 1))))

(defun smart-tab ()
  (interactive)
      (if (minibufferp)
          (unless (minibuffer-complete)
            (dabbrev-expand nil))
        (if mark-active
            (indent-region (region-beginning)
                           (region-end))
          (if (looking-at "\\_>")
              (dabbrev-expand nil)
            (indent-for-tab-command)))))

(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

(setq-default c-basic-offset 8)

(bind-keys*
 ("M-s" . other-window)
 ("M-a" . previous-multiframe-window)
 ("<end>" . smart-tab))
; ("M-k" . )
