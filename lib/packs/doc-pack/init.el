(config/load-config-file "ispell-conf.el")
(config/load-config-file "org-conf.el")
(config/load-config-file "rst-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package flyspell
  :commands (flyspell-mode)
  :defer t)

(use-package LaTeX-mode
  :ensure auctex
  :mode "\\.tex$"
  :init
  (defun my-latex-mode-hook ()
    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
    (setq TeX-command-default "XeLaTeX")
    (flyspell-mode))
  (add-hook 'LaTeX-mode-hook 'my-latex-mode-hook))

(use-package auto-complete-auctex
  :ensure t)
