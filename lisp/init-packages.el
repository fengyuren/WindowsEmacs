
 ;; cl - Common Lisp Extension
 (require 'cl)

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
       (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像



 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		monokai-theme
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		lua-mode
		python-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		popwin
		;; solarized-theme
		csv
		elpy
		flycheck
		py-autopep8 ;;add the autopep8 package
		) "Default packages")

 (setq package-selected-packages my/packages)

(elpy-enable)
 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;;(elpy-use-ipython)


 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(global-auto-revert-mode t)
(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; config js2-mode for js files
(setq auto-mode-alist
	  (append
	   '(("\\.lua\\'" . lua-mode))
	   auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;(require 'bbdb-csv-import)

;;语法检测

(add-hook 'find-file-hook 'flymake-find-file-hook)
(provide 'init-packages)
