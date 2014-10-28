(config/add-pack-lib "alert")

(require 'alert)

(when (eq system-type 'windows-nt)
  (setq alert-default-style 'notifu))
