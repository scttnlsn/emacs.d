;; disable menu, tool and scroll bars
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; theme
(package-require 'solarized-theme)

(setq dark-theme 'solarized-dark)
(setq light-theme 'soliarized-light)
(setq current-theme dark-theme)

(load-theme current-theme t)

(defun toggle-theme-light-dark ()
  (interactive)
  (if (eq current-theme dark-theme)
      (setq current-theme light-theme)
      (setq current-theme dark-theme))
  (load-theme current-theme))

;; font
(set-default-font "M+ 1mn-14")

(provide 'scttnlsn-ui)