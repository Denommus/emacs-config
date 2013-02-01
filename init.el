;;; init.el --- Configuration for my Emacs
;;; Commentary:
;;;;Copyright (C) 2012  Yuri da Costa Albuquerque
;;;;
;;;;This program is free software: you can redistribute it and/or modify
;;;;it under the terms of the GNU General Public License as published by
;;;;the Free Software Foundation, either version 3 of the License, or
;;;;(at your option) any later version.
;;;;
;;;;This program is distributed in the hope that it will be useful,
;;;;but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;;GNU General Public License for more details.
;;;;
;;;;You should have received a copy of the GNU General Public License
;;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/org/metas.org" "~/Dropbox/org/agenda.org" "~/Dropbox/org/lpic.org")))
 '(smtpmail-smtp-server "mail.tap4mobile.com.br")
 '(smtpmail-smtp-service 25)
 '(socks-server (quote ("Default server" "localhost" 9050 5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Misc
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
(setq make-backup-files nil)
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "google-chrome"
      browse-url-browser-function gnus-button-url)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-auto-revert-mode 1)
(add-hook 'find-file-hook '(lambda ()
                             (setq indicate-buffer-boundaries t)))
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
(put 'dired-find-alternate-file 'disabled nil)

;;Clean up
(defun cleanup-buffer-safe ()
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))
(defun cleanup-buffer ()
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c s") 'cleanup-buffer)

;; Ruby
(add-hook 'ruby-mode-hook 'zossima-mode)
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; ERC + Tor
(setq socks-override-functions nil)
(setq erc-server "10.40.40.40")
(setq erc-nick "Denommus")
(setq erc-server-connect-function
      'socks-open-network-stream)
(require 'socks)
(require 'erc)
(require 'erc-sasl)
(add-to-list 'erc-sasl-server-regexp-list "10\\.40\\.40\\.40")

;; Tetris
(setq tetris-score-file
      "~/.emacs.d/tetris-scores")

;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;BBDB
(add-to-list 'load-path "~/.emacs.d/plugins/bbdb-2.35/lisp")
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'mail-setup-hook 'bbdb'insinuate-sendmail)
(setq bbdb-file "~/Dropbox/bbdb")
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)

;;Org-Mode
(setq org-log-done 'time)
(setq org-agenda-include-diary t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files
      (list
       (concat org-directory "/agenda.org")
       (concat org-directory "/lpic.org")))
(setq org-mobile-inbox-for-pull (concat org-directory "/agenda.org"))
(setq org-mobile-directory (concat org-directory "/MobileOrg"))
(load "~/.emacs.d/plugins/brazilian-holidays.el")

;;Diary
(setq diary-file "~/Dropbox/diary")
(setq calendar-and-diary-frame-parameters
      '((name . "Calendar") (title . "Calendar")
        (height . 20) (width . 78)
        (minibuffer . t)))
(setq calendar-date-style "european")

;;Jabber
(setq jabber-account-list '(("yuridenommus@gmail.com"
                             (:network-server . "talk.google.com")
                             (:connection-type . ssl))))

;;Twittering Mode
(setq twittering-use-master-password t)
(setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt")
(setq twittering-icon-mode t)
(setq twittering-mode-hook
      '(lambda()
         (local-set-key (kbd "C-c p") 'twittering-goto-previous-uri)
         (local-set-key (kbd "C-c n") 'twittering-goto-next-uri)))
(setq twittering-initial-timeline-spec-string
      '(":home"
        ":replies"
        ":favorites"
        ":direct_messages"
        ":search/emacs/"))

;; Python
(setq python-command "python2")
(setq pdb-path '/usr/lib/python2.7/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
                            (file-name-nondirectory buffer-file-name)))))

;; HTML
(setq html-mode-hook
      '(lambda ()
         (local-set-key (kbd "C-c C-r") 'browse-url-of-file)))

;;After Initialize
(add-hook
 'after-init-hook
 '(lambda ()
    ;; Packages
    (lexical-let ((auto-install-packages
          '(bundler
            auctex
            yasnippet
            magit
            js2-mode
            slime
            flycheck
            csharp-mode
            dired+
            org-mime
            git-commit-mode
            gitconfig-mode
            lua-mode
            pkgbuild-mode
            ruby-block
            ruby-compilation
            rinari
            zossima
            yaml-mode
            jabber
            popup
            twittering-mode)))
      (mapcar '(lambda (pkg)
		 (unless (package-installed-p pkg)
		   (package-install pkg))) auto-install-packages))

    ;; CLisp
    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "sbcl")

    ;; Flycheck
    (add-hook 'find-file-hook 'flycheck-mode)

    ;; Ruby
    (global-rinari-mode)

    ;; Magit
    (add-hook 'dired-mode-hook
              '(lambda ()
                 (local-set-key (kbd "<f5>") 'magit-status)))

    ;; YASnippet
    (require 'yasnippet)
    (yas--initialize)
    (yas-load-directory "~/.emacs.d/snippets")))
(provide 'init)
;;; init.el ends here
