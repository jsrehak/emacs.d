
(require 'package)

;; Add package repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Define a function to install a package if required to make the code deployable
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
(require-package 'auto-complete)
(require-package 'cmake-font-lock)
(require-package 'cmake-mode)
(require-package 'color-theme)
(require-package 'dash)
(require-package 'default-text-scale)
(require-package 'deferred)
(require-package 'ecb)
(require-package 'epc)
(require-package 'epl)
(require-package 'ess)
(require-package 'ess-R-data-view)
(require-package 'ess-R-object-popup)
(require-package 'fill-column-indicator)
(require-package 'flycheck)
(require-package 'google-c-style)
(require-package 'haskell-mode)
(require-package 'helm-bibtex)
(require-package 'iy-go-to-char)
(require-package 'interleave)
(require-package 'let-alist)
(require-package 'key-chord)
(require-package 'matlab-mode)
(require-package 'modern-cpp-font-lock)
;;(require-package 'org)
(require-package 'org-ref)
(require-package 'popup)
(require-package 'python-environment)
(require-package 'smex)
(require-package 'smart-mode-line)
(require-package 'smart-mode-line-powerline-theme)
(require-package 'log4e)
(require-package 'yaxception)
(require-package 'vbasense)






(provide 'init-packages)
