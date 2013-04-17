(setq config/yasnippet-dir (concat config/etc-dir "snippets"))

(config/add-pack-lib "yasnippet")
(require 'yasnippet)

(custom-set-variables
 '(yas-snippet-dirs `(,config/yasnippet-dir)))

(yas-global-mode 1)
