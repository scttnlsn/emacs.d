;; ----------
;; HTML/CSS

(package-require 'web-mode)
(package-require 'less-css-mode)
(package-require 'stylus-mode)
(package-require 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq css-indent-offset 2)
(setq less-css-indent-level 2)

;; ----------
;; JS

(package-require 'js2-mode)
(package-require 'vue-mode)
(package-require 'typescript-mode)

;; ----------
;; Lisp

(package-require 'paredit)
(package-require 'smartparens)
(package-require 'aggressive-indent)
(require 'paredit)

(let ((lisp-hooks '(emacs-lisp-mode-hook
                    clojure-mode-hook))
      (lisp-modes '(paredit-mode
                    smartparens-mode)))
  (dolist (hook lisp-hooks)
    (dolist (mode lisp-modes)
      (add-hook hook mode))))

(define-key paredit-mode-map (kbd "C-M-<left>") 'paredit-backward)
(define-key paredit-mode-map (kbd "C-M-<right>") 'paredit-forward)
(define-key paredit-mode-map (kbd "C-M-<up>") 'paredit-backward-up)
(define-key paredit-mode-map (kbd "C-M-<down>") 'paredit-forward-down)
(define-key paredit-mode-map (kbd "C-<left>") nil)
(define-key paredit-mode-map (kbd "C-<right>") nil)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;; ----------
;; Ruby

(package-require 'rspec-mode)
(package-require 'robe)
(package-require 'bundler)

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(setq rspec-use-rake-flag nil)
(setq ruby-deep-indent-paren nil)

(add-hook 'rspec-compilation-mode-hook
          (lambda () (setq truncate-lines nil)))

;; ----------
;; Rust

(package-require 'rust-mode)
(package-require 'racer)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; ---------
;; Misc.

(package-require 'markdown-mode)
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq truncate-lines nil)))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2)))

(package-require 'yaml-mode)

(provide 'scttnlsn-lang)
