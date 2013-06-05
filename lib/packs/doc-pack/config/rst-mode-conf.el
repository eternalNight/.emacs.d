(if (eq system-type 'windows-nt)
    (setq rst-compile-toolsets
	  '((html . ("python \"D:\\Program Files\\docutils\\tools\\rst2html.py\"" ".html" nil))
	    (odt . ("python \"D:\\Program Files\\docutils\\tools\\rst2odt.py\"" ".odt" nil))
	    )
	  rst-compile-secondary-toolset 'odt)
  nil)
