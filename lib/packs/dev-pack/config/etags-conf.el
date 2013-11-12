(defun etags-build (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "ctags -e -R %s" (directory-file-name dir-name))))

(global-set-key (kbd "C-.") 'pop-tag-mark)
