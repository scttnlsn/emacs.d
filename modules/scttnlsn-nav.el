;; projectile
(package-require 'projectile)

(setq projectile-keymap-prefix (kbd "C-c p"))
(projectile-global-mode)
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "tmp")
(add-to-list 'projectile-globally-ignored-directories "log")
(add-to-list 'projectile-globally-ignored-directories "__pycache__")

(global-set-key (kbd "s-p") 'projectile-command-map)

;; helm
(package-require 'helm)
(package-require 'helm-projectile)
(package-require 'helm-descbinds)
(package-require 'helm-git-grep)
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
(global-set-key (kbd "C-c h o") 'helm-occur)

(setq helm-split-window-in-side-p t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-ff-file-name-history-use-recentf t)

(setq projectile-completion-system 'helm)
(helm-descbinds-mode)
(helm-mode 1)
(helm-projectile-on)

;; skip helm completion for dired
(add-to-list 'helm-completing-read-handlers-alist
             '(dired . nil))

;; the default helm prefix is too similar to "C-x C-c"
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map (kbd "g") 'helm-git-grep)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; neotree
(package-require 'neotree)
(setq neo-theme 'ascii)
(global-set-key (kbd "C-c t") 'neotree-toggle)
(with-eval-after-load 'neotree
  (setq neo-hidden-regexp-list
        '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" ;; defaults
          "__pycache__")))

(provide 'scttnlsn-nav)
