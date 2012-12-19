;;;;Configuration for my Emacs
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(smtpmail-smtp-server "mail.tap4mobile.com.br")
 '(smtpmail-smtp-service 25)
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(weblogger-config-alist (quote (("default" "http://dharmaprogramming.wordpress.com/xmlrpc.php" "Denommus" "" "37139520")))))
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
(setq default-indicate-buffer-boundaries t)

;; Ruby
(add-hook 'ruby-mode-hook 'zossima-mode)

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
(setq org-directory "~/Dropbox")
(setq org-agenda-files
      (list
       "~/Dropbox/agenda.org"
       "~/Dropbox/lpic.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/agenda.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
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

;;After Initialize
(add-hook
 'after-init-hook
 '(lambda ()
    ;; Autocomplete
    (require 'auto-complete-config)
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
    (ac-config-default)

    ;; Packages
    (setq auto-install-packages
	  '(bundler
	    csharp-mode
	    dired+
	    org-mime
	    git-commit-mode
	    gitconfig-mode
	    lua-mode
	    pkgbuild-mode
	    ruby-block
	    ruby-compilation
	    zossima
	    yaml-mode
	    auto-complete
	    jabber
	    popup
	    twittering-mode
	    xml-rpc))
    (while auto-install-packages
      (unless (package-installed-p (car auto-install-packages))
	(package-install (car auto-install-packages)))
      (setq auto-install-packages (cdr auto-install-packages)))


    ;; Weblogger
    (load-file "~/.emacs.d/plugins/weblogger.el")
    (defun mah/weblogger-setup ()
      (flyspell-mode 1)
      (flyspell-buffer)
      (auto-fill-mode -1)
      (visual-line-mode 1))

    (defun mah/weblogger-publish-hook ()
      (when visual-line-mode
	(visual-line-mode -1))
      (untabify (point-min) (point-max)))
    (defun mah/weblogger-publish-end-hook ()
      (visual-line-mode 1))
    (add-hook 'weblogger-publish-entry-end-hook
	      'mah/weblogger-publish-end-hook)
    (add-hook 'weblogger-publish-entry-hook
	      'mah/weblogger-publish-hook)
    (add-hook 'weblogger-start-edit-entry-hook
	      'mah/weblogger-setup)))
