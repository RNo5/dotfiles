;; auto-complete
(use-package auto-complete
  :defer t

  :config
  (require 'auto-complete-config)
  (ac-config-default)
  (add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
  (global-auto-complete-mode t)              ;; グローバルで auto-complete を利用
  (ac-set-trigger-key "TAB")
  (setq ac-use-menu-map t)                   ;; 補完メニュー表示時にC-n/C-pで補完候補選択
  (setq ac-use-fuzzy t))                     ;; 曖昧マッチ

(use-package sr-speedbar
  :defer t
  :bind
  ("<f6>" . sr-speedbar-toggle)
  :config
  (sr-speedbar-refresh-turn-off)
  (setq sr-speedbar-right-side nil))

(use-package c-eldoc
  :defer t

  :commands
  (c-turn-on-eldoc-mode)

  :init
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
  (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

  :config
  (setq c-eldoc-buffer-regenerate-time 60)
  (set (make-local-variable 'eldoc-idle-delay) 0.20))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU GLOBAL(gtags)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package gtags
;;   :defer t

;;   :commands
;;   (gtags-mode)

;;   :init
;;   (add-hook 'c-mode-common-hook 'gtags-mode)

;;   :config
;;   (defvar gtags-mode-hook
;;     '(lambda ()
;;        (local-set-key "\M-t" 'gtags-find-tag)           ;関数の定義元へ
;;        (local-set-key "\M-r" 'gtags-find-rtag)          ;関数の参照元へ
;;        (local-set-key "\M-s" 'gtags-find-symbol)        ;変数の定義元/参照元へ
;;        (local-set-key "\C-t" 'gtags-pop-stack)          ;前のバッファに戻る
;;        ))
;;   ;;emacsからのgtagsの呼び出しが上手くいかないので追記
;;   ;;rootからの相対パスでなく現在位置からの相対パスに
;;   (defvar gtags-path-style 'relative))


(use-package ggtags
  :init
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
                (ggtags-mode 1))))
  (add-hook 'clojure-mode-hook (lambda () (ggtags-mode 1)))

  :config
  ;; use helm
  ;;  (setq ggtags-completing-read-function nil)

  ;; use eldoc
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)

  ;; imenu
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)

  (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
  (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
  (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
  (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
  (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
  (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
  (define-key ggtags-mode-map (kbd "C-c g m") 'ggtags-find-tag-dwim)
  (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark))


;; (require 'helm-gtags)
;; (add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
;; (setq helm-gtags-path-style 'root)
;; (setq helm-gtags-auto-update t)
;; (add-hook 'helm-gtags-mode-hook
;;           '(lambda ()
;;              (local-set-key (kbd "M-g") 'helm-gtags-dwim)
;;              (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
;;              (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
;;              (local-set-key (kbd "M-n") 'helm-gtags-next-history)))
