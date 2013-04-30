(config/add-pack-lib "eproject")

(require 'eproject)
(require 'eproject-extras)

(define-project-type c-generic (generic)
  (look-for ".eproject-c")
  :relevant-files ("*.c" "*.cc" "*.cpp" "*.h" "*.hh" "*.hpp" "*.S" "*.s")
  :config-file ".eproject-c")
(provide 'eproject-c-generic)
