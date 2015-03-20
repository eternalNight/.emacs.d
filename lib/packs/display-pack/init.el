(config/load-config-file "cosmetic.el")
(config/load-config-file "calendar-conf.el")
(config/load-config-file "time-conf.el")

(use-package cyberpunk-theme
  :disabled t
  :ensure t
  :config
  (custom-set-variables '(frame-background-mode 'dark)))

(use-package solarized-theme
  :pin marmalade
  :ensure t
  :config
  (add-hook 'after-make-frame-functions
	    (lambda (frame)
	      (set-frame-parameter frame
				   'background-mode
				   (if (display-graphic-p frame) 'light 'dark))
	      (enable-theme 'solarized))))

(config/add-pack-lib "live-fontify-hex")
(use-package live-fontify-hex
  :config
  (font-lock-add-keywords 'lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'emacs-lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'lisp-interaction-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'css-mode '((live-fontify-hex-colors))))
