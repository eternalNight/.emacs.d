(config/add-pack-lib "nrepl")
(autoload 'nrepl-jack-in "nrepl" "Start a nREPL server" t)

(use-package clojure-mode
	     :ensure t
	     :mode "\\.cljs?$"
	     :config
	     (add-hook 'clojure-mode-hook
		       '(lambda ()
			  (define-key clojure-mode-map
			    (kbd "C-j") 'nrepl-eval-last-expression)))
	     (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
	     )
