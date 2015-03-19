(use-package bbdb
	     :ensure t
	     :config
	     (bbdb-initialize 'gnus)
	     (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
	     (setq bbdb-file (concat config/tmp-dir "bbdb")))
