
(require 'package)

;; Add package repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

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
(require-package 'color-theme)
(require-package 'dash)
(require-package 'default-text-scale)
(require-package 'deferred)
(require-package 'epc)
(require-package 'epl)
(require-package 'ess)
(require-package 'ess-R-data-view)
(require-package 'ess-R-object-popup)
(require-package 'fill-column-indicator)
(require-package 'flycheck)
(require-package 'iy-go-to-char)
(require-package 'jedi)
(require-package 'jedi-core)
(require-package 'let-alist)
(require-package 'key-chord)
(require-package 'popup)
(require-package 'python-environment)
(require-package 'smex)
(require-package 'log4e)
(require-package 'yaxception)
(require-package 'vbasense)






(provide 'init-packages)
