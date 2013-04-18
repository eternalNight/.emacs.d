(config/add-pack-lib "clojure-mode")
(config/add-pack-lib "nrepl")
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(autoload 'nrepl-jack-in "nrepl" "Start a nREPL server" t)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (define-key clojure-mode-map
	       (kbd "C-j") 'nrepl-eval-last-expression)))
