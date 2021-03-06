(custom-set-variables
 '(ibuffer-show-empty-filter-groups nil)
)

;; Replace ibuffer w/ original list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Load "default" group by default
(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "default")))

(eval-after-load "ibuf-ext"
  '(define-ibuffer-filter filename
       "Toggle current view to buffers with file or directory name matching QUALIFIER."
     (:description "filename"
		   :reader (read-from-minibuffer "Filter by file/directory name (regexp): "))
     (ibuffer-awhen (or (buffer-local-value 'buffer-file-name buf)
			(buffer-local-value 'dired-directory buf))
		    (string-match qualifier it))))

(setq ibuffer-saved-filter-groups
      '(("dev-vn"
	 ("vNative Linux" (filename . "android-vn/linux"))
	 ("vNative Xen" (filename . "xen-vn")))
	("default"
	 ("dired" (mode . dired-mode))
	 ("elisp" (mode . emacs-lisp-mode))
	 ("org notes" (mode . org-mode))
	 ("rst notes" (mode . rst-mode))
	 ("shell" (mode . eshell-mode))
	 ("shell scripts" (filename . "\.sh$"))
	 ("python scripts" (filename . "\.py$"))
	 ("images" (filename . "\.png$"))
	 ("C/C++ headers" (or
			   (filename . "\.h$")
			   (filename . "\.hh$")
			   (filename . "\.hpp$")))
	 ("C/C++ sources" (or
			   (filename . "\.c$")
			   (filename . "\.cc$")
			   (filename . "\.cpp$")))
	 ("Rust sources" (filename . "\.rs$"))
	 ("LaTeX sources" (filename . "\.tex$"))
	 ("Gnus" (or
		  (mode . message-mode)
		  (mode . bbdb-mode)
		  (mode . mail-mode)
		  (mode . gnus-group-mode)
		  (mode . gnus-summary-mode)
		  (mode . gnus-article-mode)
		  (mode . gnus-server-mode)
		  (mode . gnus-browse-mode)
		  (filename . "^\.bbdb$")
		  (filename . "\.newsrc-dribble"))))))
