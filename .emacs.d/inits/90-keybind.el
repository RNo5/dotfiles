;; 90-keybind.el

;;keyboard-translate を使用して C-h に backspace と同じ処理を割り当てる
(keyboard-translate ?\C-h ?\C-?)

;;; M-I でリージョンを整形
;; C-x h M-I とすれば全行にタブを使ったのと同じことになる
(global-set-key "\M-I" 'indent-region)

;; goto-line を M-g に割り当て
(global-set-key "\M-g" 'goto-line)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)


(progn
  (bind-key  "C-c R"       'revert-buffer)
  (bind-key  "M-<left>"    'bs-cycle-previous)
  (bind-key  "M-<right>"   'bs-cycle-next))
