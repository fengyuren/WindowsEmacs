
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


;; set tab as 4 spaces
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq indet-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq tab-stop-list ())

(provide 'init-project)
