(config/load-config-file "cosmetic.el")
(config/load-config-file "calendar-conf.el")
(config/load-config-file "time-conf.el")

(use-package cyberpunk-theme
  :ensure t
  :config
  (custom-set-variables '(frame-background-mode 'dark)))

(config/add-pack-lib "live-fontify-hex")
(use-package live-fontify-hex
  :config
  (font-lock-add-keywords 'lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'emacs-lisp-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'lisp-interaction-mode '((live-fontify-hex-colors)))
  (font-lock-add-keywords 'css-mode '((live-fontify-hex-colors))))
