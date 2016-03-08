(when (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/msys64/opt/aspell/bin")
  (setq ispell-program-name "aspell"))
