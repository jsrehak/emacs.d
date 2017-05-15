
; DIRECTORY STRUCTURE ================================================
(setq org-directory "~/repos/org")
(setq org-agenda-files '("~/repos/org"))
(setq org-archive-location (concat org-directory "/archive/%s_archive.org"))

;; Registers for files
(set-register ?t (cons 'file (concat org-directory "/todo.org")))
(set-register ?n (cons 'file (concat org-directory "/notes.org")))
(set-register ?s (cons 'file (concat org-directory "/schedule.org")))
(set-register ?p (cons 'file (concat org-directory "/projects.org")))

; TAGS ===============================================================
;; Persistent Tags list
(setq org-tag-persistent-alist '((:startgroup)
                      ("@office" . ?w) ("@home" . ?h)
                      ("@errands" . ?e)
                      (:endgroup)
                      (:startgroup)
                      ("@short_task" . ?s)
                      ("@full_focus" . ?f)
                      ("@brain_dead" . ?b)
                      ("@routines" . ?r)
                      ("@hang_time" . ?t)
                      (:endgroup)
                      ("URGENT" . ?u)
                      ("PROJECT")
                      ("someday")))

; TODO ===============================================================
;; Todo item keywords
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

;; AGENDA ============================================================
(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

;; KEYBINDINGS =======================================================
(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; CAPTURE ===========================================================

;;; TEMPLATES ========================================================

(setq org-capture-templates
      '(("t" "Todo" entry
         (file "todo.org")
         "* TODO %?")
        ("m" "Meeting" entry
         (file "meetings.org")
         "* Meeting: %?
WHEN: 
LOCATION: ")
        ))

;; CAPTURING
;;; Global key

;;; Locations
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-todos-file (concat org-directory "/todo.org"))

;; AGENDA Views

(setq org-agenda-start-day "-1d")
(setq org-agenda-span 7)
(setq org-agenda-start-on-weekday nil)
          
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         (
          (tags "PRIORITY=\"A\"|DEADLINE<=\"<+1w>\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "The Hotlist:")))
          (agenda "")
          (todo "IN-PROGRESS"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "In-progress")))
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (jsr-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-entry-if 'todo '("WAITING"))

                                                    ))))
          (todo "WAITING"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Waiting:")))
          ))
        
        ))


(defun jsr-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

;; MISC
;;; Add blank line before heading
(setq org-blank-before-new-entry
      '((heading . always)
       (plain-list-item . nil)))

;;; Force child tasks done before marking parent
(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
;;; Refile to show headings from all agenda files
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; ORG REF
(setq org-ref-bibliography-notes (concat org-directory "/references/references.org")
      org-ref-default-bibliography '(concat org-directory "/references/references.bib")
      org-ref-pdf-directory (concat org-directory "/references/pdfs/"))
