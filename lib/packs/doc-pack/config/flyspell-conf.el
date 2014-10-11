(require 'flyspell)

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
