(custom-set-variables
 '(tls-program '("D:/msys64/usr/bin/openssl.exe s_client -connect %h:%p")))

(config/load-config-file "dired-conf.el")
(config/load-config-file "image-conf.el")
(config/load-config-file "sieve-conf.el")

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

(use-package helm-ag
  :ensure t
  :bind (("C-c a s" . helm-do-ag-project-root)
	 ("C-c a u" . helm-ag-pop-stack)))

(use-package helm-swoop
  :ensure t
  :bind (("C-s" . helm-swoop)))

(use-package gnus
  :defer t
  :config
  (setq gnus-select-method
	'(nnimap "mail.enight.me"
		 (nnimap-address "mail.enight.me")
		 (nnimap-server-port 993)
		 ;; (nnimap-fetch-partial-articles "text/")
		 (nnimap-stream ssl)))
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-starttls-credentials '(("mail.enight.me" 465 nil nil))
	smtpmail-auth-credentials '(("mail.enight.me" 465
				     "junjie.mao@enight.me" nil))
	smtpmail-default-smtp-server "mail.enight.me"
	smtpmail-smtp-server "mail.enight.me"
	smtpmail-stream-type 'ssl
	smtpmail-smtp-service 465
	gnus-cache-directory (concat config/tmp-dir "Gnus/Mails/cache")
	mm-default-directory (concat config/tmp-dir "Gnus/MIME")
	gnus-read-active-file 'some
	gnus-use-cache t
	gnus-inhibit-startup-message t
	gnus-novice-user nil
	gnus-expert-user t
	nnmail-expiry-wait 7
	gnus-fetch-old-headers 'passive
	gnus-posting-styles '((".*" (signature-file (concat config/etc-dir "/signature"))))
	gnus-message-archive-group nil
	gnus-parameters '((".*" (gcc-self . t)))
	)
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
