; 01-highlight-symbol


;; ハイライト状態を維持した状態でコードリーディングしたい
(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる

;; 今カーソルがあたったところにあるsymbolにマッチするものを、自動的にハイライトしてくれる
; (require 'auto-highlight-symbol-config)

