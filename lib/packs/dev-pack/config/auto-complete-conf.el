(config/add-pack-lib "fuzzy-el")
(config/add-pack-lib "popup-el")

(require 'popup)
(require 'fuzzy)

;; auto-complete mode

(config/add-pack-lib "auto-complete")
(config/add-pack-lib "auto-complete-clang")

(require 'auto-complete)
(require 'auto-complete-config)
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
               ac-source-semantic
               ac-source-yasnippet))

(dolist (mode '(org-mode text-mode sh-mode lisp-mode))
  (add-to-list 'ac-modes mode))

;; Key triggers
(define-key ac-completing-map (kbd "TAB") 'ac-complete)
(define-key ac-completing-map (kbd "M-RET") 'ac-help)

