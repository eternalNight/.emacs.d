(autoload 'cocci-mode "cocci" "Mode for Coccinelle semantic patches" t)
(add-to-list 'auto-mode-alist '("\\.cocci$" . cocci-mode))
