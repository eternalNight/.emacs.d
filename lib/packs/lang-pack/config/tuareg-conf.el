(config/add-pack-lib "tuareg")
(autoload 'tuareg-mode "tuareg" "A major mode for OCaml" t)

(defun tuareg-mode-setup()
  (define-key tuareg-mode-map
    (kbd "C-j") 'tuareg-eval-phrase)
  (define-key tuareg-mode-map
    (kbd "RET") 'tuareg-newline-and-indent))
  
(add-hook 'tuareg-mode-hook 'tuareg-mode-setup)
(add-to-list 'auto-mode-alist '("\\.ml[ily]?$" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.topml?$" . tuareg-mode))
