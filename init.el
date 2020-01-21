
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;加载packages文件
(require 'init-packages)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-better-defaults)
(require 'init-org) 
(require 'file-search)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;;init grep-find-mode
(require 'grep)
;;init fonts
(require 'fonts)
;;add svn
(require 'init-svn)
;;add jumpmode
(require 'init-jumpmode)
;;add project
(require 'init-project)
;;add git
(require 'init-git)
;;add yasnippet
(require 'init-yasnippet)

;;add translate plus
(require 'insert-translated-name)

;;add learn English
;;(require 'guess-word-mode)

(put 'upcase-region 'disabled nil)
