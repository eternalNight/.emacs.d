(config/add-pack-lib "rainbow-delimiters")
(autoload 'rainbow-delimiters-mode "rainbow-delimiters" "Highlight nested parens, brackets, braces a different color at each depth." t)

(dolist (x '(emacs-lisp lisp))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))
