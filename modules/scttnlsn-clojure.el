(package-require 'clojure-mode)
(package-require 'cider)
(package-require 'cljsbuild-mode)
(package-require 'paredit)
(package-require 'smartparens)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)

(provide 'scttnlsn-clojure)
