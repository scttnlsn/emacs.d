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
        scttnlsn-lisp
        scttnlsn-js
        scttnlsn-ruby
        scttnlsn-web
        scttnlsn-mail))

(dolist (file scttnlsn-modules)
  (require file))

;; misc packages
(package-require 'markdown-mode)
(package-require 'yaml-mode)

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq truncate-lines nil)))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2)))
