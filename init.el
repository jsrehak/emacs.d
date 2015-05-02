;;;.emacs file
;;;Joshua Rehak, 5/2/2015

;; Startup
; Add custom lisp file location
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-elpa)




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


					; don't show the startup screen
(setq inhibit-startup-screen t)

;;ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Python mode hook
(add-hook 'python-mode-hook
	  '(lambda ()
	     (load "~/.emacs.d/python_mode.el")
	     ))

;;Latex mode
(add-hook 'TeX-mode-hook ( lambda()
			   (load "~/.emacs.d/tex_mode.el")
			   ))


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(tool-bar-mode -1)
(load-theme 'zenburn t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

