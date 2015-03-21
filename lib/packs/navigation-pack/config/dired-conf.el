(global-set-key (kbd "<f2>") 'dired)

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    (custom-set-variables
	     '(dired-omit-files "^\\...+$")
	     '(dired-omit-mode t))))
