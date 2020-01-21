;(global-set-key (kbd "\C-s" 'swiper))
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "\C-x\ \C-r") 'recentf-open-files)
(global-set-key (kbd "C-c p f") 'counsel-git)
;(global-set-key (kbd "C-c a") 'org-agenda))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x f") 'find-grep)
(global-set-key (kbd "<f6>") 'find-file-in-project)
(global-set-key (kbd "C-c C-z") 'projectile-find-file)
(global-set-key (kbd "C-x C-t") 'insert-translated-name-insert)

(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)
;;注释

(defun my-comment-or-uncomment-region (beg end &optional arg)  
  (interactive (if (use-region-p)  
                   (list (region-beginning) (region-end) nil)  
                 (list (line-beginning-position)  
                       (line-beginning-position 2))))  
  (comment-or-uncomment-region beg end arg)  
)  
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region) 

(provide 'init-keybindings)
