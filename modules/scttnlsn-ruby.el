(package-require 'rspec-mode)
(package-require 'robe)
(package-require 'bundler)

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; don't use rake to run rspec
(setq rspec-use-rake-flag nil)

(setq ruby-deep-indent-paren nil)

(add-hook 'rspec-compilation-mode-hook
          (lambda () (setq truncate-lines nil)))

(provide 'scttnlsn-ruby)
