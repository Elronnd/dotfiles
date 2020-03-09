(bind-keys*
 ("M-s" . other-window)
 ("M-a" . previous-multiframe-window)
 ("M-k" . kill-this-buffer)

 ("M-o" . bs/switch-workspace)

 ;("<end>" . company-complete)

 ("C-1" . bs/write-current-buffer1)
 ("C-2" . bs/write-current-buffer2)
 ("C-3" . bs/write-current-buffer3)
 ("C-4" . bs/write-current-buffer4)
 ("C-5" . bs/write-current-buffer5)
 ("C-6" . bs/write-current-buffer6)
 ("C-7" . bs/write-current-buffer7)
 ("C-8" . bs/write-current-buffer8)
 ("C-9" . bs/write-current-buffer9)
 ("C-0" . bs/write-current-buffer0)

 ("M-1" . bs/jump-to-buffer1)
 ("M-2" . bs/jump-to-buffer2)
 ("M-3" . bs/jump-to-buffer3)
 ("M-4" . bs/jump-to-buffer4)
 ("M-5" . bs/jump-to-buffer5)
 ("M-6" . bs/jump-to-buffer6)
 ("M-7" . bs/jump-to-buffer7)
 ("M-8" . bs/jump-to-buffer8)
 ("M-9" . bs/jump-to-buffer9)
 ("M-0" . bs/jump-to-buffer0))

(define-key evil-motion-state-map (kbd "C-e") 'next-error)
(evil-define-key 'insert c-mode-map (kbd "C-e") 'next-error)
