;; 02-edit.el

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)


;;タブ幅の設定
(setq-default tab-width 4)


;;基本オフセットというのは、 1 段インデントをする際のサイズです。
;;c-basic-offset はバッファーローカルな変数です。
(setq-default c-basic-offset 4)
;; インデントの際にタブを使わずに、 空白(スペース)のみ使用する
(setq-default indent-tabs-mode nil)

;; 全角スペースおよびタブの可視化
(use-package whitespace
  :defer t

  :config
  (setq whitespace-style '(face           ; faceで可視化
                           trailing       ; 行末
                           tabs           ; タブ
                           empty          ; 先頭/末尾の空行
                           space-mark     ; 表示のマッピング
                           tab-mark
                           ))
  (setq whitespace-display-mappings
          '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1))

;; ----------------------------
;; Setting for dired
;; ----------------------------
;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
