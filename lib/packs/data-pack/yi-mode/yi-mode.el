(setq yi-data-directory (file-name-as-directory (concat current-pack-dir "yi-mode/data")))

(defun yi-quit-symbol ()
  (interactive)
  (let ((i 0))
	(while (< i 3)
	  (kill-buffer)
	  (other-window 1)
	  (setq i (1+ i))
	  ))
  (delete-other-windows))

(defun yi-open-symbol ()
  (interactive)
  (let ((series (number-to-string (following-char))))
	(split-window-vertically)
	(split-window-horizontally)
	(find-file (concat yi-data-directory "o" series))
	(other-window 1)
	(find-file (concat yi-data-directory "e" series))
	(other-window 1)
	(find-file (concat yi-data-directory "s" series ".org")))
  (let ((tmpmap (current-local-map)))
	(if (null tmpmap)
		(setq tmpmap (make-sparse-keymap))
	  )
	(define-key tmpmap (kbd "C-q") 'yi-quit-symbol)
	(use-local-map tmpmap)
	))

(defun yi-view-symbol ()
  (interactive)
  (let ((series (number-to-string (following-char))))
	(split-window-vertically)
	(split-window-horizontally)
	(find-file (concat yi-data-directory "o" series))
	(setq buffer-read-only t)
	(other-window 1)
	(find-file (concat yi-data-directory "e" series))
	(setq buffer-read-only t)
	(other-window 1)
	(find-file (concat yi-data-directory "s" series ".org"))
	(setq buffer-read-only t))
  (let ((tmpmap (current-local-map)))
	(if (null tmpmap)
		(setq tmpmap (make-sparse-keymap))
	  )
	(define-key tmpmap (kbd "q") 'yi-quit-symbol)
	(use-local-map tmpmap)
	))

(defun yi-common-next-symbol (x)
  (let ((char-per-line (* x 2)))
    (if (< (% (point) char-per-line) (- char-per-line 2))
	  (forward-char 2)
	(backward-char (- char-per-line 2)))))

(defun yi-common-prev-symbol (x)
  (let ((char-per-line (* x 2)))
    (if (> (% (point) char-per-line) 1)
	(backward-char 2)
      (forward-char (- char-per-line 2)))))

(defun yi-common-next-line (x)
  (let ((char-per-line (* x 2)))
    (if (< (point) (* char-per-line (- x 1)))
	(forward-char char-per-line)
      (backward-char (* char-per-line (- x 1))))))

(defun yi-common-prev-line (x)
  (let ((char-per-line (* x 2)))
    (if (> (point) char-per-line)
	(backward-char char-per-line)
      (forward-char (* char-per-line (- x 1))))))

(defun yi-common-end-of-line ()
  (interactive)
  (move-end-of-line nil)
  (backward-char 1))

(defun yi-mode-setup (index-string buffer-name mode-symbol m-name
                      p-symbol n-symbol p-line n-line)
  (pop-to-buffer buffer-name nil)
  (delete-other-windows)

  (insert index-string)
  (let ()
    (make-face 'index-face)
    (set-face-attribute 'index-face nil :height 3.0)
    (buffer-face-set 'index-face))

  (let ()
    (make-face 'click-face)
    (set-face-attribute 'click-face nil :foreground "red")
    (put-text-property 1 2 'mouse-face 'click-face)
    (put-text-property 1 2 'help-echo "hello"))

  (let ((index-map (make-sparse-keymap)))
    (define-key index-map "v" 'yi-view-symbol)
    (define-key index-map (kbd "RET") 'yi-open-symbol)
    (define-key index-map "e" 'yi-open-symbol)
    (define-key index-map "f" n-symbol)
    (define-key index-map (kbd "C-f") n-symbol)
    (define-key index-map (kbd "<right>") n-symbol)
    (define-key index-map "b" p-symbol)
    (define-key index-map (kbd "C-b") p-symbol)
    (define-key index-map (kbd "<left>") p-symbol)
    (define-key index-map "n" n-line)
    (define-key index-map (kbd "C-n") n-line)
    (define-key index-map (kbd "<down>") n-line)
    (define-key index-map "p" p-line)
    (define-key index-map (kbd "C-p") p-line)
    (define-key index-map (kbd "<up>") p-line)
    (define-key index-map (kbd "C-e") 'yi-common-end-of-line)
    (use-local-map index-map))

  (goto-char (point-min))
  (setq major-mode mode-symbol
		mode-name m-name
		buffer-read-only t))

(defun yi-next-symbol ()
  (interactive)
  (yi-common-next-symbol 8))

(defun yi-prev-symbol ()
  (interactive)
  (yi-common-prev-symbol 8))

(defun yi-next-line ()
  (interactive)
  (yi-common-next-line 8))

(defun yi-prev-line ()
  (interactive)
  (yi-common-prev-line 8))

(defun yi-mode ()
  (interactive)
  (yi-mode-setup
   (concat "䷀ ䷁ ䷂ ䷃ ䷄ ䷅ ䷆ ䷇\n"
	   "䷈ ䷉ ䷊ ䷋ ䷌ ䷍ ䷎ ䷏\n"
	   "䷐ ䷑ ䷒ ䷓ ䷔ ䷕ ䷖ ䷗\n"
	   "䷘ ䷙ ䷚ ䷛ ䷜ ䷝ ䷞ ䷟\n"
	   "䷠ ䷡ ䷢ ䷣ ䷤ ䷥ ䷦ ䷧\n"
	   "䷨ ䷩ ䷪ ䷫ ䷬ ䷭ ䷮ ䷯\n"
	   "䷰ ䷱ ䷲ ䷳ ䷴ ䷵ ䷶ ䷷\n"
	   "䷸ ䷹ ䷺ ䷻ ䷼ ䷽ ䷾ ䷿")
   "*Yi*"
   'yi-mode
   "Yi"
   'yi-prev-symbol 'yi-next-symbol 'yi-prev-line 'yi-next-line))

(defun xuan-next-symbol ()
  (interactive)
  (yi-common-next-symbol 9))

(defun xuan-prev-symbol ()
  (interactive)
  (yi-common-prev-symbol 9))

(defun xuan-next-line ()
  (interactive)
  (yi-common-next-line 9))

(defun xuan-prev-line ()
  (interactive)
  (yi-common-prev-line 9))

(defun xuan-mode ()
  (interactive)
  (yi-mode-setup
   (concat "𝌆 𝌇 𝌈 𝌉 𝌊 𝌋 𝌌 𝌍 𝌎\n"
	   "𝌏 𝌐 𝌑 𝌒 𝌓 𝌔 𝌕 𝌖 𝌗\n"
	   "𝌘 𝌙 𝌚 𝌛 𝌜 𝌝 𝌞 𝌟 𝌠\n"
	   "𝌡 𝌢 𝌣 𝌤 𝌥 𝌦 𝌧 𝌨 𝌩\n"
	   "𝌪 𝌫 𝌬 𝌭 𝌮 𝌯 𝌰 𝌱 𝌲\n"
	   "𝌳 𝌴 𝌵 𝌶 𝌷 𝌸 𝌹 𝌺 𝌻\n"
	   "𝌼 𝌽 𝌾 𝌿 𝍀 𝍁 𝍂 𝍃 𝍄\n"
	   "𝍅 𝍆 𝍇 𝍈 𝍉 𝍊 𝍋 𝍌 𝍍\n"
	   "𝍎 𝍏 𝍐 𝍑 𝍒 𝍓 𝍔 𝍕 𝍖")
   "*Xuan*"
   'xuan-mode
   "Xuan"
   'xuan-prev-symbol 'xuan-next-symbol 'xuan-prev-line 'xuan-next-line))
