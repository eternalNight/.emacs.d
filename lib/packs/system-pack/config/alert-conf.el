(use-package alert
  :defer t
  :config
  (when (eq system-type 'windows-nt)
    (setq alert-default-style 'notifu)))
