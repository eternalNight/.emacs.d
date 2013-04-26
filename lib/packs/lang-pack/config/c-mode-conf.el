(config/load-config-file "c-mode-os-conf.el")

(require 'auto-complete-clang)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
	      (split-string system-header-paths)))
(make-variable-buffer-local 'ac-clang-flags)

(add-hook 'c-generic-project-file-visit-hook
	  (lambda ()
	    (setq ac-clang-flags
		  (let* ((project-no-stdlib (eproject-attribute :no-stdlib))
			 (system-include-dirs (if project-no-stdlib "" (split-string system-header-paths)))
			 (project-include-dirs (split-string (eproject-attribute :include-dir))))
		    (append
		     (mapcar (lambda (item) (concat "-I" item)) system-include-dirs)
		     (mapcar (lambda (item) (concat "-I" (eproject-root) item)) project-include-dirs))))))

(defun c-mode-setup ()
  (c-set-style "k&r")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)                               ;; Delete continuous spaces by backspace
  (setq c-basic-offset 8)                               ;; A tab is 8-character wide
  (which-function-mode)
  (eproject-maybe-turn-on)
  (setq ac-sources (append '(ac-source-clang) ac-sources)))

(add-hook 'c-mode-hook 'c-mode-setup)
(add-hook 'c++-mode-hook 'c-mode-setup)

(add-to-list 'ac-modes 'c-mode)
