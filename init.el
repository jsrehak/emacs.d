;;;;.emacs file
;;;Joshua Rehak, 5/2/2015

;; Startup
; Add custom lisp file location
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-packages)
(require 'init-themes)

;;Set default mode to text mode and turn on auto-fill
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;;; Custom keybindings
;; 'occur: shows all lines in the current buffer that contain a match
;; Set to C-c o
(global-set-key "\C-co" 'occur)
;; Unbind 'C-x f' because I always press that by accident instead of C-x C-f
(global-unset-key "\C-xf")
;; Rebind 'C-x C-b' to buffer-menu
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Don't show the startup screen
(setq inhibit-startup-screen t)

;;;;Package settings
;;Activate IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Enable flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

;;Smex items
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(global-set-key [remap execute-extended-command] 'smex)

;;Autocomplete
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;;;Hooks
;;Python mode hook
(add-hook 'python-mode-hook
	  '(lambda ()
	     (load "~/.emacs.d/python_mode.el")
	     ))

;;Latex  mode
(add-hook 'TeX-mode-hook ( lambda()
		   (load "~/.emacs.d/tex_mode.el")
			   ))



