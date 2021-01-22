;;; symlinkは必ず追いかける
(setq vc-follow-symlinks t)



;;; revert buffer
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(global-set-key (kbd "C-c C-l") 'revert-buffer-no-confirm)
