(require 'dired-x)

(custom-set-variables
 '(dired-omit-files "^\\...+$")
 '(dired-omit-mode t))

(global-set-key (kbd "<f2>") 'dired)
