(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;(package-refresh-contents)

(load-theme 'zenburn t)

(global-linum-mode t)  ;; display line numbers in margin
(setq linum-format "%d ")  ;; display one space after line num
(show-paren-mode 1)  ;; highlight matching paren
(column-number-mode 1)  ;; show column nums in status bar
(menu-bar-mode -1)  ;; hide the menu bar
(setq make-backup-files nil) ; stop creating ~ files

;; javascript js-mode customization
;; (setq js-indent-level 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dockerfile-mode yaml-mode typescript-mode markdown-mode rust-mode zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
