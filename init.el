;;;;.emacs file
;;;Joshua Rehak, 5/2/2015

;; Startup
; Add custom lisp file location
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-packages)
(require 'init-themes)
;(require 'init-auto-complete)

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
;; Add bindings for default text size
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
;; Set return to newline and indent
(global-set-key (kbd "RET") 'newline-and-indent)
;; Change zap-to-char to zap-up-to-char
(autoload 'zap-up-to-char "misc" 'interactive)
(global-set-key "\M-z" 'zap-up-to-char)
;; Bind a key to hippie-expand
(global-set-key "\M-/" 'hippie-expand)
;; Bind a key chord for iy-go-to-char
;(global-set-key "\M-m" 'iy-go-to-char)
(key-chord-mode)
(key-chord-define-global "fg" 'iy-go-to-char)
(key-chord-define-global "df" 'iy-go-to-char-backward)


;; Function to move to the end of the line and make a new line and indent
(defun newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "S-<return>") 'newline-at-end-of-line)

;;;; Basic preferences
;; Don't show the startup screen
(setq inhibit-startup-screen t)
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 column-number-mode t
 delete-selection-mode t
 make-backup-files nil
 scroll-preserve-screen-position t
 show-trailing-whitespace t)
;; Set preference for identical filenames
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")
;; Return to last place when opening a file
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

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
(ac-config-default)

;;;;Hooks
;;Programming mode hook
(add-hook 'prog-mode-hook
          '(lambda ()
             (load "prog_mode.el")
             ))

;;Python mode hook
(add-hook 'python-mode-hook
	  '(lambda ()
	     (load "python_mode.el")
	     ))


;;Latex  mode
(add-hook 'TeX-mode-hook ( lambda()
		   (load "tex_mode.el")
			   ))



