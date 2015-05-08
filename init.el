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
 '(erc-ignore-list (quote ("ihatehex")))
 '(erc-modules (quote (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/org/metas.org" "~/Dropbox/org/agenda.org" "~/Dropbox/org/mobile.org" "~/Dropbox/org/capture.org")))
 '(send-mail-function (quote mailclient-send-it))
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Anonymous Pro"))))
 '(magit-item-highlight ((t (:background "black"))) t))

;; Misc
(require 'cl)
(setq visible-bell 1)
(add-to-list 'default-frame-alist
             '(font . "Anonymous Pro-11"))
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/plugins/org-ox-bbcode")
(require 'org)
(setq make-backup-files nil)
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program (if (eq system-type 'windows-nt)
                                     "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
                                   "firefox")
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
(electric-indent-mode 0)

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

(global-unset-key (kbd "C-z"))
(setq projectile-keymap-prefix (kbd "C-z"))

;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(when (eq system-type 'windows-nt)
  (prefer-coding-system       'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq default-file-name-coding-system 'cp1252)
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
(require 'erc)
(require 'erc-sasl)
(add-to-list 'erc-sasl-server-regexp-list
             ".*")
(setq erc-sasl-use-sasl t)
(setq socks-override-functions nil)
(setq erc-server-connect-function
      #'(lambda (name buffer host service &rest parameters)
          (let ((hosts (list "10.40.40.40")))
            (apply
             (if (member host hosts)
                 'socks-open-network-stream
               'open-network-stream)
             (append (list name buffer host service) parameters)))))
(require 'socks)
(setq erc-autojoin-timing 'ident)
(setq socks-override-functions nil)
(setq erc-server "irc.freenode.net")
(setq erc-nick "Denommus")
(setq erc-fill-function #'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "##programming" "#lisp" "#haskell" "#ocaml")
        ("mozilla.org" "#rust" "#rust-gamedev")))
(load-file "~/.emacs.d/erc-better-scroll.el")
(defun erc-recenter-top-bottom (&optional arg)
  (interactive "P")
  (if arg
      (recenter-top-bottom arg)
    (recenter-top-bottom -1)))
(add-hook 'erc-mode-hook
          #'(lambda ()
              (company-mode 0)
              (local-set-key (kbd "C-l") #'erc-recenter-top-bottom)))

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
(defun org-bindings ()
  (local-set-key (kbd "M-n") #'org-move-item-down)
  (local-set-key (kbd "M-p") #'org-move-item-up)
  (local-set-key (kbd "C-M-n") #'org-move-subtree-down)
  (local-set-key (kbd "C-M-p") #'org-move-subtree-up))
(add-hook 'org-mode-hook #'org-bindings)
(add-to-list 'load-path "~/.emacs.d/plugins/org-git-link")
(require 'org-git-link)
(setq org-export-with-toc nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
   (emacs-lisp . t)
   (haskell . t)
   (lisp . t)
   (ocaml . t)
   (makefile . t)
   (calc . t)
   (ditaa . t)))
(eval-after-load 'ox '(require 'ox-koma-letter))
(eval-after-load 'ox '(require 'ox-bbcode))
(eval-after-load 'ox-koma-letter
  '(progn
     (add-to-list 'org-latex-classes
                  '("letter"
                    "\\documentclass\{scrlttr2\}
     \\usepackage[english]{babel}
     \\setkomavar{frombank}{(1234)\\,567\\,890}
     \[DEFAULT-PACKAGES]
     \[PACKAGES]
     \[EXTRA]"))
     (setq org-koma-letter-default-class "letter")))
(eval-after-load 'ox-latex
  '(add-to-list 'org-latex-packages-alist '("AUTO" "babel" t) t))
(require 'ox)

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
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook #'subword-mode)

;; MPC
(add-hook 'mpc-mode-hook #'(lambda () (tool-bar-mode 1)))
(advice-add 'mpc-quit :after #'(lambda () (tool-bar-mode -1)))

;;After Initialize
(add-hook
 'after-init-hook
 #'(lambda ()
     ;; Packages
     (let ((auto-install-packages
            '(bundler
              flycheck
              flycheck-hdevtools
              helm
              helm-projectile
              tuareg
              auctex
              cmake-mode
              toml-mode
              rust-mode
              ggtags
              clojure-mode
              company
              company-ghci
              slime-company
              cider
              yasnippet
              magit
              magit-svn
              js2-mode
              jsx-mode
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
              haskell-mode
              projectile
              qml-mode
              twittering-mode)))
       (mapc #'(lambda (pkg)
                 (unless (package-installed-p pkg)
                   (package-install pkg))) auto-install-packages))

     ;; Helm
     (require 'helm)
     (require 'helm-config)
     (helm-mode 1)
     (global-unset-key (kbd "C-x c"))
     (global-set-key (kbd "C-c h") #'helm-command-prefix)
     (global-set-key (kbd "M-x") #'helm-M-x)
     (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
     (define-key helm-map (kbd "C-i") #'helm-execute-persistent-action)
     (define-key helm-map (kbd "C-z") #'helm-select-action)
     (global-set-key (kbd "C-c y") #'helm-show-kill-ring)
     (global-set-key (kbd "C-x C-f") #'helm-find-files)

     ;; Haskell
     (add-hook 'haskell-mode-hook #'turn-on-haskell-indent)
     (add-hook 'haskell-mode-hook #'interactive-haskell-mode)
     (setenv "PATH" (concat (getenv "HOME") "/.cabal/bin:" (getenv "PATH")))
     (setq exec-path (cons (concat (getenv "HOME") "/.cabal/bin") exec-path))
     (setq haskell-program-name "cabal repl")
     (setq haskell-process-type 'cabal-repl)

     ;; Flycheck
     (setq sentence-end-double-space nil)
     (global-flycheck-mode)

     ;; SLIME
     (load (expand-file-name "~/quicklisp/slime-helper.el"))
     (setq inferior-lisp-program
           (if (eq system-type 'windows-nt)
               "wx86cl64"
             "sbcl --noinform --no-linedit"))
     (defun custom-repl-mode-hook ()
       (define-key slime-repl-mode-map [S-up] #'windmove-up)
       (define-key slime-repl-mode-map [S-down] #'windmove-down))
     (add-hook 'slime-repl-mode-hook #'custom-repl-mode-hook)
     (add-hook 'slime-mode-hook #'(lambda () (slime-setup '(slime-indentation slime-company))))

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
     (global-set-key (kbd "<f5>") #'slime-js-reload)


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
     (require 'company-ghci)
     (add-to-list 'company-backends 'company-ghci)

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

     ;; JSX Mode
     (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

     ;; C code
     (c-add-style "qt" '("stroustrup" (indent-tabs-mode . nil) (tab-width . 4)))
     (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
     (add-hook 'c-mode-common-hook
               #'(lambda ()
                   (c-set-style "qt")
                   (subword-mode 1)))
     (setq flycheck-clang-language-standard "c++14")

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
     (require 'helm-projectile)
     (helm-projectile-on)

     ;; Magit
     (add-hook 'magit-mode-hook
               #'(lambda ()
                   (require 'magit-svn)
                   (local-set-key (kbd "V") #'magit-key-mode-popup-svn)))

     ;; CMake
     (require 'cmake-mode)
     (add-to-list 'auto-mode-alist '("CMakeLists.txt" . cmake-mode))

     ;; OCaml
     (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
     (setq opam-bin (substring (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1))
     (setq ocp-indent-path (concat opam-bin "/ocp-indent"))
     (setq merlin-command (concat opam-bin "/ocamlmerlin"))
     (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
     (require 'ocp-indent)
     (require 'merlin)
     (add-hook 'tuareg-mode-hook #'merlin-mode)
     (add-to-list 'company-backends 'merlin-company-backend)

     ;;Rust
     (add-hook 'rust-mode-hook #'subword-mode)
     (add-hook 'prog-mode-hook #'(lambda ()
                                   (when (derived-mode-p 'rust-mode)
                                     (ggtags-mode 1))))))
(provide 'init)
;;; init.el ends here
