;; Set PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d/modules to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "modules"))

;; MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(defun package-require (package)
  (unless (package-installed-p package)
    (package-install package)))

;; modules
(setq scttnlsn-modules
      '(scttnlsn-ui
        scttnlsn-editor
        scttnlsn-nav
        scttnlsn-git
        scttnlsn-lang))

(dolist (file scttnlsn-modules)
  (require file))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (typescript-mode yaml-mode markdown-mode racer rust-mode bundler robe rspec-mode aggressive-indent smartparens paredit vue-mode js2-mode jade-mode stylus-mode less-css-mode web-mode magit neotree helm-git-grep helm-descbinds helm-projectile projectile helm-dash golden-ratio company color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
