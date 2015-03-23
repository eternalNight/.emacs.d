(config/load-config-file "ispell-conf.el")
(config/load-config-file "org-conf.el")
(config/load-config-file "rst-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package flyspell
  :commands (flyspell-mode)
  :defer t)

(use-package tex-site
  :ensure auctex
  :config
  (add-hook 'LaTeX-mode-hook
	    (lambda ()
	      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	      (setq TeX-command-default "XeLaTeX")
	      (flyspell-mode))))

(use-package auto-complete-auctex
  :ensure t)
