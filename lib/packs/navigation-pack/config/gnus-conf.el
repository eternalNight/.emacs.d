(require 'gnus-desktop-notify)

;; (setq gnus-select-method
;;       '(nnimap "gmail"
;; 	       (nnimap-inbox "INBOX")
;; 	       (nnimap-address "imap.gmail.com")
;; 	       (nnimap-server-port 993)
;; 	       (nnimap-stream ssl)
;; 	       (nnimap-fetch-partial-articles "text/")))

(setq gnus-select-method
      '(nnimap "yeah"
	       (nnimap-address "imap.yeah.net")
	       (nnimap-server-port 143)
	       (nnimap-stream network)
	       (nnimap-fetch-partial-articles "text/")))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.yeah.net" 25 nil nil))
      smtpmail-auth-credentials '(("smtp.yeah.net" 25
				   "junjie_mao@yeah.net" nil))
      smtpmail-default-smtp-server "smtp.yeah.net"
      smtpmail-smtp-server "smtp.yeah.net"
      smtpmail-smtp-service 25
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
(gnus-desktop-notify-mode)
(gnus-demon-add-handler 'gnus-demon-scan-news 5 t)
