;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d/modules to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "modules"))

;; MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun package-require (package)
  (unless (package-installed-p package)
    (package-install package)))

;; modules
(setq scttnlsn-modules
      '(scttnlsn-editor
        scttnlsn-git
        scttnlsn-nav
        scttnlsn-ui))

(dolist (file scttnlsn-modules)
  (require file))