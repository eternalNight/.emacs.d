(config/add-pack-lib "git-modes")
(config/add-pack-lib "magit")
(autoload 'magit-status "magit" "Open magit status buffer" t)
(autoload 'magit-log "magit" "Open magit log buffer" t)

(custom-set-variables
 '(magit-commit-signoff t))

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
             (set-fill-column 72)
             (auto-fill-mode 1)))
