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

;; set cursor to vertical bar
(set-default 'cursor-type 'bar)

;; typed text replaces selection
(delete-selection-mode 1)

;; highlight matching paren
(show-paren-mode 1)

;; comments
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-x /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

;; search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; autocomplete
(global-set-key [C-tab] 'hippie-expand)

;; window movement
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

(provide 'scttnlsn-editor)
