(autoload 'llvm-mode "llvm-mode" "Mode for LLVM assembly" t)
(add-to-list 'auto-mode-alist '("\\.ll$" . llvm-mode))
