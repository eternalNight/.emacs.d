(config/load-config-file "c-mode-os-conf.el")

(require 'auto-complete-clang)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string system-header-paths)))
(defun cc-mode-setup ()
  (c-set-style "k&r")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)                               ;; Delete continuous spaces by backspace
  (setq c-basic-offset 8)                               ;; A tab is 8-character wide
  (which-function-mode)
  (setq ac-sources (append '(ac-source-clang) ac-sources)))
(add-hook 'c-mode-hook 'cc-mode-setup)
(add-hook 'c++-mode-hook 'cc-mode-setup)

(add-to-list 'ac-modes 'c-mode)
