(package-require 'clojure-mode)
(package-require 'clj-refactor)
(package-require 'cljsbuild-mode)
(package-require 'paredit)
(package-require 'smartparens)
(package-require 'aggressive-indent)

;; all lisps
(let ((lisp-hooks '(emacs-lisp-mode-hook
                    clojure-mode-hook))
      (lisp-modes '(paredit-mode
                    smartparens-mode)))
  (dolist (hook lisp-hooks)
    (dolist (mode lisp-modes)
      (add-hook hook mode))))

(require 'paredit)

(define-key paredit-mode-map (kbd "C-M-<left>") 'paredit-backward)
(define-key paredit-mode-map (kbd "C-M-<right>") 'paredit-forward)
(define-key paredit-mode-map (kbd "C-M-<up>") 'paredit-backward-up)
(define-key paredit-mode-map (kbd "C-M-<down>") 'paredit-forward-down)
(define-key paredit-mode-map (kbd "C-<left>") nil)
(define-key paredit-mode-map (kbd "C-<right>") nil)

;; elisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;; clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'aggressive-indent-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (dochan 'defun)
  (render 'defun))

;;(setq clojure-defun-style-default-indent nil)

(add-hook
 'clojure-mode-hook
 (lambda ()
   (define-clojure-indent
     (register-sub 'defun)
     (register-handler 'defun)
     (register-base 'defun))))

(add-hook
 'clojure-mode-hook
 (lambda ()
   (clj-refactor-mode 1)
   (cljr-add-keybindings-with-prefix "C-c C-m")))

;; CIDER

(package-require 'cider)
;;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(setq cider-repl-display-help-banner nil)

;; inf-clojure

(package-require 'inf-clojure)

(add-hook
 'inf-clojure-mode-hook
 (lambda ()
   (setq truncate-lines nil)))

(defun reload-current-clj-ns (next-p)
  (interactive "P")
  (let ((ns (clojure-find-ns)))
    (message (format "Loading %s ..." ns))
    (inf-clojure-eval-string (format "(require '%s :reload)" ns))
    (when (not next-p) (inf-clojure-eval-string (format "(in-ns '%s)" ns)))))

(defun enable-inf-clojure ()
  (interactive)
  (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
  (add-hook 'clojure-mode-hook
            '(lambda ()
               (define-key clojure-mode-map "\C-c\C-k" 'reload-current-clj-ns))))

(provide 'scttnlsn-lisp)
