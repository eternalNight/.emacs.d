(config/load-config-file "c-mode-os-conf.el")

(require 'auto-complete-clang)
(make-variable-buffer-local 'ac-clang-flags)

(add-hook 'c-generic-project-file-visit-hook
	  (lambda ()
	    (when (eproject-attribute :enable-ac)
	      (setq ac-clang-flags
		    (let* ((project-no-stdlib (eproject-attribute :no-stdlib))
			   (system-include-dirs (if project-no-stdlib "" (split-string system-header-paths)))
			   (include-dir (eproject-attribute :include-dir))
			   (project-include-dirs (if (eq include-dir nil) nil (split-string include-dir))))
		      (append
		       (mapcar (lambda (item) (concat "-I" item)) system-include-dirs)
		       (mapcar (lambda (item) (concat "-I" (eproject-root) item)) project-include-dirs))))
	      (setq ac-sources (append '(ac-source-clang) ac-sources)))
	    (when (eproject-attribute :basic-offset)
	      (let ((offset (eproject-attribute :basic-offset)))
		(setq c-basic-offset offset
		      tab-width offset)))))

(defun c-mode-setup ()
  (c-set-style "k&r")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)                               ;; Delete continuous spaces by backspace
  (setq indent-tabs-mode t)                             ;; Use tabs instead of spaces for indention
  (setq tab-width 8)
  (setq c-basic-offset tab-width)                       ;; A tab is 8-character wide by default
  (which-function-mode)
  (eproject-maybe-turn-on))

(add-hook 'c-mode-hook 'c-mode-setup)
(add-hook 'c++-mode-hook 'c-mode-setup)

(add-to-list 'ac-modes 'c-mode)
