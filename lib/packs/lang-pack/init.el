(config/load-config-file "c-mode-conf.el")
(config/load-config-file "xcscope-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package alloy-mode
  :mode "\\.als$")

(use-package clojure-mode
  :ensure t
  :mode "\\.cljs?$"
  :config
  (add-hook 'clojure-mode-hook
	    '(lambda ()
	       (define-key clojure-mode-map
		 (kbd "C-j") 'nrepl-eval-last-expression)))
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))
(config/add-pack-lib "nrepl")
(autoload 'nrepl-jack-in "nrepl" "Start a nREPL server" t)

(use-package cocci-mode
  :mode "\\.cocci$")

(use-package gnuplot-mode
  :ensure t
  :mode "\\.gp$")

(use-package llvm-mode
  :ensure t
  :mode "\\.ll$")

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :config
  (setq lua-indent-level 4))

(use-package markdown-mode
  :ensure t
  :mode "\\.md$")

(use-package rust-mode
  :ensure t
  :mode "\\.rs$")

(use-package tuareg
  :ensure t
  :mode "\\.ml[ily]$")

(use-package systemtap-mode
  :ensure t
  :mode "\\.stp$"
  :config
  (setq c-basic-offset 8))
