(custom-set-variables
 '(inhibit-startup-screen t)                             ;; Disable startup screen
 '(backup-directory-alist `(("." . ,config/backups-dir))) ;; Save all backup files at config/backups-dir
 '(delete-old-versions t)                                ;; Delete excess backup files silently
 '(system-time-locale "C")                               ;; Always use English abbrev. for timestamps
 '(default-buffer-file-coding-system 'utf-8)             ;; Use UTF-8 encoding by default
 )

;; Set default directory
(setq default-directory "~/")
(setq auto-save-list-file-name (concat config/autosaves-dir "autosave-list"))
