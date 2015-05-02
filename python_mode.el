;;Auto-complete
 (global-auto-complete-mode t)

;; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
;use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

;--------------------;
;;; User Interface ;;;
;--------------------;

; always use spaces, not tabs, when indenting
(setq indent-tabs-mode nil)

; ignore case when searching
(setq case-fold-search t)

; require final newlines in files when they are saved
(setq require-final-newline t)

; set the keybinding so that you can use f4 for goto line
;;(global-set-key &#91;f4&#93; 'goto-line)

;----------------------;
;;; Windows & Frames ;;;
;----------------------;

; language
(setq current-language-environment "English")

; don't show the menu bar
;;(menu-bar-mode nil)
; don't show the tool bar
;;(require 'tool-bar)
(tool-bar-mode -1)
; don't show the scroll bar
(scroll-bar-mode -1)

; number of characters until the fill column
(fci-mode t)
(setq fill-column 70)

; specify the fringe width for windows -- this sets both the left and
; right fringes to 10
(require 'fringe)
(fringe-mode 10)

; lines which are exactly as wide as the window (not counting the
; final newline character) are not continued. Instead, when point is
; at the end of the line, the cursor appears in the right fringe.
(setq overflow-newline-into-fringe t)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq truncate-lines t)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows t)

; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)

;------------;
;;; Cursor ;;;
;------------;

; highlight the current line
;;(require 'highlight-current-line)
;(global-hl-line-mode t)
;(setq highlight-current-line-globally t)
;(setq highlight-current-line-high-faces nil)
;(setq highlight-current-line-whole-line nil)
;(setq hl-line-face (quote highlight))

; don't blink the cursor
(blink-cursor-mode nil)

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode t)

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode t)

;-------------------------;
;;; Syntax Highlighting ;;;
;-------------------------;

; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;-----------------;
;;; Color Theme ;;;
;-----------------;

; use the "Subtle Hacker" color theme as a base for the custom scheme
;;(require 'color-theme)
(color-theme-initialize)
	     (setq color-theme-is-global t)
	     (color-theme-subtle-hacker)

	     (custom-set-faces
	      '(default ((t (:overline nil :inherit nil :stipple nil :background "gray2"
				       :foreground "#FFF991" :inverse-video nil :box nil
				       :strike-through nil :underline nil
				       :slant normal :weight normal :height 83 :width normal
				       :foundry "unknown" :family "DejaVu Sans Mono"))))
	      '(border ((t nil)))
	      '(cursor ((t (:background "firebrick1" :foreground "black"))))
	      '(font-lock-comment-delimiter-face
		((default (:inherit font-lock-comment-face :weight ultra-bold))
		 (((class color) (min-colors 16)) nil)))
	      '(font-lock-comment-face ((t (:foreground "lime green"))))
	      '(font-lock-doc-face ((t (:foreground "tomato" :slant italic))))
	      '(font-lock-function-name-face
		((t (:foreground "deep sky blue" :underline t :weight bold))))
	      '(font-lock-keyword-face ((t (:foreground "gold" :weight bold))))
	      '(font-lock-string-face ((t (:foreground "tomato" :slant italic))))
	      '(fringe ((nil (:background "black"))))
	      '(highlight ((t (:background "khaki1" :foreground "black"
					   :box (:line-width -1 :color "firebrick1")))))
	      '(highlight-current-line-face ((t (:inherit highlight))))
	      '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
	      '(link ((t (:foreground "DodgerBlue3" :underline t))))
	      '(menu ((t (:background "gray2" :foreground "#FFF991"))))
	      '(minibuffer-prompt ((t (:foreground "royal blue"))))
	      '(mode-line ((t (:background "dark olive green"
					   :foreground "dark blue"
					   :box (:line-width -1 :color "gray75")
					   :weight bold))))
	      '(mode-line-buffer-id ((t (:background "dark olive green" :foreground "beige"))))
	      '(mode-line-highlight ((((class color) (min-colors 88)) nil)))
	      '(mode-line-inactive ((t (:background "dark olive green"
						    :foreground "dark khaki" :weight light))))
	      '(mouse ((t (:background "Grey" :foreground "black"))))
	      '(trailing-whitespace ((((class color) (background dark))
				      (:background "firebrick1")))))

					; make sure the frames have the dark background mode by default
	     (setq default-frame-alist (quote (
					       (frame-background-mode . dark)
					       )))
