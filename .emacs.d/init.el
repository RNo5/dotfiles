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
;;     |      |----cl-lib/       - locate hrere since it cannot be listalled via el-get (un-known reason)
;;     |      |----themes/       - themes
;;     |
;;     |----inits/               - setting files loaded via init-loader
;;     |      |----00-xxx.el
;;     |      |                  -  00     package.el等によるパッケージの導入を書く。requireしたり設定するのは別ファイルに書く。
;;     |      |                  -  01〜19 Emacs本体に元から備わっている機能に対する設定。
;;     |      |                  -  20〜98 Emacsの拡張機能に対する設定。このなかでどう割り当てるかは別途考える。
;;     |      |                  -  99     キーバインドの設定。すべてのEmacsの拡張機能が読み込まれた後に実行する。
;;     |      |----themes/       - themes
;;     |
;;---------------------------------------------------------------
;;     |----private/             - private files
;;     |
;;---------------------------------------------------------------
;;     |----installed-packages/  - packages installed via el-get
;;     |
;;---------------------------------------------------------------


;(setq debug-on-error t)

;; emacs directory. load-path で ~/.emacs.d とか書かなくてよくなる
;; emacs -l init.el : change the directory for user-emacs-directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path user-emacs-directory)



(add-to-list 'load-path (locate-user-emacs-file "private"))

;; load proxy setting
(when (file-exists-p (locate-user-emacs-file "private/my-proxy.el"))
  (require 'my-proxy))

;; color-theme
(setq custom-theme-directory (locate-user-emacs-file "lisp/themes"))



;; ============================================================
;; Package install
;; ============================================================
;; install package via something except el-get

;; el-get
;; Precondition: el-get needs to be installed via git

;; パッケージのインストール先を設定
(let ((package-installed-dir (locate-user-emacs-file "installed-packages")))
  (setq el-get-dir (expand-file-name "el-get" package-installed-dir)
        package-user-dir (expand-file-name "elpa" package-installed-dir)))

;; パッケージのインストール先をEmacsバージョンによって変える
;; Emacsのバージョンが24.4.1の場合,~/.emacs.d/24.4.1/el-get, ~/.emacs.d/24.4.1/elpaにインストールされる
;; (let ((versioned-dir (locate-user-emacs-file emacs-version)))
;;   (setq el-get-dir (expand-file-name "el-get" versioned-dir)
;;         package-user-dir (expand-file-name "elpa" versioned-dir)))

(add-to-list 'load-path (locate-user-emacs-file "lisp/el-get"))
(require 'el-get)


;; cl-lib
;; Precondition: cl-lib needs to be installed via wget
;; wget http://elpa.gnu.org/packages/cl-lib-0.5.el
;; mv cl-lib-0.5.el cl-lib.el
(add-to-list 'load-path (locate-user-emacs-file "lisp/cl-lib"))
(require 'cl-lib)


;; ============================================================
;; Init loader
;; ============================================================
;; install init-loader via el-get
(el-get-bundle init-loader)

;; 設定ファイルはinits以下に置いていて、init-loaderによって読み込まれる
(require 'init-loader)
(setq-default init-loader-show-log-after-init t
              init-loader-byte-compile t)
(init-loader-load (locate-user-emacs-file "inits"))
