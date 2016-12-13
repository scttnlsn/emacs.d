(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(((getenv "MAIL_SERVER") 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server (getenv "MAIL_SERVER")
      smtpmail-smtp-server (getenv "MAIL_SERVER")
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(require 'mu4e)

(setq
 user-mail-address (getenv "MAIL_ADDRESS")
 user-full-name (getenv "MAIL_NAME")
 mu4e-reply-to-address (getenv "MAIL_ADDRESS"))

(setq mu4e-maildir (expand-file-name (getenv "MAIL_DIR")))
(setq mu4e-get-mail-command "offlineimap")

(provide 'scttnlsn-mail)
