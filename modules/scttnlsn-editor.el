;; disable autosave and locking
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; blank scratch message
(setq initial-scratch-message "")

;; utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; whitespace
(package-require 'whitespace)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'term-mode-hook (lambda () (setq show-trailing-whitespace nil)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


(setq require-final-newline t)

(provide 'scttnlsn-editor)
