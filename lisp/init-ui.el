
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode1
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

;;光标样式
(setq-default cursor-type 'bar)

;;默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;高亮当前行
(global-hl-line-mode 1)

;;;; FONTS
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")
(set-default-font "Dejavu Sans Mono 10")
(if (and (fboundp 'daemonp) (daemonp))
(add-hook 'after-make-frame-functions
(lambda (frame)
(with-selected-frame frame
(set-fontset-font "fontset-default"
'unicode "WenQuanyi Micro Hei Mono 12"))))
(set-fontset-font "fontset-default" 'unicode "WenQuanYi Micro Hei Mono 12"))


(provide 'init-ui)
