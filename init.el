;; -*- lexical-binding: t; -*-
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
 '(erc-modules (quote (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom smiley stamp track truncate)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/org/metas.org" "~/Dropbox/org/agenda.org" "~/Dropbox/org/mobile.org" "~/Dropbox/org/capture.org")))
 '(send-mail-function (quote mailclient-send-it))
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(tab-width 4)
 '(wg-emacs-exit-save-behavior nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Anonymous Pro"))))
 '(magit-item-highlight ((t (:background "black")))))

;; Misc
(setq visible-bell 1)
(add-to-list 'default-frame-alist
             '(font . "Anonymous Pro-11"))
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
(add-to-list 'load-path "~/.emacs.d/plugins/ghc-mod")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
(require 'org)
(setq make-backup-files nil)
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program (if (eq system-type 'windows-nt)
                                     "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
                                   "google-chrome-stable")
      browse-url-browser-function gnus-button-url)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(add-hook 'emacs-lisp-mode-hook #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook #'turn-on-eldoc-mode)
(setq delete-by-moving-to-trash t)
(global-auto-revert-mode 1)
(add-hook 'after-change-major-mode-hook #'(lambda ()
                                            (setq indicate-buffer-boundaries t)))
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)
(put 'dired-find-alternate-file 'disabled nil)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq-default indent-tabs-mode nil)
(add-to-list 'auto-mode-alist '("PKGBUILD" . pkgbuild-mode))
(put 'upcase-region 'disabled nil)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(defun convert-to-underscore ()
  (interactive)
  (replace-regexp "\\([A-Z]\\)" "_\\1" nil (region-beginning) (region-end))
  (downcase-region (region-beginning) (region-end)))

(global-set-key (kbd "C-x C-c")
                (lambda ()
                  (interactive)
                  (when (yes-or-no-p "Are you really sure?")
                    (call-interactively #'save-buffers-kill-emacs))))

;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(when (eq system-type 'windows-nt)
  (prefer-coding-system       'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq default-file-name-coding-system 'cp1252)
  (add-hook 'ido-minibuffer-setup-hook
            (lambda () (set-buffer-file-coding-system 'cp1252)))
  ;; From Emacs wiki
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  ;; MS Windows clipboard is UTF-16LE
  (set-clipboard-coding-system 'utf-16le-dos))

;; Emacs theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wilson t)

;;Clean up
(defun cleanup-buffer-safe ()
  (interactive)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8)
  (untabify (point-min) (point-max)))
(defun cleanup-buffer ()
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c s") 'cleanup-buffer)

;; Ruby
(add-hook 'ruby-mode-hook 'zossima-mode)
(cond ((eq system-type 'windows-nt)
       (setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;" (getenv "PATH")))
       (setq exec-path (cons "C:\\Program Files (x86)\\Git\\bin" exec-path)))
      (t
       (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
       (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))))

;; ERC + Tor
(setq socks-override-functions nil)
(setq erc-server "irc.ayr-ton.net")
(setq erc-port "1025")
(setq erc-nick "Denommus")
(setq erc-fill-function #'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-server-connect-function
      #'(lambda (name buffer host service &rest parameters)
          (let ((hosts (list "10.40.40.40" "10.40.40.41")))
            (apply
             (if (member host hosts)
                 'socks-open-network-stream
               'open-network-stream)
             (append (list name buffer host service) parameters)))))
(require 'socks)
(require 'erc)
(require 'erc-sasl)
(add-to-list 'erc-sasl-server-regexp-list "10\\.40\\.40\\.40")
(add-to-list 'erc-sasl-server-regexp-list "10\\.40\\.40\\.41")
(unless (eq system-type 'windows-nt)
  (require 'notifications)
  (defun erc-notification-notify (nickname message)
    (notifications-notify
     :title "ERC"
     :body (concat nickname ": " message)))
  (setq ercn-notify-rules
        '((current-nick . all)
          (query-buffer . all)))
  (add-hook 'ercn-notify #'erc-notification-notify))
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "##programming" "#lisp")
        ("mozilla.org" "#rust" "#rust-gamedev")))

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

;; Mail
(setq read-mail-command 'mew)
(setq mail-user-agent 'mew-user-agent)
(define-mail-user-agent
  'mew-user-agent
  'mew-user-agent-compose
  'mew-draft-send-message
  'mew-draft-kill
  'mew-send-hook)

;;Org-Mode
(setq org-log-done 'time)
(setq org-agenda-include-diary t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/capture.org"))
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile.org"))
(setq org-mobile-directory (concat org-directory "/MobileOrg"))
(load "~/.emacs.d/plugins/brazilian-holidays.el")
(add-hook 'org-mode-hook 'visual-line-mode)
(add-to-list 'load-path "~/.emacs.d/plugins/org-git-link")
(require 'org-git-link)
(setq org-export-with-toc nil)

;;Diary
(setq diary-file "~/Dropbox/diary")
(setq calendar-and-diary-frame-parameters
      '((name . "Calendar") (title . "Calendar")
        (height . 20) (width . 78)
        (minibuffer . t)))
(setq calendar-date-style "european")

;;Twittering Mode
(setq twittering-use-master-password t)
(if (eq system-type 'windows-nt)
    (setq twittering-cert-file "C:\\Program Files (x86)\\Git\\bin\\curl-ca-bundle.crt")
  (setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt"))
(setq twittering-icon-mode t)
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

;; GHC
(require 'ghc)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook #'ghc-init)

;;After Initialize
(add-hook
 'after-init-hook
 #'(lambda ()
     ;; Packages
     (let ((auto-install-packages
            '(bundler
              flycheck
              flycheck-haskell
              tuareg
              auctex
              cmake-mode
              toml-mode
              rust-mode
              ggtags
              clojure-mode
              company
              company-ghc
              company-cider
              slime-company
              cider
              ercn
              yasnippet
              magit
              magit-svn
              js2-mode
              slime
              quack
              geiser
              paredit
              csharp-mode
              dired+
              org-mime
              git-commit-mode
              gitconfig-mode
              web-mode
              lua-mode
              ruby-block
              mew
              ruby-compilation
              rinari
              zossima
              yaml-mode
              undo-tree
              popup
              show-css
              pretty-symbols
              browse-kill-ring
              haskell-mode
              projectile
              qml-mode
              workgroups2
              twittering-mode)))
       (mapc #'(lambda (pkg)
                 (unless (package-installed-p pkg)
                   (package-install pkg))) auto-install-packages))

     ;; Haskell
     (add-hook 'haskell-mode-hook #'turn-on-haskell-indent)
     (add-hook 'haskell-mode-hook #'inf-haskell-mode)
     (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
     (setenv "PATH" (concat (getenv "HOME") "/.cabal/bin:" (getenv "PATH")))
     (setq exec-path (cons (concat (getenv "HOME") "/.cabal/bin") exec-path))
     (setq haskell-program-name "cabal repl")

     ;; Flycheck
     (setq sentence-end-double-space nil)
     (global-flycheck-mode)

     ;; SLIME
     (load (expand-file-name "~/quicklisp/slime-helper.el"))
     (load (expand-file-name (if (eq system-type 'windows-nt)
                                 "~/AppData/Roaming/npm/node_modules/swank-js/slime-js.el"
                               "~/.nvm/v0.10.26/lib/node_modules/swank-js/slime-js.el")))
     (setq inferior-lisp-program
           (if (eq system-type 'windows-nt)
               "wx86cl64"
             "sbcl --noinform --no-linedit"))
     (defun custom-repl-mode-hook ()
       (define-key slime-repl-mode-map [S-up] #'windmove-up)
       (define-key slime-repl-mode-map [S-down] #'windmove-down))
     (add-hook 'slime-repl-mode-hook #'custom-repl-mode-hook)
     (add-hook 'slime-mode-hook #'(lambda () (slime-setup '(slime-indentation slime-company))))

     ;; Workgroups
     (require 'workgroups2)
     (global-set-key (kbd "C-x b") #'wg-switch-to-buffer)
     (global-unset-key (kbd "C-z"))
     (setq wg-prefix-key (kbd "C-z"))
     (global-set-key (kbd "<C-tab>") #'wg-switch-to-workgroup-right)
     (global-set-key (kbd "<C-S-tab>") #'wg-switch-to-workgroup-left)
     (global-set-key (kbd "<C-S-iso-lefttab>") #'wg-switch-to-workgroup-left)
     (setq wg-use-default-session-file nil)
     (workgroups-mode 1)

     ;; ParEdit
     (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
     (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
     (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
     (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
     (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
     (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
     (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
     (add-hook 'geiser-repl-mode-hook      #'enable-paredit-mode)
     (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
     (add-hook 'slime-repl-mode-hook #'(lambda () (paredit-mode +1)))
     (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
     (defun override-slime-repl-bindings-with-paredit ()
       (define-key slime-repl-mode-map
         (read-kbd-macro paredit-backward-delete-key) nil))
     (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

     ;; Ruby
     (global-rinari-mode)

     ;; JS2-Mode
     (require 'js2-mode)
     (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
     (require 'slime-js)
     (global-set-key (kbd "<f5>") #'slime-js-reload)
     (add-hook 'js2-mode-hook
               #'(lambda () (slime-js-minor-mode 1)))
     (add-hook 'css-mode-hook
               #'(lambda ()
                   (define-key css-mode-map (kbd "C-M-x") #'slime-js-refresh-css)
                   (define-key css-mode-map (kbd "C-c C-r") #'slime-js-embed-css)))

     ;; Pretty Symbols
     (add-to-list 'pretty-symbol-categories 'relational)
     (add-to-list 'pretty-symbol-categories 'misc)
     (add-hook 'lisp-mode-hook #'pretty-symbols-mode)
     (add-hook 'emacs-lisp-mode-hook #'pretty-symbols-mode)
     (add-hook 'c-mode-common-hook #'pretty-symbols-mode)
     (add-hook 'js2-mode-hook #'pretty-symbols-mode)

     ;; Twittering mode
     (add-hook 'twittering-mode-hook
               #'(lambda ()
                   (local-set-key (kbd "C-c p") 'twittering-goto-previous-uri)
                   (local-set-key (kbd "C-c n") 'twittering-goto-next-uri)))

     ;; YASnippet
     (require 'yasnippet)
     (yas-global-mode 1)
     (yas-load-directory "~/.emacs.d/snippets" t)

     ;; Company
     (global-company-mode 1)
     (require 'company-ghc)
     (add-to-list 'company-backends 'company-ghc)

     ;; Web Mode
     (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
     (setq web-mode-markup-indent-offset 4)

     ;; C code
     (c-add-style "qt" '("stroustrup" (indent-tabs-mode . nil) (tab-width . 4)))
     (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
     (add-hook 'c-mode-common-hook
               #'(lambda ()
                   (c-set-style "qt")
                   (subword-mode 1)))

     ;; Undo tree
     (global-undo-tree-mode 1)

     ;; Quack
     (require 'quack)

     ;; Geiser
     (require 'geiser)
     (require 'scheme)
     (define-key scheme-mode-map "\C-c\C-c"
       #'geiser-compile-definition)

     ;; Projectile
     (projectile-global-mode 1)
     (setq projectile-indexing-method 'alien)
     ;;(setq projectile-enable-caching nil)

     ;; Magit
     (add-hook 'magit-mode-hook
               #'(lambda ()
                   (require 'magit-svn)
                   (local-set-key (kbd "V") #'magit-key-mode-popup-svn)))

     ;; CMake
     (require 'cmake-mode)
     (add-to-list 'auto-mode-alist '("CMakeLists.txt" . cmake-mode))

     ;;Rust
     (add-hook 'rust-mode-hook #'subword-mode)
     (add-hook 'prog-mode-hook #'(lambda ()
                                   (when (derived-mode-p 'rust-mode)
                                     (ggtags-mode 1))))))
(provide 'init)
;;; init.el ends here
