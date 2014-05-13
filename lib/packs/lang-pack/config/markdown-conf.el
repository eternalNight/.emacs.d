(config/add-pack-lib "markdown-mode")
(autoload 'markdown-mode "markdown-mode" "Mode for Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
