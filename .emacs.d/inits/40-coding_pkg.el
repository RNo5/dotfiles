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
(use-package gtats
  :defer t

  :commands
  (gtags-mode)

  :init
  (add-hook 'c-mode-common-hook 'gtags-mode)

  :config
  (defvar gtags-mode-hook
    '(lambda ()
       (local-set-key "\M-t" 'gtags-find-tag)           ;関数の定義元へ
       (local-set-key "\M-r" 'gtags-find-rtag)          ;関数の参照元へ
       (local-set-key "\M-s" 'gtags-find-symbol)        ;変数の定義元/参照元へ
       (local-set-key "\C-t" 'gtags-pop-stack)          ;前のバッファに戻る
       ))
  ;;emacsからのgtagsの呼び出しが上手くいかないので追記
  ;;rootからの相対パスでなく現在位置からの相対パスに
  (defvar gtags-path-style 'relative))


;; (autoload 'gtags-mode "gtags" "" t)
;; ;; キーバインド
;; (defvar gtags-mode-hook
;;       '(lambda ()
;;          (local-set-key "\M-t" 'gtags-find-tag)           ;関数の定義元へ
;;          (local-set-key "\M-r" 'gtags-find-rtag)          ;関数の参照元へ
;;          (local-set-key "\M-s" 'gtags-find-symbol)        ;変数の定義元/参照元へ
;;          (local-set-key "\C-t" 'gtags-pop-stack)          ;前のバッファに戻る
;;          ))
;; ;;add-hook 'c-mode-common-hook にて、*.c や、*.h ファイル等を開き、c-mode に入った時に自動的に gtags-mode に入るようにする
;; (add-hook
;;  'c-mode-common-hook
;;  '(lambda()
;;     (gtags-mode 1)
;;     ))

;; ;;emacsからのgtagsの呼び出しが上手くいかないので追記
;; ;;rootからの相対パスでなく現在位置からの相対パスに
;; (defvar gtags-path-style 'relative)

