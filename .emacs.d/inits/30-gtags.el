;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU GLOBAL(gtags)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; makeしたglobal-xxxからgtags.elを下記のパスにコピーしたので、load-pathに追加
;(setq load-path (cons "~/.emacs.d/site-lisp/gtags/" load-path))

(autoload 'gtags-mode "gtags" "" t)
;; キーバインド
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)           ;関数の定義元へ
         (local-set-key "\M-r" 'gtags-find-rtag)          ;関数の参照元へ
         (local-set-key "\M-s" 'gtags-find-symbol)        ;変数の定義元/参照元へ
         (local-set-key "\C-t" 'gtags-pop-stack)          ;前のバッファに戻る
         ))
;;add-hook 'c-mode-common-hook にて、*.c や、*.h ファイル等を開き、c-mode に入った時に自動的に gtags-mode に入るようにする
(add-hook
 'c-mode-common-hook
 '(lambda()
    (gtags-mode 1)
    ))

;;emacsからのgtagsの呼び出しが上手くいかないので追記
;;rootからの相対パスでなく現在位置からの相対パスに
(setq gtags-path-style 'relative)
