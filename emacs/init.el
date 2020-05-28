;;; Package stuff
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package vterm :ensure t)
(use-package slime :ensure t)
(use-package d-mode :ensure t)
(use-package evil :ensure t)
(use-package rust-mode :ensure t)
;(use-package fsharp-mode :ensure t)

(use-package rainbow-delimiters :ensure t)
(require 'org)

(evil-mode)

(add-to-list 'load-path "~/emacs")
(load "k-mode")
(load "mode-change-hooks")
(load "key-binds")
(load "colouration")
(load "bufferstuff")

(fringe-mode 0)
(scroll-bar-mode 0)

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

(setq-default c-basic-offset 8)
