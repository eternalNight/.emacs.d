(require 'quack)

(custom-set-variables
 '(quack-default-program "csi -:c"))

(defun scheme-hook()
  (define-key scheme-mode-map
    (kbd "C-j") 'scheme-send-definition)          ;; Evaluate the expr under cursor
  )
(add-hook 'scheme-mode-hook 'scheme-hook)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
