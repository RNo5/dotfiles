((anzu status "installed" recipe
       (:name anzu :after nil :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (auto-highlight-symbol status "installed" recipe
			(:name auto-highlight-symbol :after nil :type github :pkgname "emacsmirror/auto-highlight-symbol" :description "Automatic highlighting current symbol minor mode" :website "https://github.com/emacsmirror/auto-highlight-symbol/"))
 (c-eldoc status "installed" recipe
	  (:name c-eldoc :after nil :description "eldoc-mode plugin for C source code" :type github :pkgname "nflath/c-eldoc" :post-init
		 (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))
 (el-get status "required")
 (expand-region status "installed" recipe
		(:name expand-region :after nil :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (ggtags status "installed" recipe
	 (:name ggtags :after nil :description "Use GNU Global in Emacs." :type github :pkgname "leoliu/ggtags"))
 (highlight-symbol status "installed" recipe
		   (:name highlight-symbol :after nil :description "Quickly highlight a symbol throughout the buffer and cycle through its locations." :type github :pkgname "nschum/highlight-symbol.el"))
 (init-loader status "installed" recipe
	      (:name init-loader :after nil :website "https://github.com/emacs-jp/init-loader" :description "It enables you to categorize your configurations and separate them into multiple files." :type github :pkgname "emacs-jp/init-loader"))
 (smartrep status "installed" recipe
	   (:name smartrep :after nil :description "Support sequential operation which omitted prefix keys." :website "http://sheephead.homelinux.org/2011/12/19/6930/" :type github :pkgname "myuhe/smartrep.el" :prepare
		  (progn
		    (autoload 'smartrep-restore-original-position "smartrep" nil t)
		    (autoload 'smartrep-map-internal "smartrep" nil t)))))
