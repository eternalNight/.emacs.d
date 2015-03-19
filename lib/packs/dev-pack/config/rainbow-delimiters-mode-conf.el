(use-package rainbow-delimiters
	     :ensure t
	     :config
	     (dolist (x '(emacs-lisp lisp))
	       (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode)))
