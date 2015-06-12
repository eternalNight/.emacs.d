(config/add-pack-lib "proofgeneral")

(config/load-file (concat (config/pack-lib-dir) "proofgeneral/generic/proof-site.el"))
(add-to-list 'proof-universal-keys '([(control j)] . proof-assert-next-command-interactive))

(setq proof-splash-enable nil)
(setq proof-script-fly-past-comments t)
(setq proof-three-window-mode-policy 'hybrid)

(defvar pretty-alist
  '(
    ("forall" . ?∀)
    ("exists" . ?∃)
    ("\\/" . ?∨)
    ("/\\" . ?∧)
    ("<>" . ?≠)
    ("<<" . ?∘)
    ("<<<" . ?¤)))

(defun coq-pretty-things ()
  (dolist (x pretty-alist ) (push x prettify-symbols-alist))
  (prettify-symbols-mode)
  (outline-minor-mode))

(add-hook 'coq-mode-hook 'coq-pretty-things)
(add-hook 'coq-response-mode-hook 'coq-pretty-things)
(add-hook 'coq-goals-mode-hook 'coq-pretty-things)
