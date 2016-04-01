;; 01-display.el

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; ツールバー非表示
(tool-bar-mode 0)

;; メニューバー非表示
(menu-bar-mode 0)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
                    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; 現在の行をハイライト表示する
;(setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)

;;;括弧をハイライト
(show-paren-mode t)

;; Isearchev のハイライトの反応をよくする
(setq lazy-highlight-initial-delay 0)

;; モードラインに行番号表示
(line-number-mode t)
;; モードラインに列番号表示
(column-number-mode t)

(use-package linum
  :config
  ;; 行番号を表示
  (global-linum-mode t)
  ;;5 桁分の領域を確保して行番号のあとにスペースを入れる
  (setq linum-format "%4d  "))

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

