(package-require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(setq-default
 js2-mode-indent-ignore-first-tab t
 js2-strict-inconsistent-return-warning nil
 js2-pretty-multiline-declarations nil
 js2-mode-show-parse-errors nil
 js2-parsed-errors nil
 js2-parsed-warnings nil
 js2-global-externs
 '("module" "require" "__dirname" "process" "console" "JSON" "$" "_"))

(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl" 'js-load-file-and-go)))

(setq inferior-js-program-command "node")
(setq js-indent-level 2)
(setq js2-basic-offset 2)

(package-require 'js-comint)

(setq inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GJK]" "" output)))))

(package-require 'coffee-mode)
(custom-set-variables '(coffee-tab-width 2))

(provide 'scttnlsn-js)
