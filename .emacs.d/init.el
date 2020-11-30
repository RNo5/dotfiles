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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; (setq package-archives
;;       '(("gnu" . "http://elpa.gnu.org/packages/")
;;         ("melpa" . "http://melpa.org/packages/")
;;         ("org" . "http://orgmode.org/elpa/")))



(setq
 ;; Configure GNU/Emacs package repositories.
 package-archives
 '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
   ("MELPA Stable" . "http://stable.melpa.org/packages/")
   ("MELPA"        . "http://melpa.org/packages/")
   ("org"          . "http://orgmode.org/elpa/")
   ("marmalade"    . "http://marmalade-repo.org/packages/"))
 ;; Prefer MELPA Stable over GNU over MELPA.
 package-archive-priorities
 '(("MELPA Stable" . 20)
   ("GNU ELPA"     . 15)
   ("MELPA"        . 10)
   ("org"          . 5)
   ("marmalade"    . 0)))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(case-fold-search nil)
 '(custom-safe-themes
   (quote
    ("f7cee32b1eda171e5bb53746a0a83a02bf9e306adc30793e0c393dae5f3c643d" default)))
 '(delete-selection-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "brightcyan")))))
