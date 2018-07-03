(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
(turn-on-auto-fill)
(flyspell-mode)
(turn-on-reftex)
(setq-default TeX-master nil) ; Query for master file.

(eval-after-load "tex"   '(add-to-list 'TeX-command-list
                                       '("Makeglossaries" "makeglossaries %s" TeX-run-command nil
                                         (latex-mode)
                                         :help "Run makeglossaries script, which will choose xindy or makeindex") t))


(let ((math (reverse (append LaTeX-math-list LaTeX-math-default))))
  (while math
    (let ((entry (car math))
          value)
      (setq math (cdr math))
      (if (listp (cdr entry))
          (setq value (nth 1 entry))
        (setq value (cdr entry)))
      (if (stringp value)
          (fset (intern (concat "LaTeX-math-" value))
                (list 'lambda (list 'arg) (list 'interactive "*P")
                      (list 'LaTeX-math-insert value
                            '(null (texmathp)))))))))

(setq LaTeX-math-list
      '(
            (?\ "partial" "Misc Symbol" 8706) ;; #X2202
        ))

(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
