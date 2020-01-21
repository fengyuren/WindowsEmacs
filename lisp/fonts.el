
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
(provide 'fonts)
