;; Various toplevel directories in the config system
;; The root directory is fixed to ~/.emacs.d at present
(setq
 config/root-dir     (file-name-as-directory "~/.emacs.d")
 config/etc-dir      (file-name-as-directory (concat config/root-dir "etc"))
 config/lib-dir      (file-name-as-directory (concat config/root-dir "lib"))
 config/tmp-dir      (file-name-as-directory (concat config/root-dir "tmp"))
 config/backups-dir  (file-name-as-directory (concat config/tmp-dir  "backups"))
 config/autosaves-dir(file-name-as-directory (concat config/tmp-dir  "autosaves"))
 config/packs-dir    (file-name-as-directory (concat config/lib-dir  "packs")))

;; Load lib
(load-file (concat config/lib-dir "core.el"))

;; Default packs
(let ((pack-names '("system-pack"
		    "display-pack"
		    "navigation-pack"
		    "dev-pack"
		    "doc-pack"
		    "lang-pack"
		    "reasoning-pack")))
  (setq config/packs (mapcar (lambda (p) (concat config/packs-dir p)) pack-names)))

;; Load packs
(mapcar (lambda (pack-dir)
          (config/load-pack (file-name-as-directory pack-dir)))
        config/packs)

;; Configure automatic custom configurations
(setq custom-file (concat config/etc-dir "custom-configuration.el"))
(when (file-exists-p custom-file)
  (load custom-file))
