
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

(defun svn-blame()    
  "Svn blame"    
  (interactive)    
  (let ((cmd (concat "TortoiseProc.exe /command:blame /path:\"" buffer-file-name "\" /closeonend:0")))    
    (message cmd)    
  (shell-command cmd)))
(provide 'init-svn)
