;; 01-display.el

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)


;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")


;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; 現在の行をハイライト表示する
;(setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)

;;;括弧をハイライト
(show-paren-mode t)

;; Isearchev のハイライトの反応をよくする
(setq lazy-highlight-initial-delay 0)

;; 行番号を表示
(require 'linum)
(global-linum-mode t)
;;5 桁分の領域を確保して行番号のあとにスペースを入れる
(setq linum-format "%4d  ")

;; モードラインに行番号表示
(line-number-mode t)
;; モードラインに列番号表示
(column-number-mode t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
          (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
                 (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
                ((eq line-number-mode t)
                 (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
                ((eq column-number-mode t)
                 (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

  (setq mode-line-position
                '(:eval (format my-mode-line-format
                                                (count-lines (point-max) (point-min))))))


;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; ツールバー非表示
(tool-bar-mode 0)
;; メニューバー非表示
(menu-bar-mode 0)

;;タブ幅の設定
(setq-default tab-width 4)



;; 全角スペースおよびタブの可視化
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                                                 trailing       ; 行末
                                                 tabs           ; タブ
                                                 empty          ; 先頭/末尾の空行
                                                 space-mark     ; 表示のマッピング
                                                 tab-mark
                                                 ))

(setq whitespace-display-mappings
          '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)


;;基本オフセットというのは、 1 段インデントをする際のサイズです。
;;c-basic-offset はバッファーローカルな変数です。
(setq-default c-basic-offset 4)
;; インデントの際にタブを使わずに、 空白(スペース)のみ使用する
(setq-default indent-tabs-mode nil)
