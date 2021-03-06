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
(setq user-mail-address "junjie.mao@enight.me")

;; Remove trailing whitespaces on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Use a vertical bar instead of a box
(setq-default cursor-type 'bar)

;; Move the mouse when the cursor gets close to it
(mouse-avoidance-mode 'banish)

;; Enable disabled functions
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

;; Truncate long lines by default
;; (set-default 'truncate-lines t)

(setq abbrev-file-name (concat config/etc-dir "abbrev_defs"))

(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)

(eval-when-compile
  (require 'use-package))

(use-package alert
  :defer t
  :config
  (when (eq system-type 'windows-nt)
    (setq alert-default-style 'notifu)))

(use-package bbdb
	     :ensure t
	     :config
	     (bbdb-initialize 'gnus)
	     (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
	     (setq bbdb-file (concat config/etc-dir "bbdb")))

(use-package restart-emacs
  :ensure t)
