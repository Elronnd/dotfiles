;;; Package stuff
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 8)
(setq-default tab-width 8)
(setq-default evil-shift-width 8)

(mapcar (lambda (s) (eval `(use-package ,s :ensure t)))
	'(vterm
	  slime
	  d-mode
	  evil
	  projectile
	  irony irony-eldoc company-irony company-irony-c-headers
	  ivy
	  company
	  smart-tabs-mode
	  rainbow-delimiters
          cc-mode
	  org))

;(electric-pair-mode)
(global-eldoc-mode)
(evil-mode)
(projectile-mode)

(add-to-list 'load-path "~/emacs")
(load "k-mode")
(load "mode-change-hooks")
(load "key-binds")
(load "colouration")
(load "bufferstuff")

(add-hook 'after-init-hook #'global-company-mode)
(setq company-idle-delay 100000000)
;(setq company-minimum-prefix-length 2)
(setq irony-additional-clang-options (append '("-I" "i") irony-additional-clang-options))
(add-hook 'c-mode-hook #'irony-mode)
(add-hook 'c++-mode-hook #'irony-mode)
(add-hook 'irony-mode-hook #'irony-eldoc)
(add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook (lambda ()
			     (define-key irony-mode-map
			       [remap completion-at-point] 'counsel-irony)
			     (define-key irony-mode-map
			       [remap complete-symbol] 'counsel-irony)))
(eval-after-load 'company '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))
(ivy-mode)
(global-hl-line-mode)
(smart-tabs-insinuate 'c)
(add-hook 'c-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
(c-set-offset 'case-label '+)
(c-set-offset 'statement-case-open '0)
(setq c-auto-align-backslashes nil)
(setq backward-delete-char-untabify-method nil) ; backspace simply erases one tab character before the cursor.  No less (seriously, who thought /that/ was a good idea?), no more, just one character


(fringe-mode 0)
(scroll-bar-mode 0)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq show-paren-delay 0)
(show-paren-mode 1)

(global-visual-line-mode 1)

(setq org-hide-emphasis-markers t)
(setq inferior-lisp-program "/bin/sbcl")

;; Stop modifying my damn config file.  Please.
(setq custom-file "/dev/null")

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
