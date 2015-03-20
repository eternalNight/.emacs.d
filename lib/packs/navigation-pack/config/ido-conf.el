(use-package idomenu
  :ensure t
  :config
  (custom-set-variables
   '(ido-enable-prefix nil)
   '(ido-enable-flex-matching t)
   '(ido-create-new-buffer 'always)
   '(ido-max-prospects 10)
   '(ido-default-file-method 'selected-window)
   '(ido-mode t)                                     ;; Enable ido mode
   )
  (icomplete-mode 1))
