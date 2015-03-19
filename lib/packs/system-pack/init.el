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

;; Set personal information
(setq user-full-name "Junjie Mao")
(setq user-mail-address "junjie.mao@hotmail.com")

;; Remove trailing whitespaces on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Move the mouse when the cursor gets close to it
(mouse-avoidance-mode 'cat-and-mouse)

;; Enable disabled functions
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

;; Truncate long lines by default
(set-default 'truncate-lines t)

(config/load-config-file "use-package-conf.el")
(config/load-config-file "alert-conf.el")
(config/load-config-file "bbdb-conf.el")
