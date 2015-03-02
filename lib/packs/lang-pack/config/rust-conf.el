(config/add-pack-lib "rust-mode")

(autoload 'rust-mode "rust-mode" "Rust editing mode." t)
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))
