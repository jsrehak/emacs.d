(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(local-set-key [(control return)] 'semantic-ia-complete-symbol)
(local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(local-set-key "." 'semantic-complete-self-insert)
(local-set-key ">" 'semantic-complete-self-insert))
(modern-c++-font-lock-global-mode t)

; number of characters until the fill column
(setq fci-rule-column 80)
(setq-default comment-column 40)
