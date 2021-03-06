;;;;.emacs file
;;;Joshua Rehak, 5/2/2015

;;; TABLE OF CONTENTS
;; #packages
;; #package_settings : Package Settings
;;

;;(package-initialize)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; ==============================================================================
;                   _
;                  | |
;  _ __   __ _  ___| | ____ _  __ _  ___  ___
; | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
; | |_) | (_| | (__|   < (_| | (_| |  __/\__ \
; | .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
; | |                          __/ |
; |_|                         |___/
;
; #packages
; ==============================================================================

(require 'package)

; Add package repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

; Custom function to download a package
(defun require-package (package &optional min-version no-refresh)
  "Installs given PACKAGE with optional MIN-VERSION, if NO-REFRESH is 
is non-nill, the available package lists will not be redownloaded to
locate PACKAGE. "
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))

(package-initialize)                                        

;;Install packages if they are not installed
(require-package 'auctex)
;;(require-package 'auto-complete)
(require-package 'cmake-font-lock)
(require-package 'cmake-mode)
(require-package 'color-theme)
(require-package 'company)
(require-package 'company-irony)
(require-package 'dash)
(require-package 'default-text-scale)
(require-package 'deferred)
;;(require-package 'ecb)
(require-package 'epc)
(require-package 'epl)
(require-package 'fill-column-indicator)
(require-package 'flycheck)
(require-package 'flycheck-irony)
(require-package 'helm)
(require-package 'helm-gtags)
(require-package 'irony-eldoc)
(require-package 'google-c-style)
(require-package 'helm-bibtex)
(require-package 'let-alist)
(require-package 'key-chord)
(require-package 'modern-cpp-font-lock)
;;(require-package 'org-ref)
(require-package 'pdf-tools)
(require-package 'popup)
(require-package 'python-environment)
(require-package 'smex)
(require-package 'smart-mode-line)
(require-package 'smart-mode-line-powerline-theme)
(require-package 'sr-speedbar) ; better speedbar
(require-package 'log4e)
(require-package 'yaxception)

;(require 'init-auto-complete)
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
;; ORG Capture
(define-key global-map (kbd "C-c c") 'org-capture)

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

; ==============================================================================
;                   _                               _   _   _
;  _ __   __ _  ___| | ____ _  __ _  ___   ___  ___| |_| |_(_)_ __   __ _ ___
; | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \ / __|/ _ \ __| __| | '_ \ / _` / __|
; | |_) | (_| | (__|   < (_| | (_| |  __/ \__ \  __/ |_| |_| | | | | (_| \__ \
; | .__/ \__,_|\___|_|\_\__,_|\__, |\___| |___/\___|\__|\__|_|_| |_|\__, |___/
; |_|                         |___/                                 |___/
;
; #package_settings
; ==============================================================================

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

;; PDF-Tools
(pdf-tools-install)

;;Autocomplete
;(require 'auto-complete-config)
;(ac-config-default)

;;Reftex
(require 'reftex)

;; ;;ECB
;; (require 'ecb)

;; HELM
(require 'init-helm)

;; Speedbar
(require 'sr-speedbar)

;; Company -- Complete Anything
(require 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(setq company-idle-delay 0)

;; Irony Mode -- For C++ and supporting Company, flycheck, and eldoc modes
(require 'irony)
(setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                      irony-cdb-clang-complete))
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'company-irony)
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))

(require 'flycheck-irony)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(require 'irony-eldoc)
(add-hook 'irony-mode-hook #'irony-eldoc)

;;;;Hooks
;;Programming mode hook
(add-hook 'prog-mode-hook
          '(lambda ()
             (load "prog_mode.el")
             ))

;; Provides the google C/C++ coding style. You may wish to add
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ;; Add .h files to c++

;;Python mode hook
(add-hook 'python-mode-hook
	  '(lambda ()
	     (load "python_mode.el")
	     ))

(add-hook 'cc-mode-hook
	  '(lambda ()
	     (load "c_mode.el")
	     ))

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (load "cpp_mode.el")
	     ))
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

;;Latex  mode
(add-hook 'TeX-mode-hook ( lambda()
		   (load "tex_mode.el")
                   ))
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;;Latex  mode
(add-hook 'org-mode-hook ( lambda()
		   (setq show-trailing-whitespace nil)
                   ))


;;Markdown mode
(autoload 'markdown-mode "markdown_mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Shell-mode
(add-hook 'shell-mode-hook ( lambda()
		   (load "shell_mode.el")
                   ))

(require 'init-linum)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(linum-disabled-modes-list
   (quote
    (eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode doc-view-mode pdf-view-mode)))
 '(org-agenda-files (quote ("~/repos/org/todo.org")))
 '(package-selected-packages
   (quote
    (irony company-irony company sr-speedbar helm-gtags cmake-font-lock cmake-mode protobuf-mode modern-cpp-font-lock haskell-mode smart-mode-line-powerline-theme smart-mode-line interleave helm-bibtex org-ref zenburn-theme vbasense solarized-theme smex python-environment projectile key-chord iy-go-to-char flycheck fill-column-indicator etags-table etags-select ess-R-object-popup ess-R-data-view epc ecb default-text-scale ctags-update color-theme-sanityinc-tomorrow color-theme auctex)))
 '(safe-local-variable-values (quote ((flycheck-gcc-include-path . "./inc")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
