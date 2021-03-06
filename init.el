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


;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(setq use-package-always-ensure t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(apropos-do-all t)
 '(auto-revert-verbose nil)
 '(browse-url-generic-program "firefox")
 '(custom-safe-themes
   '("0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "869b11b64da20b6b04e9b18721e03a58e5d9f0ee3a7a91bfe7cdc2b24a828109" "58f090ea19f5bc674a5a58738dedfb1907107f4953eb0e2ed493253c49356348" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "a4f8d45297894ffdd98738551505a336a7b3096605b467da83fae00f53b13f01" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" "235dc2dd925f492667232ead701c450d5c6fce978d5676e54ef9ca6dd37f6ceb" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "7a6bc9de067a7a0aa00272812d45087eec02c3befdf2b54c291578210ce7baca" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(dired-dwim-target t)
 '(erc-ignore-list '("ihatehex" "ams"))
 '(erc-modules
   '(autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate))
 '(fci-rule-character-color "#452E2E")
 '(fci-rule-color "#383838")
 '(global-auto-revert-non-file-buffers t)
 '(inhibit-startup-screen t)
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign)
      (encrypt
       ("emb@brickabode.com" "48C50C6F1139C5160AA0DC2BC54D00BC4DF7CA7C" "BA5E552CEFA43AC9A3D9F8A3A39DBB6D000EFAFD")))
     (CMS
      (sign)
      (encrypt))))
 '(mml-secure-openpgp-encrypt-to-self t)
 '(org-agenda-files
   '("~/Dropbox/org/agenda.org" "~/Dropbox/org/brickabode.org" "~/Dropbox/org/brickabode-contacts.org"))
 '(package-selected-packages
   '(company-nixos-options nix-sandbox helm-nixos-options nixos-options nix-emacs dune csharp-mode esy-mode telega lsp-haskell org-plus-contrib use-package gnu-elpa-keyring-update dante ace-window avy biblio-core bibtex-completion caml eldoc flymake ghub git-commit haskell-mode helm helm-bibtex helm-core inf-ruby ivy js2-mode key-chord org-bullets org-gcal org-ref ox-twbs persist pfuture pkg-info popup projectile smartparens switch-window tuareg typescript-mode web-mode webpaste xref yasnippet gherkin-mode groovy-mode parsebib ox-epub magit company lsp-mode flycheck yasnippet-snippets forge biblio pcmpl-args pcmpl-git pcomplete-extension org-pomodoro helm-slime slime slime-company ox-bibtex kotlin-mode lsp-java ob-rust php-mode plantuml-mode reason-mode rjsx-mode go-mode sudoku flycheck-rust mingus magit-popup nix-buffer visual-regexp csv-mode ox ox-latex org-git-link ox-taskjuggler merlin ocp-indent exec-path-from-shell bbdb helm-bbdb monokai-alt-theme birds-of-paradise-plus-theme pdf-tools hydra helm-mu lsp-ui twittering-mode discover mastodon emojify writegood-mode go gnugo omnisharp pkgbuild-mode edit-indirect opam image+ virtualenvwrapper elfeed-org elfeed helm-company haml-mode helm-google multi-term gnuplot gnuplot-mode ht nginx-mode helm-flyspell helm-spotify-plus rust-mode bbdb-android hc-zenburn-theme idris-mode dockerfile-mode exercism scala-mode markdown-mode markdown-mode+ htmlize tronesque-theme fsharp-mode editorconfig python-django multiple-cursors nix-mode feature-mode yaml-mode undo-tree toml-mode show-css ruby-block robe qml-mode org-mime magit-svn lua-mode helm-projectile gitconfig-mode ggtags elscreen cyberpunk-theme company-ghci cmake-mode clojure-mode bundler bind-key auctex))
 '(safe-local-variable-values
   '((eval flycheck-add-next-checker 'lsp-ui 'typescript-tslint)
     (eval setq flycheck-typescript-tslint-config
           (concat dir-locals-path "WebApp/tslint.json"))
     (eval set
           (make-local-variable 'dir-locals-path)
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file ".")))
              (if
                  (stringp d)
                  d
                (car d)))))
     (org-taskjuggler-default-reports "include \"taskjuggler-default-reports.tji\"")
     (eval load-file
           (concat my-project-path "/conf/org-export-customize.el"))
     (eval set
           (make-local-variable 'my-project-path)
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file ".")))
              (if
                  (stringp d)
                  d
                (car d)))))
     (eval load-file "clocktable/org-export-customize.el")
     (eval defun org-table-time-seconds-to-string
           (secs &optional output-format)
           "Mofifies org function to truncate the seconds"
           (let*
               ((secs0
                 (abs secs))
                (res
                 (cond
                  ((eq output-format 'days)
                   (format "%.3f"
                           (/
                            (float secs0)
                            86400)))
                  ((eq output-format 'hours)
                   (format "%.2f"
                           (/
                            (float secs0)
                            3600)))
                  ((eq output-format 'minutes)
                   (format "%.1f"
                           (/
                            (float secs0)
                            60)))
                  ((eq output-format 'seconds)
                   (format "%d" secs0))
                  (t
                   (org-format-seconds "%.2h:%.2m" secs0)))))
             (if
                 (< secs 0)
                 (concat "-" res)
               res)))
     (eval add-hook 'org-export-before-parsing-hook
           (lambda
             (_)
             (org-update-all-dblocks))
           t t)
     (eval defun get-clock-files nil "Org clock table does not like relative paths."
           (mapcar
            (lambda
              (name)
              (file-truename
               (concatenate 'string "../" name ".org")))
            '("emb" "yca" "flbc" "aab" "tlewis")))
     (eval defun my-org-clocktable-notodo
           (ipos tables params)
           (setf *ipos* ipos *tables* tables *params* params)
           (cl-loop for tbl in tables for entries =
                    (nth 2 tbl)
                    do
                    (cl-loop for entry in entries for headline =
                             (nth 1 entry)
                             do
                             (setq headline
                                   (replace-regexp-in-string "TODO \\|DONE \\|NEXT \\|WAITING \\|CANCELLED \\|" "" headline))
                             do
                             (setcar
                              (nthcdr 1 entry)
                              headline)))
           (org-clocktable-write-default ipos tables params))
     (table-html-th-rows . 1)
     (org-time-clocksum-format :hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby")))
 '(socks-server '("Default server" "localhost" 9050 5))
 '(sql-mysql-login-params '(user password database server port))
 '(sql-port 3306)
 '(tab-width 4)
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   '((20 . "#C99090")
     (40 . "#D9A0A0")
     (60 . "#ECBC9C")
     (80 . "#DDCC9C")
     (100 . "#EDDCAC")
     (120 . "#FDECBC")
     (140 . "#6C8C6C")
     (160 . "#8CAC8C")
     (180 . "#9CBF9C")
     (200 . "#ACD2AC")
     (220 . "#BCE5BC")
     (240 . "#CCF8CC")
     (260 . "#A0EDF0")
     (280 . "#79ADB0")
     (300 . "#89C5C8")
     (320 . "#99DDE0")
     (340 . "#9CC7FB")
     (360 . "#E090C7")))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Anonymous Pro"))))
 '(font-lock-comment-face ((t (:foreground "#B7B7B7")))))

;; Misc
;; (require 'quelpa-use-package)
;; (quelpa-use-package-activate-advice)
(setq history-delete-duplicates t)
(setq use-package-always-ensure t)
(setq desktop-path '("~/.emacs.d/sessions"))
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq max-specpdl-size 2000) ;; Some emails break with the default value
(defun visit-emacs-config ()
  "Visits the user's Emacs' configuration."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c e") #'visit-emacs-config)
(use-package comint
  :init
  (savehist-mode 1)
  :config
  (setq comint-password-prompt-regexp
        (concat comint-password-prompt-regexp
                "\\|^\\[sudo\\]")))
(require 'esh-module)
(add-to-list 'eshell-modules-list 'eshell-tramp)
(require 'cl-lib)
(setq visible-bell 1)
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
(add-to-list 'load-path "~/.emacs.d/plugins/ob-javascript")
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "backups/"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "autosaves/") t)))
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)
(setq delete-by-moving-to-trash t)
(global-auto-revert-mode 1)
(add-hook 'after-change-major-mode-hook #'(lambda ()
                                            (setq indicate-buffer-boundaries t)))
(global-set-key (kbd "C-s-b") 'windmove-left)
(global-set-key (kbd "C-s-f") 'windmove-right)
(global-set-key (kbd "C-s-p") 'windmove-up)
(global-set-key (kbd "C-s-n") 'windmove-down)
(setq-default indent-tabs-mode nil)
(add-to-list 'auto-mode-alist '("PKGBUILD" . pkgbuild-mode))
(put 'upcase-region 'disabled nil)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(electric-indent-mode 0)

(show-paren-mode 1)
(setq select-enable-clipboard t
      select-enable-primary t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point t)

(defun convert-to-underscore ()
  "Convert the region from camelCase to underscore. Does nothing if no region is set."
  (interactive)
  (when (region-active-p)
    (let ((case-fold-search nil)
          (begin (region-beginning))
          (end (region-end)))
      (goto-char begin)
      (while (re-search-forward "[A-Z]" end t)
        (replace-match (concat "_" (downcase (match-string 0))) t)
        (goto-char begin)))
    (deactivate-mark)))

(global-set-key (kbd "C-x C-c")
                (lambda ()
                  (interactive)
                  (when (yes-or-no-p "Are you really sure?")
                    (call-interactively #'save-buffers-kill-emacs))))

(defun empty-trash (decision)
  "Empty the trash. DECISION confirms whether that's what you want."
  (interactive (list (yes-or-no-p "Really empty the trash? ")))
  (if decision
      (let ((delete-by-moving-to-trash nil))
        (cl-loop for directory in '("~/.local/share/Trash/files/"
                                    "~/.local/share/Trash/info/")
                 do (cl-loop for file in (directory-files directory)
                             with fullpath = (concat directory file)
                             unless (or (string= file ".") (string= file ".."))
                             do (if (file-directory-p fullpath)
                                    (delete-directory fullpath t)
                                  (delete-file fullpath)))))))

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

;;Clean up
(defun cleanup-buffer-safe ()
  "Set encoding, remove trailing whitespace, replace tab by spaces."
  (interactive)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8)
  (untabify (point-min) (point-max)))
(defun cleanup-buffer ()
  "As `cleanup-buffer-safe', but also indent the buffer."
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c s") 'cleanup-buffer)

(global-unset-key (kbd "C-z"))

;; Ruby
(add-hook 'ruby-mode-hook 'robe-mode)

;; ERC + Tor
(require 'erc)
(require 'erc-sasl)
(defun erc-all-kill (&optional prefix)
  "Kill all buffers in erc-mode. With PREFIX, 'kill-buffer-query-functions' is preserved."
  (interactive "P")
  (cl-flet ((kill-buffer-p (b) (with-current-buffer b (eq major-mode 'erc-mode))))
    (let* ((kill-buffer-query-functions (if prefix kill-buffer-query-functions '()))
           (killed (loop for buffer in (buffer-list)
                         when (kill-buffer-p buffer)
                         collect (buffer-name buffer)
                         and do
                         (kill-buffer buffer))))
      (message "Killed: %s buffers: %s" (length killed) killed)
      killed)))
(add-to-list 'erc-sasl-server-regexp-list
             ".*")
(setq erc-sasl-server-regexp-list '("irc\\.freenode\\.net"))
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
(defun erc-freenode ()
  "Read authinfo information for freenode."
  (interactive)
  (let* ((erc-plist (car (auth-source-search :host "irc.freenode.net")))
         (erc-server "irc.freenode.net")
         (erc-nick (plist-get erc-plist :user))
         (erc-password (funcall (plist-get erc-plist :secret))))
    (erc :server erc-server :port 6667 :nick erc-nick :password erc-password)))
(setq erc-fill-function #'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "##programming" "#lisp" "#haskell" "#ocaml" "#nixos")
        ("mozilla.org" "#rust" "#rust-gamedev")))
(load-file "~/.emacs.d/erc-better-scroll.el")
(defun erc-recenter-top-bottom (&optional arg)
  "Scrolls the cursor to bottom. ARG is the same from `recenter-top-bottom'."
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


;;BBDB
(use-package bbdb
  :config
  (bbdb-initialize 'message 'mu4e 'pgp 'anniv)
  (setq bbdb-file "~/Dropbox/bbdb.gpg")
  (setq bbdb-complete-name-full-completion t)
  (setq bbdb-completion-type 'primary-or-name)
  (setq bbdb-complete-name-allow-cycling t)
  (setq bbdb-mail-user-agent 'mu4e-user-agent)
  (setq mu4e-view-mode-hook 'bbdb-mua-auto-update)
  (setq mu4e-compose-complete-addresses nil)
  (setq bbdb-mua-pop-up t)
  (setq bbdb-mua-pop-up-window-size 5)
  (setq mu4e-view-show-addresses t))

;;Diary
(setq diary-file "~/Dropbox/diary.gpg")
(setq calendar-latitude -27.594870
      calendar-longitude -48.548219
      calendar-location-name "Florianópolis, Brazil")
(setq calendar-and-diary-frame-parameters
      '((name . "Calendar") (title . "Calendar")
        (height . 20) (width . 78)
        (minibuffer . t)))
(setq calendar-date-style "european")

;;Twittering Mode
(use-package twittering-mode
  :bind (:map twittering-mode-map
              ("C-c p" . twittering-goto-previous-uri)
              ("C-c n" . twittering-goto-next-uri))
  :init
  (setq twittering-use-master-password t)
  (if (eq system-type 'windows-nt)
      (setq twittering-cert-file "C:\\Program Files (x86)\\Git\\bin\\curl-ca-bundle.crt")
    (setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt"))
  (setq twittering-icon-mode t)
  (setq twittering-initial-timeline-spec-string
        '(":home"
          ":replies"
          ":favorites"
          ":direct_message_events"
          ":search/emacs/"))
  (setq twittering-connection-type-order
        '(wget curl urllib-http native urllib-https)))

;; Python

(use-package virtualenvwrapper
  :init
  (setq venv-location "~/.virtualenvs")
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

;; GHC
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook #'subword-mode)

(defun delete-file-and-buffer ()
  "Kill the current buffer and the file that it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;; Helm
(use-package helm
  :init
  (use-package helm-config)
  (setq helm-display-function 'helm-display-buffer-in-own-frame
        helm-display-buffer-reuse-frame t
        helm-use-undecorated-frame-option t)
  :bind
  (("C-c h" . helm-command-prefix)
   ("M-x" . helm-M-x)
   ("C-c y" . helm-show-kill-ring)
   ("C-x C-f" . helm-find-files)
   :map helm-map
   ("<tab>" . helm-execute-persistent-action)
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action))
  :config
  (helm-mode 1)
  (add-hook 'eshell-mode-hook
            #'(lambda ()
                (eshell-cmpl-initialize)
                (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
                (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
                (company-mode -1)
                (setenv "SSH_AUTH_SOCK" (concat (getenv "XDG_RUNTIME_DIR") "/gnupg/S.gpg-agent.ssh")))))

;; Switch Window
(use-package switch-window
  :bind (("C-x o" . switch-window)
         ("C-x 1" . switch-window-then-maximize)
         ("C-x 2" . switch-window-then-split-below)
         ("C-x 3" . switch-window-then-split-right)
         ("C-x 0" . switch-window-then-delete)
         ("C-x 4 d" . switch-window-then-dired)
         ("C-x 4 f" . switch-window-then-find-file)
         ("C-x 4 m" . switch-window-then-compose-mail)
         ("C-x 4 r" . switch-window-then-find-file-read-only)
         ("C-x 4 C-f" . switch-window-then-find-file)
         ("C-x 4 C-o" . switch-window-then-display-buffer)
         ("C-x 4 0" . switch-window-then-kill-buffer)))

;; Haskell
(add-hook 'haskell-mode-hook #'haskell-indentation-mode)
(use-package lsp-haskell
  :init
  (add-hook 'haskell-mode-hook #'flycheck-mode)
  (add-hook 'haskell-mode-hook #'lsp))

;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (setq sentence-end-double-space nil)
  (setq flycheck-typescript-tslint-executable "/home/yuri/.npm-global/bin/tslint")
  (use-package nix-sandbox
    :init
    (setq flycheck-command-wrapper-function
          (lambda (cmd) (let ((sandbox (nix-current-sandbox)))
                          (if sandbox
                            (apply 'nix-shell-command sandbox cmd)
                            cmd)))))

  (global-flycheck-mode))

;; SmartParens
(use-package smartparens
  :ensure hydra
  :config
  (defun enable-smartparens-mode ()
    (smartparens-mode +1)
    (smartparens-strict-mode 1))
  (use-package rjsx-mode
    :config
    (add-hook 'rjsx-mode-hook #'enable-smartparens-mode))
  (add-hook 'emacs-lisp-mode-hook       #'enable-smartparens-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-smartparens-mode)
  (add-hook 'ielm-mode-hook             #'enable-smartparens-mode)
  (add-hook 'lisp-mode-hook             #'enable-smartparens-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-smartparens-mode)
  (add-hook 'scheme-mode-hook           #'enable-smartparens-mode)
  (add-hook 'clojure-mode-hook          #'enable-smartparens-mode)
  (add-hook 'ruby-mode-hook #'enable-smartparens-mode)
  (add-hook 'slime-repl-mode-hook #'enable-smartparens-mode)
  (load-file "~/.emacs.d/smartparens.el"))

;; TypeScript-Mode
(use-package typescript-mode
  :mode
  "\\.tsx?\\'"
  :init
  (use-package lsp-mode
    :init
    (add-hook 'typescript-mode-hook #'lsp)))

;; RJSX-Mode
(use-package rjsx-mode
  :mode
  "\\.jsx?\\'"
  :init
  (use-package lsp-mode
    :init
    (add-hook 'rjsx-mode-hook #'lsp))
  :config
  (setq js2-switch-indent-offset 2)
  (setq js2-basic-offset 2)
  (setq js-indent-level 2))

;; YASnippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets" t)
  (add-hook 'term-mode-hook #'(lambda () (yas-minor-mode -1))))

;; Company
(use-package company
  :demand t
  :config
  (global-company-mode 1)
  (use-package company-ghci
    :config
    (add-to-list 'company-backends 'company-ghci))
  (use-package robe
    :config
    (add-to-list 'company-backends 'company-robe)))

;; Omnisharp
(use-package omnisharp
  :bind (:map omnisharp-mode-map
              ("C-c C-t" . omnisharp-current-type-information)
              ("C-." . omnisharp-go-to-definition)
              ("M-." . omnisharp-go-to-definition)
              ("C-," . pop-tag-mark)
              ("M-," . pop-tag-mark)
              ("C-c C-r" . omnisharp-rename)
              ("C-c C-i" . omnisharp-current-type-documentation))
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-to-list 'company-backends 'company-omnisharp))

;; Web Mode
(use-package web-mode
  :mode
  "\\.html?\\'"
  "\\.phtml\\'"
  "\\.tpl\\.php\\'"
  "\\.php\\'"
  "\\.jsp\\'"
  "\\.as[cp]x\\'"
  "\\.erb\\'"
  "\\.mustache\\'"
  "\\.djhtml\\'"
  "\\.razor\\'"
  :init
  (add-to-list 'exec-path "~/.npm-global/bin/")
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (use-package lsp-ui
    :config
    (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")
                                         ("jsx"  . "\\.ts[x]?\\'")))
    (defun lsp-js-ts-enable ()
      (lsp))
    (add-hook 'web-mode-hook #'lsp-js-ts-enable))
  (setq web-mode-enable-engine-detection t)
  (setq web-mode-markup-indent-offset 4))

;; C code
(c-add-style "qt" '("stroustrup" (indent-tabs-mode . nil) (tab-width . 4)))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (c-set-style "qt")
              (subword-mode 1)))
(use-package lsp-mode
  :init
  (add-hook 'c-mode-common-hook #'lsp)
  (use-package lsp-ui
    :init
    (setq lsp-ui-sideline-enable nil
          lsp-ui-doc-enable nil
          lsp-ui-flycheck-enable t
          lsp-ui-imenu-enable t
          lsp-ui-sideline-ignore-duplicate t)))
(setq flycheck-clang-language-standard "c++14")
(c-set-offset 'case-label '+)

;; Undo tree
(use-package undo-tree
  :demand t
  :ensure t
  :config
  (global-undo-tree-mode 1))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :bind-keymap ("C-z" . projectile-command-map)
  :init
  (require 'tramp)
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien)
  (setq projectile-mode-line "Projectile") ;; Projectile makes tramp A LOT slower becauseof the mode line
  (use-package helm-projectile
    :config
    (helm-projectile-on)))

;; Magit
(use-package magit
  :init
  (use-package magit-svn)
  :config
  (use-package forge
    :config
    (add-to-list 'forge-alist '("git.brickabode.com" "git.brickabode.com/api/v4" "git.brickabode.com" forge-gitlab-repository)))
  (defun magit-custom ()
    (local-unset-key (kbd "<C-tab>")))
  (add-hook 'magit-mode-hook #'magit-custom))

;; CMake
(use-package cmake-mode
  :mode "CMakeLists.txt")

(defun sandboxed-rust-lsp ()
  (make-local-variable 'lsp-rust-rls-command)
  (setq lsp-rust-rls-command
        (nix-shell-command (nix-current-sandbox) "rls")
        lsp-rust-rls-server-command
        (nix-shell-command (nix-current-sandbox) "rls"))
  (lsp))

;;Rust
(use-package rust-mode
  :init
  (add-hook 'rust-mode-hook #'subword-mode)
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (use-package nix-sandbox
    :init
    (use-package lsp-mode
      :init
      (add-hook 'rust-mode-hook #'sandboxed-rust-lsp))
    (use-package flycheck-rust
      :config
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))))

;; Winner
(winner-mode 1)
(global-set-key (kbd "C-c f") #'winner-redo)
(global-set-key (kbd "C-c b") #'winner-undo)

;; Emacs theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(use-package cyberpunk-theme
  :init
  (load-theme 'cyberpunk t))

;; PlantUML
(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq plantuml-exec-mode 'jar))

;;Org-Mode
(use-package org
  :ensure org-plus-contrib
  :bind
  (("C-c l" . org-store-link)
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)
   :map org-mode-map
   ("C-c h i" . helm-org-in-buffer-headings)
   ("M-n" . org-move-item-down)
   ("M-p" . org-move-item-up)
   ("C-M-n" . org-move-subtree-down)
   ("C-M-p" . org-move-subtree-up))
  :init
  (setq org-log-done 'time)
  (setq org-agenda-include-diary t)
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file (concat org-directory "/agenda.org"))

  (use-package org-bullets)
  (use-package org-gcal
    :config
    (defun setup-org-gcal ()
      (let* ((gcal-plist (car (auth-source-search :host "gcal-ba")))
             (gcal-username (plist-get gcal-plist :user))
             (gcal-secret (funcall (plist-get gcal-plist :secret))))
        (setq org-gcal-client-id gcal-username
              org-gcal-client-secret gcal-secret
              org-gcal-file-alist `(("yurialbuquerque@brickabode.com" . ,(concat org-directory "/brickabode.org"))))
        (org-gcal-fetch)))
    (add-hook 'org-agenda-mode-hook #'setup-org-gcal)
    (add-hook 'org-capture-after-finalize-hook
            (lambda ()
              (when (equal (plist-get org-capture-plist :key)
                           shared-capture-key)
                (org-gcal-post-at-point)))))

  (setq org-export-with-toc nil)
  (setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq org-confirm-babel-evaluate nil)
  (setq org-capture-templates
        `(("j" "Journal" entry (file+datetree ,(concat org-directory "/diario.org"))
           "* %?\nEntrada dia %U\n %i\n")
          ("t" "Task" entry (file+headline ,(concat org-directory "/agenda.org") "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("n" "Note" entry (file+headline ,(concat org-directory "/agenda.org") "Notes")
           "* %?\n  %i\n  %a")))
  ;; Use minted
  (setq org-latex-listings 'minted)
  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  ;; Sample minted options.
  (setq org-latex-minted-options '(("frame" "lines")
                                   ("fontsize" "\\scriptsize")
                                   ("xleftmargin" "\\parindent")
                                   ("linenos" "")))
  :config
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (add-to-list 'org-export-backends 'md)
  (use-package ox-taskjuggler
    :ensure nil
    :init
    (add-to-list 'org-export-backends 'taskjuggler))
  (use-package ox-epub
    :ensure nil
    :init
    (add-to-list 'org-export-backends 'epub))
  (require 'ox-bibtex)
  (defun deactivate-c-tab ()
    "Deactivate a key in `org-mode'."
    (local-unset-key (kbd "<C-tab>")))
  (add-hook 'org-mode-hook #'deactivate-c-tab)
  (add-hook 'org-mode-hook #'auto-fill-mode)
  (add-hook 'org-mode-hook #'org-bullets-mode)
  (add-to-list 'load-path "~/.emacs.d/plugins/org-git-link")
  (use-package writegood-mode
    :config
    (add-hook 'org-mode-hook #'(lambda () (writegood-mode 1))))
  (add-hook 'org-mode-hook #'(lambda () (flyspell-mode 1)))
  (use-package org-git-link :ensure nil)
  (require 'org-mu4e)
  (require 'org-ref)
  (require 'org-tempo)
  (require 'ob-javascript)
  (use-package ob-rust
    :ensure t
    :init
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)
       (emacs-lisp . t)
       (haskell . t)
       (lisp . t)
       (ocaml . t)
       (makefile . t)
       (calc . t)
       (gnuplot . t)
       (ditaa . t)
       (js . t)
       (javascript . t)
       (org . t)
       (ruby . t)
       (sql . t)
       (sqlite . t)
       (python . t)
       (rust . t)
       (plantuml . t))))
  (use-package ox-latex
    :ensure nil
    :config
    (add-to-list 'org-latex-packages-alist '("AUTO" "babel" t) t)
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    (add-to-list 'org-latex-classes
                 '("tccv" "\\documentclass[11pt]{tccv}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("abntex" "\\documentclass[11pt]{abntex2}"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
    (add-to-list 'org-latex-classes
                 '("iiufrgs"
                   "\\documentclass{iiufrgs}\n\\usepackage[alf,abnt-emphasize=bf]{abntex2cite}\n[DEFAULT-PACKAGES]\n[PACKAGES]\n[EXTRA]\n"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
    (setq org-latex-listings 'minted))
  (use-package ox :ensure nil))


(defun sandboxed-ocaml-lsp ()
  (make-local-variable 'lsp-ocaml-lang-server-command)
  (setq lsp-ocaml-lang-server-command
        (nix-shell-command (nix-current-sandbox) "ocaml-language-server" "--stdio"))
  (lsp))

(defun setup-refmt ()
  (make-local-variable 'refmt-command)
  (setq refmt-command
        (nix-executable-find (nix-current-sandbox) "refmt"))
  (add-hook 'before-save-hook 'refmt-before-save))

;; OCaml
(use-package tuareg
  :init
  (use-package lsp-mode
    :init
    (use-package nix-sandbox
      :init
      (mapc (lambda (x) (add-hook x #'sandboxed-ocaml-lsp))
            '(tuareg-mode-hook caml-mode-hook reason-mode-hook))
      (use-package reason-mode
        :init
        (add-hook 'reason-mode-hook #'setup-refmt)))))

(use-package dune
  :init
  (use-package smartparens
    :hook (dune-mode . enable-smartparens-mode)))

;; Elscreen
(use-package elscreen
  :demand t
  :ensure t
  :bind (("<C-tab>" . elscreen-next)
         ("<C-iso-lefttab>" . elscreen-previous))
  :init
  ;; Elscreen doesn't play well with :bind-keymap
  (setq elscreen-prefix-key (kbd "s-z"))
  :config
  (elscreen-start))

;; Slime
(use-package slime
  :init
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

;; Editor config
(use-package editorconfig
  :config
  (editorconfig-mode 1))


;; Flyspell
(use-package flyspell
  :init
  :ensure helm-flyspell
  :bind (:map flyspell-mode-map ("C-;" . helm-flyspell-correct)))

;; Plantuml
(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar"))

;; Mu4e
(require 'mu4e)
(require 'smtpmail)
(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)
(setq
   message-send-mail-function    'smtpmail-send-it
   smtpmail-stream-type          'starttls
   smtpmail-smtp-service         587
   smtpmail-default-smtp-server  "smtp.gmail.com"
   smtpmail-smtp-server          "smtp.gmail.com"
   smtpmail-local-domain         "gmail.com"
   mu4e-sent-messages-behavior   'delete
   mu4e-get-mail-command         "mbsync -a"
   mu4e-maildir "~/.Maildir"
   mu4e-headers-skip-duplicates t
   mu4e-view-show-images t
   mu4e-change-filenames-when-moving t
   mu4e-index-cleanup nil
   mu4e-index-lazy-check t
   mu4e-compose-context-policy 'always-ask)
(add-hook 'mu4e-compose-mode-hook #'(lambda () (auto-save-mode -1)))
(setq
 mu4e-update-interval 300)
(setq mu4e-msg2pdf "~/.local/bin/msg2pdf")
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq message-kill-buffer-on-exit t)
(setq mml-secure-smime-sign-with-sender t)
(setq mm-sign-option 'guided)
(setq mu4e-contexts
      `(,(make-mu4e-context
          :name "BA"
          :enter-func (lambda () (mu4e-message "Entering BA context"))
          :leave-func (lambda () (mu4e-message "Leaving BA context"))
          :match-func (lambda (msg)
                        (and
                         msg
                         (mu4e-message-contact-field-matches
                          msg :to "yurialbuquerque@brickabode.com")
                         (string-prefix-p "/ba" (mu4e-message-field msg :maildir))))
          :vars '((mu4e-trash-folder . "/ba/[Gmail]/Trash")
                  (mu4e-sent-folder . "/ba/[Gmail]/Sent Mail")
                  (mu4e-drafts-folder . "/ba/[Gmail]/Drafts")
                  (mu4e-refile-folder . "/ba/[Gmail]/All Mail")
                  (mu4e-maildir-shortcuts . (("/ba/INBOX"             . ?i)
                                             ("/ba/[Gmail]/Sent Mail" . ?s)
                                             ("/ba/[Gmail]/Trash"     . ?t)
                                             ("/ba/[Gmail]/All Mail"  . ?a)))
                  (mu4e-maildir "~/.Maildir/ba")
                  (user-mail-address . "yurialbuquerque@brickabode.com")
                  (user-full-name . "Yuri Albuquerque")
                  (smtpmail-smtp-user "yurialbuquerque@brickabode.com")
                  (mu4e-compose-signature . "Yuri Albuquerque")))
        ,(make-mu4e-context
          :name "Personal"
          :enter-func (lambda () (mu4e-message "Entering Personal context"))
          :leave-func (lambda () (mu4e-message "Leaving Personal context"))
          :match-func (lambda (msg)
                        (and
                         msg
                         (mu4e-message-contact-field-matches
                          msg :to "yuridenommus@gmail.com")
                         (string-prefix-p "/personal" (mu4e-message-field msg :maildir))))
          :vars '((mu4e-trash-folder . "/personal/[Gmail]/Lixeira")
                  (mu4e-sent-folder . "/personal/[Gmail]/E-mails enviados")
                  (mu4e-drafts-folder . "/personal/[Gmail]/Rascunhos")
                  (mu4e-refile-folder . "/personal/[Gmail]/Todos os e-mails")
                  (mu4e-maildir-shortcuts . (("/personal/INBOX"                    . ?i)
                                             ("/personal/[Gmail]/E-mails enviados" . ?e)
                                             ("/personal/[Gmail]/Lixeira"          . ?l)
                                             ("/personal/[Gmail]/Todos os e-mails" . ?t)))
                  (mu4e-maildir "~/.Maildir/personal")
                  (user-mail-address . "yuridenommus@gmail.com")
                  (user-full-name . "Yuri Albuquerque")
                  (smtpmail-smtp-user "yuridenommus@gmail.com")
                  (mu4e-compose-signature . "Yuri Albuquerque")))))
(use-package helm-mu)
(defun custom-mu4e-read-maildir (prompt maildirs predicate require-match initial-input)
  "Use helm instead of ido. PROMPT MAILDIRS PREDICATE REQUIRE-MATCH INITIAL-INPUT."
  (helm-comp-read prompt maildirs
                  :name prompt
                  :must-match t))
(setq mu4e-completing-read-function #'custom-mu4e-read-maildir)

(use-package elfeed-org
  :init
  (elfeed-org))

(use-package elfeed)

(use-package webpaste
  :ensure t
  :bind (("C-c w b" . webpaste-paste-buffer)
         ("C-c w r" . webpaste-paste-region)))

;; (use-package fsharp-mode
;;   :bind (:map fsharp-mode-map
;;               ("C-c C-t" . fsharp-ac/show-typesig-at-point)
;;               ("C-c t" . fsharp-ac/show-typesig-at-point)
;;               ("C-c C-i" . fsharp-ac/show-tooltip-at-point)
;;               ("C-c i" . fsharp-ac/show-tooltip-at-point))
;;   :init
;;   (add-hook 'fsharp-mode-hook #'subword-mode)
;;   (let ((dotnet-version (car (process-lines "dotnet" "--version"))))
;;     (setq inferior-fsharp-program (concat "dotnet /opt/dotnet/sdk/"
;;                                           dotnet-version
;;                                           "/FSharp/fsi.exe --readline-"))
;;     (setq fsharp-compiler (concat "dotnet /opt/dotnet/sdk/"
;;                                   dotnet-version
;;                                   "/FSharp/fsc.exe"))))

(use-package lsp-mode
  :bind (:map lsp-mode-map
              ("C-c C-t" . lsp-describe-thing-at-point)
              ("C-c C-r" . lsp-rename)
              ("C-c C-i" . lsp-describe-thing-at-point)
              ("C-c t" . lsp-describe-thing-at-point)
              ("C-c r" . lsp-rename)
              ("C-c i" . lsp-describe-thing-at-point)
              ("M-." . xref-find-definitions))
  :init
  (setq lsp-prefer-flymake nil)
  (use-package lsp-ui
    :init
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)))

(use-package writegood-mode
  :bind
  (("C-c g g" . writegood-grade-level)
   ("C-c g r" . writegood-reading-ease)))

(use-package emojify
  :init
  (setq emojify-emoji-styles '(unicode))
  :config
  (global-emojify-mode 1))

;; Mastodon
(use-package mastodon
  :init
  (setq mastodon-instance-url "https://masto.donte.com.br"))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("NIX_PATH"
     "MSBuildSDKsPath"
     "SSH_AUTH_SOCK"
     "ANDROID_HOME"
     "ANDROID_NDK"
     "ANDROID_NDK_HOME"
     "NDK_HOME"
     "DOTNET_ROOT"
     "DOCKER_USER"
     "GIT_SUBREPO_ROOT")))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package go-mode
  :init
  (use-package lsp-mode
    :init
    (add-hook 'go-mode-hook #'lsp)))

(use-package lsp-java)

(use-package pcmpl-args)

(use-package telega
  :config
  (add-hook 'telega-chat-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '(telega-company-emoji
                             telega-company-username
                             telega-company-hashtag)
                           (when (telega-chat-bot-p telega-chatbuf--chat)
                             '(telega-company-botcmd))))
              (company-mode 1)))
  (telega-notifications-mode 1)
  (setq telega-emoji-use-images t
        telega-use-images t
        telega-emoji-font-family "Noto Color Emoji"
        telega-user-show-avatars t
        telega-chat-show-avatars t
        telega-root-show-avatars t)
  (global-set-key (kbd "C-c t") #'telega))

(use-package switch-window)

(use-package nixos-options
  :init
  (use-package company-nixos-options
    :init
    (add-to-list 'company-backends 'company-nixos-options)))

(use-package helm-nixos-options
  :bind (("C-c n" . helm-nixos-options)))

(use-package nix-sandbox)

(use-package nix-buffer)

(provide 'init)
;;; init.el ends here
