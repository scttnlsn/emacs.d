;; projectile
(package-require 'projectile)

(projectile-global-mode)

(global-set-key (kbd "C-c C-f") 'projectile-find-file)

;; helm
(package-require 'helm)
(package-require 'helm-projectile)
(package-require 'helm-descbinds)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(global-set-key (kbd "C-c f") 'helm-recentf)

(setq helm-split-window-in-side-p t
      helm-buffers-fuzzy-matching t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-ff-file-name-history-use-recentf t)

(setq projectile-completion-system 'helm)
(helm-descbinds-mode)
(helm-mode 1)
(helm-projectile-on)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'scttnlsn-nav)
