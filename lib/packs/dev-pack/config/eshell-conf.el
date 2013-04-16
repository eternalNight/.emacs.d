(defcustom eshell-directory-name
  (let* ((dir (concat config/tmp-dir "eshell")))
    (make-directory dir t)
    dir)
  "The directory where Eshell control files should be kept."
  :type 'directory
  :group 'eshell)

(custom-set-variables
 '(eshell-cmpl-cycle-completions nil)              ;; Use bash-like completion style
)

(global-set-key (kbd "<f3>") 'eshell)

(put 'erase-buffer 'disabled nil)
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
