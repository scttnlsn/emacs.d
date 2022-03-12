;; ----------
;; Misc

(package-require 'flycheck)
(package-require 'writeroom-mode)
(package-require 'yaml-mode)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2)))

;; ----------
;; HTML/CSS

(package-require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq css-indent-offset 2)

;; ----------
;; JS

(package-require 'js2-mode)
(setq js-indent-level 2)
(setq js2-basic-offset 2)

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

(setq rspec-use-rake-flag nil)
(setq rspec-use-spring-when-possible nil)
(setq rspec-command-options "")
(setq ruby-use-smie nil)
(setq ruby-deep-indent-paren nil)

(add-hook 'rspec-compilation-mode-hook
          (lambda () (setq truncate-lines nil)))

(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-align-to-stmt-keywords '(if begin case))

;; ---------
;; Python

(package-require 'elpy)

(defun load-elpy ()
  (elpy-enable)
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (setq elpy-eldoc-show-current-function nil)
    (add-hook 'elpy-mode-hook 'flycheck-mode)))

(advice-add 'python-mode :before 'load-elpy)

(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))

;; ---------
;; Markdown

(package-require 'markdown-mode)
(setq markdown-command "pandoc -f markdown -t html -s --mathjax --highlight-style=pygments")
(add-hook 'markdown-mode-hook 'writing-mode)
(add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)

(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode 1)
            (setq truncate-lines nil)))


(provide 'scttnlsn-lang)
