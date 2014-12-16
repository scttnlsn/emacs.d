(package-require 'web-mode)
(package-require 'less-css-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)

(setq css-indent-offset 2)
(setq less-css-indent-level 2)

(provide 'scttnlsn-web)
