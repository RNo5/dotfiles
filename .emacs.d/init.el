;; ============================================================
;; configuration
;; ============================================================
;; .emacs.d/
;;     |
;;---------------------------------------------------------------
;;     |----init.el              - setup file to be load first.
;;     |
;;     |----lisp/                - Public emacs lisp downloaded from somewhere
;;     |      |----el-get/       - a package installer
;;     |      |----themes/       - themes
;;     |      |----gtags/        - gtags
;;     |      |
;;     |
;;     |----inits/               - setting files loaded via init-loader
;;     |      |----xx-xxx.el
;;     |      |                  -  00     Install packages by el-get (el-get-bundle).
;;     |      |                  -  01     General
;;     |      |                  -  02〜19 Emacs本体に元から備わっている機能に対する設定。
;;     |      |                  -  20〜29 Emacsの拡張機能に対する設定。一般的な表示関連
;;     |      |                  -  30〜39 Emacsの拡張機能に対する設定。一般的な編集関連
;;     |      |                  -  40〜49 Emacsの拡張機能に対する設定。コーディング関連
;;     |      |                  -  99     キーバインドの設定。
;;     |      |
;;     |
;;---------------------------------------------------------------
;;     |----private/             - private files
;;     |
;;---------------------------------------------------------------
;;     |----installed-packages/  - packages installed via el-get
;;     |      |----el-get/       - el-get packages
;;     |      |----elpa/         - elpa packages
;;     |
;;---------------------------------------------------------------

;; debug error: not shown (nil)
;;(setq debug-on-error nil)

;; Compile-Log: not shown
;;(let ((win (get-buffer-window "*Compile-Log*")))
;;    (when win (delete-window win)))

;; emacs directory. load-path で ~/.emacs.d とか書かなくてよくなる
;; emacs -l init.el : change the directory for user-emacs-directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;; サブディレクトリごとload-pathに追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

;; ============================================================
;; Setting for .emacs.d/private
;; ============================================================
;;; ディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "private")

;; load proxy setting
(when (file-exists-p (locate-user-emacs-file "private/my-proxy.el"))
  (require 'my-proxy))



;; ============================================================
;; Setting for .emacs.d/lisp
;; ============================================================
;;; ディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "lisp")

;; byte-compile for the elisp in lisp
(byte-recompile-directory (expand-file-name (concat user-emacs-directory "lisp")) 0)

;; ============================================================
;; Setting for package installer (el-get)
;; ============================================================

;; el-get cannot be installed by the following lisp so install it via git clone to .emacs.d/lisp/el-get
;; ------------------------------------------
;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (unless (require 'el-get nil 'noerror)
;;  (with-current-buffer
;;      (url-retrieve-synchronously
;;       "http://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;    (let (el-get-master-branch)
;;      (goto-char (point-max))
;;      (eval-print-last-sexp))))
;; (el-get 'sync)
;; ------------------------------------------


;; パッケージのインストール先を設定
(let ((package-installed-dir (locate-user-emacs-file "installed-packages")))
  (setq el-get-dir (expand-file-name "el-get" package-installed-dir)
        package-user-dir (expand-file-name "elpa" package-installed-dir)))

(require 'el-get)

;; ============================================================
;; Setting for use-package
;; ============================================================
;; Install and Load use-package via el-get to use it for the remaining inits/xx-xxx.el files
(el-get-bundle use-package)
(unless (require 'use-package nil t)
    (defmacro use-package (&rest args)))

;; ============================================================
;; Setting for Init loader
;; ============================================================
;; install and load init-loader via el-get to use it for the remaining inits/xx-xxx.el files
(el-get-bundle! init-loader)
;; 設定ファイルはinits以下に置いていて、init-loaderによって読み込まれる
(setq-default init-loader-show-log-after-init t
              init-loader-byte-compile t)
(init-loader-load (locate-user-emacs-file "inits"))
