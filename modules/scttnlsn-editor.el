(cua-mode t)

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

;; truncate lines by default
(set-default 'truncate-lines t)

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
(package-require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key [C-tab] 'company-complete-common)

;; window movement
(package-require 'golden-ratio)

(global-set-key (kbd "C-c g") 'golden-ratio)

(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun rotate-windows ()
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* ((w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2)))
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "C-x -") 'toggle-window-split)
(global-set-key (kbd "C-x C-\\") 'rotate-windows)

;; multiple cursors
(package-require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; misc.
(package-require 'helm-dash)
(global-set-key (kbd "C-c d") 'helm-dash-at-point)
(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-c a") 'align-regexp)

(package-require 'which-key)
(which-key-mode)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(global-set-key (kbd "C-c ca") 'close-all-buffers)

;; (defun copy-filename ()
;;   "Copy the full path of the current buffer."
;;   (interactive)
;;   (kill-new (buffer-file-name (window-buffer (minibuffer-selected-window)))))

;; (global-set-key (kbd "M-c") 'copy-filename)

(provide 'scttnlsn-editor)
