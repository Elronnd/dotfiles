(advice-add 'get-buffer-create :after
	    (lambda (name)
	      (let ((enabled (not (equal name "vterm"))))
		(hl-line-mode enabled))))

(add-hook 'buffer-list-update-hook
	  (lambda ()
	    (evil-mode
	      (if (equal major-mode 'vterm-mode) 0 1))))
