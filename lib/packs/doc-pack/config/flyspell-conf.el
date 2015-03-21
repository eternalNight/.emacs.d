(use-package flyspell
  :commands (flyspell-mode)
  :defer t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
