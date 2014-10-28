(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-inbox "INBOX")
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)
	       (nnimap-fetch-partial-articles "text/")))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587
				   "eternal.n08@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      tls-program '("D:/Git/bin/openssl.exe s_client -connect %h:%p -no_ssl2 -ign_eof"))

(setq gnus-cache-directory (concat config/tmp-dir "Gnus/Mails/cache"))
(setq gnus-read-active-file 'some)

(gnus-agentize)
(setq gnus-use-cache t)
(setq gnus-inhibit-startup-message t)
(setq gnus-novice-user nil)
(setq gnus-expert-user t)
(setq nnmail-expiry-wait 7)
(setq gnus-fetch-old-headers 'passive)
