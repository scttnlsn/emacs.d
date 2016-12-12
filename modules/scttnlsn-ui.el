;; disable menu, tool and scroll bars
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; theme
(package-require 'color-theme-sanityinc-tomorrow)

(setq dark-theme 'sanityinc-tomorrow-night)
(setq light-theme 'sanityinc-tomorrow-day)
(setq current-theme dark-theme)

(load-theme current-theme t)

(defun toggle-theme-light-dark ()
  (interactive)
  (if (eq current-theme dark-theme)
      (setq current-theme light-theme)
    (setq current-theme dark-theme))
  (load-theme current-theme t))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;; font
(set-face-attribute 'default nil :font "Hack 14")

;; keybindings
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

(provide 'scttnlsn-ui)
