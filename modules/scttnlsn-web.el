(package-require 'web-mode)
(package-require 'less-css-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)

(setq css-indent-offset 2)
(setq less-css-indent-level 2)

(add-hook 'web-mode-hook (lambda ()
                           (define-key web-mode-map (kbd "C-c C-f") nil)))

(provide 'scttnlsn-web)
