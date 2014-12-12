(package-require 'web-mode)
(package-require 'less-css-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)

(provide 'scttnlsn-web)
