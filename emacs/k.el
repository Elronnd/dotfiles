(defun binned-paste ()
  (interactive)
  (let ((p (make-process :name "paster" :command '("upload" "0x0") :connection-type 'pipe
			 :filter (lambda (p s)
				   (message "%s" (substring s 0 -1)))))) ;trim trailing newline

    (apply #'process-send-region `(,p ,@(if (evil-visual-state-p)
					    `(,(evil-range-beginning (evil-visual-range))
					      ,(evil-range-end (evil-visual-range)))
					  `(1 ,(1+ (buffer-size))))))

    (process-send-eof p)))
