(use-package eproject
	     :ensure t
	     :config
	     (require 'eproject)
	     (require 'eproject-extras)
	     (define-project-type c-generic (generic)
	       (look-for ".eproject-c")
	       :relevant-files ("*.c" "*.cc" "*.cpp" "*.h" "*.hh" "*.hpp" "*.S" "*.s")
	       :config-file ".eproject-c")
	     (define-project-type tex-generic (generic)
	       (look-for ".eproject-tex")
	       :relevant-files ("*.tex")
	       :config-file ".eproject-tex")
	     (provide 'eproject-c-generic)
	     (provide 'eproject-tex-generic))
