(defun config/pack-config-dir ()
  "Returns the path of the config dir for the current pack"
  (file-name-as-directory (concat current-pack-dir "config")))

(defun config/pack-lib-dir ()
  "Returns the path of the lib dir for the current pack"
  (file-name-as-directory (concat current-pack-dir "lib")))

(defun config/load-config-file (f-name)
  "Load the config file with name f-name in the current pack"
  (let ((config-dir (config/pack-config-dir)))
    (load-file (concat config-dir f-name))))

(defun config/add-pack-lib (p)
  "Adds the path (specified relative to the the pack's lib dir)
  to the load-path"
  (add-to-list 'load-path (concat (config/pack-lib-dir) p)))

(defun config/load-pack (pack-dir)
  "Load a live pack. This is a dir that contains at least the
  file init.el. Adds the packs's lib dir to the load-path"
  (let* ((pack-info (concat pack-dir "info.el"))
         (pack-init (concat pack-dir "init.el")))
    (setq current-pack-dir pack-dir)
    (message (concat "Load pack from dir: " pack-dir))
    (if (file-exists-p (config/pack-lib-dir))
	(add-to-list 'load-path (config/pack-lib-dir)))
    (if (file-exists-p pack-init)
        (load-file pack-init))
    (setq live-current-pack-dir nil)))
