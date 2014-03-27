(require 'image-mode)
(define-key image-mode-map "n" 'next-image)
(define-key image-mode-map "p" 'previous-image)

(defun next-image (arg)
  "when visitng an image, go to the next image in the same
directory of the same type. No argument or nil will move to the
following image in ascending order, t will move to the previous
one.  Thanks to Drew Adams for help with this on gnu.emacs.help"
  (interactive "P")
  (unless (and (buffer-file-name) (eq major-mode 'image-mode))
    (error "Not visiting a file in image mode"))
  (let* ((files   (directory-files
		   (file-name-directory (buffer-file-name)) nil
		   (file-name-extension (buffer-file-name)) ))
         (len     (length files))
         (this    (file-name-nondirectory (buffer-file-name)))
         (idx     0))
    (catch 'next-image
      (dolist (file  files)
        (when (string= this file) (throw 'next-image (1+ idx)))
        (setq idx  (1+ idx))))
    (setq idx  (+ idx (if arg -1 1)))
    (when (< idx 0) (setq idx (1- len)))
    (when (>= idx len) (setq idx 0))
    (find-file (elt files idx))))

(defun previous-image (arg)
  "when visitng an image, go to the next image in the same
directory of the same type. No argument or nil will move to the
following image in ascending order, t will move to the previous
one.  Thanks to Drew Adams for help with this on gnu.emacs.help"
  (interactive "P")
  (next-image t))
