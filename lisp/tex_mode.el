(setq TeX-auto-save t)
(setq TeX-parse-self t)
(turn-on-auto-fill)
(flyspell-mode)
(turn-on-reftex)

(eval-after-load "tex"   '(add-to-list 'TeX-command-list
                                       '("Makeglossaries" "makeglossaries %s" TeX-run-command nil
                                         (latex-mode)
                                                  :help "Run makeglossaries script, which will choose xindy or makeindex") t))
