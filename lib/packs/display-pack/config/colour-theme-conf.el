(config/add-pack-lib "color-theme")
(require 'color-theme)

;; Use blackbored colour theme
(load-file (concat (config/pack-lib-dir) "cyberpunk.el"))
(load-file (concat (config/pack-lib-dir) "gandalf.el"))

(color-theme-cyberpunk)
(set-cursor-color "yellow")
