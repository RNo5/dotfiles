(use-package anzu

  :init
  (anzu-mode +1)

  :bind
;;  ("C-c r" . anzu-query-replace-regexp)
;;  ("C-c R" . anzu-query-replace-regexp)

  :config
  (setq anzu-search-threshold 100)
  (setq anzu-minimum-input-length 3)
  (global-anzu-mode +1))

(use-package visual-regexp

  :init

  :bind
  ("C-c r" . vr/replace)
  ("C-c q" . vr/query-replace)
  ("C-c m" . vr/mc-mark))


;; (use-package expand-region
;;   :defer t

;;   :bind
;;   ;;("C-c -," . er/contract-region)
;;   ("C-c +" . er/expand-region))


;; (use-package multiple-cursors
;;   :defer t

;;   :bind
;;   ("C-M-c" . mc/edit-lines)
;;   ("C-M-r" . mc/mark-all-in-region)

;;   :config
;;   (require 'smartrep)
;;   (declare-function smartrep-define-key "smartrep")
;;   (smartrep-define-key global-map "<f5>"
;;     '(("<f5>" . 'mc/mark-next-like-this)
;;       ("n"   . 'mc/mark-next-like-this)
;;       ("p"   . 'mc/mark-previous-like-this)
;;       ("m"   . 'mc/mark-more-like-this-extended)
;;       ("u"   . 'mc/unmark-next-like-this)
;;       ("U"   . 'mc/unmark-previous-like-this)
;;       ("s"   . 'mc/skip-to-next-like-this)
;;       ("S"   . 'mc/skip-to-previous-like-this)
;;       ("*"   . 'mc/mark-all-like-this)
;;       ("d"   . 'mc/mark-all-like-this-dwim)
;;       ("i"   . 'mc/insert-numbers)
;;       ("o"   . 'mc/sort-regions)
;;       ("O"   . 'mc/reverse-regions))))

;; (use-package csv
;;   :init
;;   )


;; ;; CSV mode config
;; (use-package csv-mode
;;   :ensure t
;;   :mode "\\.csv$"
;;   :init)

;; csv-mode
(use-package csv-mode
  :defer t
;  :ensure t
  :init
  :config
  (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  (autoload 'csv-mode "csv-mode"
      "Major mode for editing comma-separated value files." t))
