;; Mobileorg settings
(setq org-directory "~/tasks")
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile-inbox.org"))
(setq agenda-files '("ta.org" "research.org"))
(setq org-agenda-files (mapcar (lambda (f) (concat org-directory "/" f)) agenda-files))
(setq org-mobile-files (list org-directory))
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
