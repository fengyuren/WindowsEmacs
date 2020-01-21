

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

;;expand-region
(require 'expand-region)
(global-set-key (kbd "C-=")'er/expand-region)

;;windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(provide 'init-jumpmode)
