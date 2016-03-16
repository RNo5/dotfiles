;; 90-keybind.el

;;keyboard-translate を使用して C-h に backspace と同じ処理を割り当てる
(keyboard-translate ?\C-h ?\C-?)

;;; M-I でリージョンを整形
;; C-x h M-I とすれば全行にタブを使ったのと同じことになる
(global-set-key "\M-I" 'indent-region)


;; goto-line を M-g に割り当て
;(global-set-key "\M-g" (lambda (x) (interactive "nLine: ") (goto-line x)))

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)



;;OSのクリップボードと文字列を共有
(cond (window-system
           (setq x-select-enable-clipboard t)
           ))



;; highlight-symbol
;; 適宜keybindの設定
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)

;; expand-region
(global-unset-key "C-,")

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

;; multiple-cursors
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)
(smartrep-define-key
 global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    ("*"   . 'mc/mark-all-like-this)))


