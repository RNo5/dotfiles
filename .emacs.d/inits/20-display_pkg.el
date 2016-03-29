;; ============================================================
;; Setting for .emacs.d/lisp/themes
;; ============================================================
;; color-theme
(setq custom-theme-directory (locate-user-emacs-file "lisp/themes"))


;; 背景黒のtheme (customize them)
(load-theme 'molokai t)
(enable-theme 'molokai)

;; ハイライト状態を維持した状態でコードリーディングしたい
(use-package highlight-symbol
  :defer t
  :bind
  (("<f3>" . highlight-symbol-at-point)
  ("<f4>" . highlight-symbol-remove-all))
  :config
  ;; 使いたい色を設定、repeatしてくれる
  (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")))


