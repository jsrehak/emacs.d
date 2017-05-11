(setq-default
 show-trailing-whitespace nil)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq org-agenda-files '("~/repos/org/"))
(setq org-directory "~/repos/org")

(setq org-tag-alist '((:startgroup . nil)
                      ("@office" . ?w) ("@home" . ?h)
                      ("@errands" . ?e)
                      (:endgroup . nil)
                      ("@short_task" . ?s)
                      ("@full_focus" . ?f)
                      ("@brain_dead" . ?b)
                      ("@routines" . ?r)
                      ("@hang_time" . ?t)
                      ("URGENT" . ?u)))



;; AGENDA
(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)
(define-key global-map "\C-cl" 'org-store-link)


;; TEMPLATES

(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t")))

;; CAPTURING
;;; Global key
(define-key global-map (kbd "C-c c") 'org-capture)
;;; Locations
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-todos-file (concat org-directory "/todo.org"))

;; AGENDA Views
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "The Hotlist:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (jsr-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))

(defun jsr-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

;; Registers for files
(set-register ?t (cons 'file "~/repos/org/todo.org"))
(set-register ?n (cons 'file "~/repos/org/notes.org"))

;; MISC
;;; Add blank line before heading
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
;;; Force child tasks done before marking parent
(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
;;; Refile to show headings from all agenda files
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; ORG REF
(setq org-ref-bibliography-notes (concat org-directory "/references/references.org")
      org-ref-default-bibliography '(concat org-directory "/references/references.bib")
      org-ref-pdf-directory (concat org-directory "/references/pdfs/"))
