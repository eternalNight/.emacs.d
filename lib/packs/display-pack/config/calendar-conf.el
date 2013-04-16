(setq calendar-intermonth-text
      '(propertize
	(let ((iso (calendar-iso-from-absolute (calendar-absolute-from-gregorian (list month day year)))))
	  (format "%2d" (+ (car iso) (if (= (cadr iso) 0) 1 0))))
	'font-lock-face 'font-lock-constant-face))
