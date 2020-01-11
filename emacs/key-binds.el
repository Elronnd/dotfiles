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

(bind-keys*
 ("M-s" . other-window)
 ("M-a" . previous-multiframe-window)
 ("<end>" . smart-tab)
 ("M-k" . kill-this-buffer)
 ("M-o" . previous-buffer)
 ("M-p" . next-buffer))
