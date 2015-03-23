(config/load-config-file "c-mode-os-conf.el")

(defun c-mode-setup ()
  (c-set-style "k&r")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)                               ;; Delete continuous spaces by backspace
  (setq indent-tabs-mode t)                             ;; Use tabs instead of spaces for indention
  (setq tab-width 8)
  (setq c-basic-offset tab-width)                       ;; A tab is 8-character wide by default
  (which-function-mode))

(add-hook 'c-mode-hook 'c-mode-setup)
(add-hook 'c++-mode-hook 'c-mode-setup)

(add-to-list 'ac-modes 'c-mode)
