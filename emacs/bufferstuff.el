(setq bs/buffer-table-table (make-hash-table))
(setq bs/started nil)

(defun bs/write-current-buffer (key)
  (if (not bs/started)
      (progn
	(bs/switch-workspace)
	(setq bs/started t)))
  (puthash
   key
   (current-buffer)
   (gethash bs/current-table-name bs/buffer-table-table)))

(defun bs/jump-to-buffer (key)
  (if (not bs/started)
      (progn
	(bs/switch-workspace)
	(setq bs/started t)))
  (switch-to-buffer
   (gethash key
	    (gethash bs/current-table-name bs/buffer-table-table))))

(defun bs/switch-workspace ()
  (interactive)
  (let ((cur-ws ()))
    (maphash (lambda (k v) (push k cur-ws)) bs/buffer-table-table)
    (let ((new-ws (completing-read "Workspace: " cur-ws)))
      (if (null (gethash new-ws bs/buffer-table-table))
	  (puthash new-ws
		   (make-hash-table)
		   bs/buffer-table-table)
	0)
      (setq bs/current-table-name new-ws))))

(defun bs/write-current-buffer1 () (interactive) (bs/write-current-buffer "1"))
(defun bs/write-current-buffer2 () (interactive) (bs/write-current-buffer "2"))
(defun bs/write-current-buffer3 () (interactive) (bs/write-current-buffer "3"))
(defun bs/write-current-buffer4 () (interactive) (bs/write-current-buffer "4"))
(defun bs/write-current-buffer5 () (interactive) (bs/write-current-buffer "5"))
(defun bs/write-current-buffer6 () (interactive) (bs/write-current-buffer "6"))
(defun bs/write-current-buffer7 () (interactive) (bs/write-current-buffer "7"))
(defun bs/write-current-buffer8 () (interactive) (bs/write-current-buffer "8"))
(defun bs/write-current-buffer9 () (interactive) (bs/write-current-buffer "9"))
(defun bs/write-current-buffer0 () (interactive) (bs/write-current-buffer "0"))

(defun bs/jump-to-buffer1 () (interactive) (bs/jump-to-buffer "1"))
(defun bs/jump-to-buffer2 () (interactive) (bs/jump-to-buffer "2"))
(defun bs/jump-to-buffer3 () (interactive) (bs/jump-to-buffer "3"))
(defun bs/jump-to-buffer4 () (interactive) (bs/jump-to-buffer "4"))
(defun bs/jump-to-buffer5 () (interactive) (bs/jump-to-buffer "5"))
(defun bs/jump-to-buffer6 () (interactive) (bs/jump-to-buffer "6"))
(defun bs/jump-to-buffer7 () (interactive) (bs/jump-to-buffer "7"))
(defun bs/jump-to-buffer8 () (interactive) (bs/jump-to-buffer "8"))
(defun bs/jump-to-buffer9 () (interactive) (bs/jump-to-buffer "9"))
(defun bs/jump-to-buffer0 () (interactive) (bs/jump-to-buffer "0"))
