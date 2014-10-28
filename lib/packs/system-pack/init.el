(custom-set-variables
 '(inhibit-startup-screen t)                             ;; Disable startup screen
 '(backup-directory-alist `(("." . ,config/backups-dir))) ;; Save all backup files at config/backups-dir
 '(delete-old-versions t)                                ;; Delete excess backup files silently
 '(system-time-locale "C")                               ;; Always use English abbrev. for timestamps
 '(default-buffer-file-coding-system 'utf-8)             ;; Use UTF-8 encoding by default
 '(fill-column 80)                                       ;; Column width
 )

;; Set default directory
(setq default-directory "~/")
(setq auto-save-list-file-name (concat config/autosaves-dir "autosave-list"))

;; Remove trailing whitespaces on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Move the mouse when the cursor gets close to it
(mouse-avoidance-mode 'cat-and-mouse)

(config/load-config-file "alert-conf.el")
(config/load-config-file "bbdb-conf.el")
