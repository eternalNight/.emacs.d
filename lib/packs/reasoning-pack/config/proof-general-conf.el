(config/add-pack-lib "proofgeneral")

(config/load-file (concat (config/pack-lib-dir) "proofgeneral/generic/proof-site.el"))
(add-to-list 'proof-universal-keys '([(control j)] . proof-assert-next-command-interactive))

(setq proof-splash-enable nil)
