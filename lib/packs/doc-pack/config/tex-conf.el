(require 'auto-complete-auctex)

(use-package tex-site
  :ensure auctex
  :config
  (add-hook 'tex-generic-project-file-visit-hook
	    (lambda ()
	      (when (eproject-attribute :master)
		(let ((master (eproject-attribute :master)))
		  (setq TeX-master master)))))
  (add-hook 'LaTeX-mode-hook
	    (lambda ()
	      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	      (setq TeX-command-default "XeLaTeX"))))
