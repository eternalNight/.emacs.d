(config/add-pack-lib "eproject")

(require 'eproject)
(require 'eproject-extras)

(define-project-type c-generic (generic)
  (look-for "Makefile")
  :relevant-files ("*.c" "*.cc" "*.cpp" "*.h" "*.hh" "*.hpp" "*.S" "*.s"))
(provide 'eproject-c-generic)
