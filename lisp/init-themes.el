
(require-package 'zenburn-theme)
(require-package 'solarized-theme)
(require-package 'color-theme-sanityinc-tomorrow)

;(load-theme 'solarized-dark t)
;(load-theme 'zenburn t)
(load-theme 'sanityinc-tomorrow-bright t)
;(load-theme 'sanityinc-tomorrow-night t)

;; set transparency 
;(set-frame-parameter (selected-frame) 'alpha '(85 85))
;(add-to-list 'default-frame-alist '(alpha 85 85));; set transparency

;; Powerline
(setq sml/theme 'powerline)
(add-hook 'after-init-hook 'sml/setup)

;; Custom line num disabled
(defcustom linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode doc-view-mode)
  "* List of modes disabled when global linum mode is on"
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum
  )

(provide 'init-themes)
