;; 検索文字列が現在のバッファでいくつマッチするのかという情報と現在の位置をモードラインに表示するマイナーモードを提供します.
(require 'anzu)

(global-anzu-mode +1)
(setq anzu-search-threshold 100)
(setq anzu-minimum-input-length 3)

(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c R") 'anzu-query-replace-regexp)
