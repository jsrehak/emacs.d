
(require-package 'zenburn-theme)
(require-package 'solarized-theme)
(require-package 'color-theme-sanityinc-tomorrow)

;(load-theme 'solarized-dark t)
;(load-theme 'zenburn t)
(load-theme 'sanityinc-tomorrow-night t)

;; set transparency 
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85));; set transparency

(provide 'init-themes)
