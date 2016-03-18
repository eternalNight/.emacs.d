(config/load-config-file "cosmetic.el")
(config/load-config-file "calendar-conf.el")
(config/load-config-file "time-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package cyberpunk-theme
  :ensure t
  :config
  (custom-set-variables '(frame-background-mode 'dark))
  (load-theme 'cyberpunk t))

(use-package color-theme-sanityinc-solarized
  :ensure t
  :disabled t
  :config
  (if (display-graphic-p)
      (progn
	(custom-set-variables '(frame-background-mode 'light))
	(color-theme-sanityinc-solarized-light))
    (progn
      (custom-set-variables '(frame-background-mode 'dark))
      (color-theme-sanityinc-solarized-dark))))

(config/add-pack-lib "live-fontify-hex")
(use-package live-fontify-hex
  :config
  (font-lock-add-keywords 'lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'emacs-lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'lisp-interaction-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'css-mode '((live-fontify-hex-colors))))
