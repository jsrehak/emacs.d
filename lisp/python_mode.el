;;Auto-complete
(global-auto-complete-mode t)
(setq python-shell-completion-native-enable nil)

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

; Indenting
(setq tab-width 4)
(setq python-indent 4)
(setq indent-tabs-mode nil)

;(setq jedi:server-command '("jediepcserver"))
;(jedi:setup)
;(setq jedi:complete-on-dot t)
