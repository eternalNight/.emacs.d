;; make sure ansi colour character escapes are honoured
(require 'ansi-color)
(ansi-color-for-comint-mode-on)

;; remove bells
(setq ring-bell-function 'ignore)


(custom-set-variables
 '(scroll-bar-mode nil)                            ;; remove scroll bar
 '(tool-bar-mode nil)                              ;; disable tool bar
 '(menu-bar-mode nil)                              ;; disable menu bar
 '(global-linum-mode t)                            ;; enable global line number side panel
 '(line-number-mode t)                             ;; display line number on the bottom bar
 '(column-number-mode t)                           ;; display column number on the bottom bar
 '(show-paren-mode t)                              ;; always show matching parenthesis
 '(default-buffer-file-coding-system 'utf-8)       ;; use UTF-8 encoding by default
 )

(custom-set-faces
 '(default ((t (:height 143 :family "DejaVu Sans Mono")))))

