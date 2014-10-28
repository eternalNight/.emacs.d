(config/add-pack-lib "bbdb")
(require 'bbdb)
(require 'bbdb-gnus)

(bbdb-initialize 'gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb-file (concat config/tmp-dir "bbdb"))
