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

;; Default packs
(let ((pack-names '("system-pack"
		    "display-pack"
		    "navigation-pack"
		    "dev-pack"
		    "doc-pack"
		    "game-pack"
		    "lang-pack"
		    "reasoning-pack"
		    "data-pack")))
  (setq config/packs (mapcar (lambda (p) (concat config/packs-dir p)) pack-names)))

;; Initialize package archives
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  ;; Load core helpers
  (let ((core-el  (concat config/lib-dir "core.el"))
	(core-elc (concat config/lib-dir "core.elc")))
    (if (file-newer-than-file-p core-el core-elc)
	(byte-compile-file core-el))
    (load-file (concat config/lib-dir "core.elc")))

  ;; Make sure use-package is available
  (if (not (package-installed-p 'use-package))
      (package-install 'use-package))

  (let ((profile-init (package-installed-p 'benchmark-init)))
    (if profile-init (benchmark-init/activate))

    ;; Configure automatic custom configurations
    (setq custom-file (concat config/etc-dir "custom-configuration.el"))
    (when (file-exists-p custom-file)
      (config/load-file-compile custom-file))

    ;; Load packs
    (mapcar (lambda (pack-dir)
	      (config/load-pack (file-name-as-directory pack-dir)))
	    config/packs)

    ;; stop profiling
    (if profile-init (benchmark-init/deactivate))

    ;; Toggle full screen after loading all init scripts to avoid the toggle
    ;; from being overridden
    (toggle-frame-fullscreen)))
