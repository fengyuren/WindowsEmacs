
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

(require 'grep)
(grep-apply-setting
 'grep-find-command
 '("C:/emacs/grep-find/find.exe . -type f -exec C:/emacs/grep-find/grep.exe -nH -ie  {} NUL \";\"" . 80 ) )
(grep-apply-setting
 'grep-command
 "C:/emacs/grep-find/grep.exe -nH -ie ")
(grep-apply-setting
 'grep-find-template
"C:/emacs/grep-find/find.exe . <X> -type f <F> -execC:/emacs/grep-find/grep.exe <C> -nH -ie <R> {} NUL \";\"" )

(set-default-font "-outline-微软雅黑-normal-normal-normal-sans-23-*-*-*-p-*-iso8859-1")
 
(defun svn-update()    
  "Svn update"    
  (interactive)    
  (let ((cmd (concat "TortoiseProc.exe /command:update /path:\"" buffer-file-name "\" /closeonend:0")))    
    (message cmd)
  (shell-command cmd)))    
    
(defun svn-commit()    
  "Svn commit"    
  (interactive)    
  (let ((cmd (concat "TortoiseProc.exe /command:commit /path:\"" buffer-file-name "\" /closeonend:0")))    
    (message cmd)    
  (shell-command cmd)))    
    
;;SVN diff    
(defun svn-diff()    
  "Svn diff"    
  (interactive)    
  (let ((cmd (concat "TortoiseProc.exe /command:diff /path:\"" buffer-file-name "\" /closeonend:0")))    
    (message cmd)    
  (shell-command cmd)))

(defun svn-log()    
  "Svn diff"    
  (interactive)    
  (let ((cmd (concat "TortoiseProc.exe /command:log /path:\"" buffer-file-name "\" /closeonend:0")))    
    (message cmd)    
  (shell-command cmd)))

 
;;代码折叠
;;(add-hook 'c-mode-common-hook   'hs-minor-mode)
;;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;(add-hook 'java-mode-hook       'hs-minor-mode)
;;(add-hook 'ess-mode-hook       'hs-minor-mode)
;;(add-hook 'perl-mode-hook       'hs-minor-mode)
;;(add-hook 'sh-mode-hook         'hs-minor-mode)
;;(add-hook 'python-mode-hook         'hs-minor-mode)
;;(add-hook 'lua-mode-hook         'hs-minor-mode)

(global-set-key [C-tab] 'hs-toggle-hiding)


;;projectile项目管理工具
;;(add-to-list 'load-path "D:\emacs_home\emacs_plugin\projectile_custom_v1")
(require 'projectile)

;; 默认全局使用
(projectile-global-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f5] 'projectile-find-file)

(defun projectile-erlgrep ()
  "Perform rgrep in the project."
  (interactive)
  (let ((search-regexp (if (and transient-mark-mode mark-active)
			   (buffer-substring (region-beginning) (region-end))
			 (read-string (projectile-prepend-project-name "ErlGrep for: ") (thing-at-point 'symbol))))
	(root-dir (expand-file-name (projectile-project-root))))
    (require 'grep)
    ;; paths for find-grep should relative and without trailing /
    (let ((grep-find-ignored-directories nil)
	  (grep-find-ignored-files nil))
      (grep-compute-defaults)
      (rgrep search-regexp "*.erl .hrl" root-dir))))


;;jump-to
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mod)

(autoload
  'ace-jump-mode
  "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;expand-region
(require 'expand-region)
(global-set-key (kbd "C-=")'er/expand-region)

;;windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(put 'upcase-region 'disabled nil)
