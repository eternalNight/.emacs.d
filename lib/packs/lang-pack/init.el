(config/load-config-file "c-mode-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package alloy-mode
  :mode "\\.als$")

(use-package bison-mode
  :ensure t
  :mode "\\.y$")

(use-package clojure-mode
  :ensure t
  :mode "\\.cljs?$"
  :config
  (add-hook 'clojure-mode-hook
	    '(lambda ()
	       (define-key clojure-mode-map
		 (kbd "C-j") 'cider-eval-last-sexp)))
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

(use-package cider
  :ensure t
  :defer t)

(use-package cocci-mode
  :mode "\\.cocci$")

(use-package coffee-mode
  :ensure t
  :mode "\\.coffee$")

(use-package flex-mode
  :mode "\\.l$")

(use-package gnuplot-mode
  :ensure t
  :mode "\\.gp$")

(use-package lilypond-mode
  :mode ("\\.i?ly$" . LilyPond-mode)
  :config
  (add-hook 'LilyPond-mode-hook
	    (lambda ()
	      (turn-on-font-lock))))

(use-package go-mode
  :ensure t
  :mode "\\.go$")

(use-package k-mode
  :mode "\\.k$")

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

(use-package php-mode
  :ensure t
  :mode "\\.php$")

(use-package pkgbuild-mode
  :ensure t
  :mode "PKGBUILD$")

(use-package ess
  :ensure t
  :config
  (require 'ess-site))

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
