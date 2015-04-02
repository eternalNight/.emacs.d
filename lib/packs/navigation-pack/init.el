(config/load-config-file "dired-conf.el")
;; (config/load-config-file "ibuffer-conf.el")
(config/load-config-file "image-conf.el")

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))

(use-package ace-window
  :ensure t
  :disabled t
  :bind ("C-x o" . ace-window))

(use-package ztree
  :ensure t
  :defer t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)
	 ("C-x C-b" . helm-buffers-list))
  :config
  (require 'helm-config))

(use-package gnus
  :defer t
  :config
  (setq gnus-select-method
	'(nnimap "outlook"
		 (nnimap-address "imap-mail.outlook.com")
		 (nnimap-server-port 993)
		 (nnimap-stream ssl)
		 (nnimap-fetch-partial-articles "text/")))
  (add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-starttls-credentials '(("smtp-mail.outlook.com" 587 nil nil))
	smtpmail-auth-credentials '(("smtp-mail.outlook.com" 587
				     "junjie.mao@hotmail.com" nil))
	smtpmail-default-smtp-server "smtp-mail.outlook.com"
	smtpmail-smtp-server "smtp-mail.outlook.com"
	smtpmail-smtp-service 587
	gnus-cache-directory (concat config/tmp-dir "Gnus/Mails/cache")
	mm-default-directory (concat config/tmp-dir "Gnus/MIME")
	gnus-read-active-file 'some
	gnus-use-cache t
	gnus-inhibit-startup-message t
	gnus-novice-user nil
	gnus-expert-user t
	nnmail-expiry-wait 7
	gnus-fetch-old-headers 'passive)
  (gnus-agentize)
  (gnus-demon-add-handler 'gnus-demon-scan-news 5 t))

(use-package gnus-desktop-notify
  :ensure t
  :defer t
  :config
  (gnus-desktop-notify-mode))

(use-package idomenu
  :ensure t
  :disabled t
  :config
  (custom-set-variables
   '(ido-enable-prefix nil)
   '(ido-enable-flex-matching t)
   '(ido-create-new-buffer 'always)
   '(ido-max-prospects 10)
   '(ido-default-file-method 'selected-window)
   '(ido-mode t))
  (icomplete-mode 1))
