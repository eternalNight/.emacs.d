(defcustom magit-ext-top-dir nil
  "Git top directory where magit-ext-* tries to work in"
  :safe 'file-directory-p
  :type '(directory)
  :group 'magit)

(defun magit-ext-show-commit-at-point ()
  "Showing the commit at point"
  (interactive)
  (if (and magit-ext-top-dir
	   (file-directory-p magit-ext-top-dir))
      (let (d default-directory)
	(cd magit-ext-top-dir)
	(magit-show-commit (thing-at-point 'word))
	(cd d))
    (magit-show-commit (thing-at-point 'word))))
