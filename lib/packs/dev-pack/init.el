(config/load-config-file "cscope-conf.el")
(config/load-config-file "eshell-conf.el")
;; (config/load-config-file "etags-conf.el")

(eval-when-compile
  (require 'use-package))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (ac-flyspell-workaround)
  (add-to-list 'ac-dictionary-directories (concat (config/pack-lib-dir) "auto-complete/dict"))
  (setq ac-comphist-file (concat config/tmp-dir "ac-comphist.dat"))

  (global-auto-complete-mode t)
  (setq ac-auto-show-menu t)
  (setq ac-dwim t)
  (setq ac-use-menu-map t)
  (setq ac-quick-help-delay 1)
  (setq ac-quick-help-height 60)
  (setq ac-disable-inline t)
  (setq ac-show-menu-immediately-on-auto-complete t)
  (setq ac-auto-start 2)
  (setq ac-candidate-menu-min 0)

  (set-default 'ac-sources
	       '(ac-source-dictionary
		 ac-source-words-in-buffer
		 ac-source-words-in-same-mode-buffers
		 ac-source-yasnippet))

  (dolist (mode '(text-mode sh-mode lisp-mode))
    (add-to-list 'ac-modes mode))

  ;; Key triggers
  (define-key ac-completing-map (kbd "TAB") 'ac-complete)
  (define-key ac-completing-map (kbd "M-RET") 'ac-help))

(use-package cmake-mode
  :ensure t
  :mode "\\.cmake$\|CMakeLists.txt$")

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'helm))

(use-package magit
  :ensure t
  :defer t
  :config
  (add-hook 'magit-log-edit-mode-hook
	    (lambda ()
	      (set-fill-column 72)
	      (auto-fill-mode 1))))

(use-package rainbow-delimiters
  :ensure t
  :config
  (dolist (x '(emacs-lisp lisp))
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode)))

(use-package xcscope
  :ensure t
  :defer t
  :config
  (custom-set-variables
   '(cscope-do-not-update-database t)))

(use-package helm-cscope
  :ensure t
  :defer t
  :config
  (add-hook 'helm-cscope-mode-hook
	    (lambda ()
	      (local-set-key (kbd "C-c s d") 'helm-cscope-find-global-definition)
	      (local-set-key (kbd "C-c s f") 'helm-cscope-find-this-file)
	      (local-set-key (kbd "C-c s s") 'helm-cscope-find-this-symbol)
	      (local-set-key (kbd "C-c s u") 'helm-cscope-pop-mark))))

(use-package helm-cscope
  :ensure t
  :defer t)

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (list (concat config/etc-dir "snippets") 'yas-installed-snippets-dir))
  (yas-global-mode 1))
