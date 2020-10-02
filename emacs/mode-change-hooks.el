(advice-add 'get-buffer-create :after
	    (lambda (name)
	      (let ((enabled (not (equal name "vterm"))))
		(hl-line-mode enabled))))

;(advice-add 'get-buffer-create :after
;	    (lambda (name)
;	      (let ((ext (car (last (split-string name "\\\.")))))
;		(if (or (equal ext "lisp")
;			(equal ext "scm")
;			(equal ext "el"))
;
;		    (progn
;		      (message "enabling")
;		      (setq-default indent-tabs-mode nil))
;
;		  (progn
;		    (message "disabling because name is %s" name)
;		    (setq-default indent-tabs-mode t))
;		  ))))


(add-hook 'buffer-list-update-hook
	  (lambda ()
	    (setq indent-tabs-mode
	      (if (equal major-mode 'lisp-mode) nil t))))
;(add-hook 'buffer-list-update-hook
;	  (lambda ()
;	    (evil-mode
;	     (if (equal major-mode 'vterm-mode) 0 1))))
