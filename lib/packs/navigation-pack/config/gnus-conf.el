(use-package gnus-desktop-notify
  :ensure t
  :defer t
  :config
  (gnus-desktop-notify-mode))

;; (setq gnus-select-method
;;       '(nnimap "gmail"
;; 	       (nnimap-inbox "INBOX")
;; 	       (nnimap-address "imap.gmail.com")
;; 	       (nnimap-server-port 993)
;; 	       (nnimap-stream ssl)
;; 	       (nnimap-fetch-partial-articles "text/")))

;; (setq gnus-select-method
;;       '(nnimap "yeah"
;; 	       (nnimap-address "imap.yeah.net")
;; 	       (nnimap-server-port 143)
;; 	       (nnimap-stream network)
;; 	       (nnimap-fetch-partial-articles "text/")))

(require 'gnus)

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
(gnus-demon-add-handler 'gnus-demon-scan-news 5 t)
