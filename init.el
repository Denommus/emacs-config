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
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

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
 '(custom-safe-themes
   (quote
    ("eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "869b11b64da20b6b04e9b18721e03a58e5d9f0ee3a7a91bfe7cdc2b24a828109" "58f090ea19f5bc674a5a58738dedfb1907107f4953eb0e2ed493253c49356348" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "a4f8d45297894ffdd98738551505a336a7b3096605b467da83fae00f53b13f01" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" "235dc2dd925f492667232ead701c450d5c6fce978d5676e54ef9ca6dd37f6ceb" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "7a6bc9de067a7a0aa00272812d45087eec02c3befdf2b54c291578210ce7baca" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(dired-dwim-target t)
 '(erc-ignore-list (quote ("ihatehex" "ams")))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate)))
 '(fci-rule-character-color "#452E2E")
 '(fci-rule-color "#383838")
 '(global-auto-revert-non-file-buffers t)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/org/agenda.org")))
 '(package-selected-packages
   (quote
    (bbdb helm-bbdb monokai-alt-theme birds-of-paradise-plus-theme web-mode php-mode pdf-tools hydra org-plus-contrib helm-mu lsp-ui reason-mode tuareg twittering-mode yasnippet discover mastodon emojify writegood-mode webpaste switch-window go gnugo omnisharp pkgbuild-mode edit-indirect rjsx-mode lsp-javascript-typescript opam image+ lsp-haskell virtualenvwrapper lsp-ocaml elfeed-org elfeed helm-company haml-mode helm-google multi-term gnuplot gnuplot-mode org-bullets ht plantuml-mode nginx-mode helm-flyspell helm-spotify-plus rust-mode use-package bbdb-android hc-zenburn-theme slime idris-mode dockerfile-mode exercism scala-mode markdown-mode markdown-mode+ htmlize tronesque-theme fsharp-mode editorconfig python-django multiple-cursors nix-mode feature-mode color-theme-solarized yaml-mode undo-tree toml-mode smartparens show-css ruby-block robe qml-mode org-mime magit-svn lua-mode helm-projectile gitconfig-mode ggtags elscreen cyberpunk-theme csharp-mode company-ghci cmake-mode clojure-mode bundler bind-key auctex)))
 '(safe-local-variable-values
   (quote
    ((eval flycheck-add-next-checker
           (quote lsp-ui)
           (quote typescript-tslint))
     (eval setq flycheck-typescript-tslint-config
           (concat dir-locals-path "WebApp/tslint.json"))
     (eval set
           (make-local-variable
            (quote dir-locals-path))
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
           (make-local-variable
            (quote my-project-path))
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
                  ((eq output-format
                       (quote days))
                   (format "%.3f"
                           (/
                            (float secs0)
                            86400)))
                  ((eq output-format
                       (quote hours))
                   (format "%.2f"
                           (/
                            (float secs0)
                            3600)))
                  ((eq output-format
                       (quote minutes))
                   (format "%.1f"
                           (/
                            (float secs0)
                            60)))
                  ((eq output-format
                       (quote seconds))
                   (format "%d" secs0))
                  (t
                   (org-format-seconds "%.2h:%.2m" secs0)))))
             (if
                 (< secs 0)
                 (concat "-" res)
               res)))
     (eval add-hook
           (quote org-export-before-parsing-hook)
           (lambda
             (_)
             (org-update-all-dblocks))
           t t)
     (eval defun get-clock-files nil "Org clock table does not like relative paths."
           (mapcar
            (lambda
              (name)
              (file-truename
               (concatenate
                (quote string)
                "../" name ".org")))
            (quote
             ("emb" "yca" "flbc" "aab" "tlewis"))))
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
     (ruby-compilation-executable . "jruby"))))
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(sql-mysql-login-params (quote (user password database server port)))
 '(sql-port 3306)
 '(tab-width 4)
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   (quote
    ((20 . "#C99090")
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
     (360 . "#E090C7"))))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Fira Code"))))
 '(font-lock-comment-face ((t (:foreground "#B7B7B7")))))

;; Misc
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
(setenv "SSH_AUTH_SOCK" (concat (getenv "XDG_RUNTIME_DIR") "/gnupg/S.gpg-agent.ssh"))
(require 'cl-lib)
(setq visible-bell 1)
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
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
  "Convert camel case to underscore."
  (interactive)
  (replace-regexp "\\([A-Z]\\)" "_\\1" nil (region-beginning) (region-end))
  (downcase-region (region-beginning) (region-end)))

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

;; Ruby
(add-hook 'ruby-mode-hook 'robe-mode)
(cond ((eq system-type 'windows-nt)
       (setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;" (getenv "PATH")))
       (setq exec-path (cons "C:\\Program Files (x86)\\Git\\bin" exec-path)))
      (t
       (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
       (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))))

;; ERC + Tor
(require 'erc)
(require 'erc-sasl)
(defun erc-all-kill (&optional prefix)
  "Kill all buffers in erc-mode. With PREFIX, 'kill-buffer-query-functions' is preserved."
  (interactive "P")
  (flet ((kill-buffer-p (b) (with-current-buffer b (eq major-mode 'erc-mode))))
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
  (let ((erc-plist (car (auth-source-search :host "irc.freenode.net"))))
    (setq erc-server "irc.freenode.net")
    (setq erc-nick (plist-get erc-plist :user))
    (setq erc-password (funcall (plist-get erc-plist :secret)))
    (erc :server erc-server :port 6667 :nick erc-nick :password erc-password)))
(setq erc-fill-function #'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "##programming" "#lisp" "#haskell" "#ocaml")
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
          ":direct_messages"
          ":search/emacs/"))
  (setq twittering-connection-type-order
        '(wget curl urllib-http native urllib-https))
  :config
  (add-hook 'twittering-mode-hook
          #'(lambda ()
              (local-set-key (kbd "C-c p") 'twittering-goto-previous-uri)
              (local-set-key (kbd "C-c n") 'twittering-goto-next-uri))))

;; Python
(setq python-command "python2")
(setq pdb-path '/usr/lib/python2.7/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
                            (file-name-nondirectory buffer-file-name)))))

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

;; MPC
(add-hook 'mpc-mode-hook #'(lambda () (tool-bar-mode 1)))
(advice-add 'mpc-quit :after #'(lambda () (tool-bar-mode -1)))

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
   ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1)
  (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") #'helm-select-action)
  (add-hook 'eshell-mode-hook
            #'(lambda ()
                (eshell-cmpl-initialize)
                (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
                (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
                (company-mode -1))))

;; Switch Window
(use-package switch-window
  :config
  (global-set-key (kbd "C-x o") #'switch-window)
  (global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
  (global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
  (global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
  (global-set-key (kbd "C-x 0") 'switch-window-then-delete)

  (global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
  (global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
  (global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
  (global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)

  (global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
  (global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)

  (global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer))

;; Haskell
(add-hook 'haskell-mode-hook #'haskell-indentation-mode)
(use-package lsp-haskell
  :init
  (add-to-list 'exec-path "~/.local/bin")
  (use-package lsp-mode
    :init
    (add-hook 'haskell-mode-hook #'lsp-haskell-enable)))

;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (setq sentence-end-double-space nil)
  (setq flycheck-typescript-tslint-executable "/home/yuri/.npm-global/bin/tslint")
  (global-flycheck-mode))

;; SmartParens
(use-package smartparens
  :init
  (use-package smartparens-config)
  (use-package smartparens-haskell)
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

;; PDFView mode
(use-package pdf-tools
  :config
  (use-package pdf-view-mode
    :mode
    "\\.pdf\\'"))

;; RJSX-Mode
(use-package rjsx-mode
  :mode
  "\\.jsx?\\'"
  :init
  (use-package lsp-javascript-typescript
    :config
    (add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable))
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
  :ensure t
  :config
  (global-company-mode 1)
  (require 'company-ghci)
  (add-to-list 'company-backends 'company-ghci)
  (add-to-list 'company-backends 'company-robe))

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
  "\\.tsx?\\'"
  "\\.jsx?\\'"
  :init
  (add-to-list 'exec-path "~/.npm-global/bin/")
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (use-package lsp-ui
    :config
    (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")
                                         ("jsx"  . "\\.ts[x]?\\'")))
    (defun lsp-js-ts-enable ()
      (if (string= web-mode-content-type "jsx")
          (progn
            (lsp-javascript-typescript-enable)
            (flycheck-add-next-checker 'lsp-ui 'typescript-tslint))))
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
  :init
  (setq projectile-keymap-prefix (kbd "C-z"))
  :config
  (projectile-global-mode 1)
  (setq projectile-indexing-method 'alien)
  (setq projectile-mode-line "Projectile") ;; Projectile makes tramp A LOT slower because of the mode line
  (use-package helm-projectile
    :config
    (helm-projectile-on)))

;; Magit
(use-package magit
  :init
  (require 'magit-svn)
  :config
  (defun magit-custom ()
    (local-unset-key (kbd "<C-tab>")))
  (add-hook 'magit-mode-hook #'magit-custom))

;; CMake
(use-package cmake-mode
  :mode "CMakeLists.txt")

;;Rust
(add-hook 'rust-mode-hook #'subword-mode)
(add-hook 'prog-mode-hook #'(lambda ()
                              (when (derived-mode-p 'rust-mode)
                                (ggtags-mode 1))))

;; Winner
(winner-mode 1)
(global-set-key (kbd "C-c f") #'winner-redo)
(global-set-key (kbd "C-c b") #'winner-undo)

;; Emacs theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai-alt t)

;;Org-Mode
(use-package org
  :bind
  (("C-c l" . org-store-link)
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb))
  :init
  (setq org-log-done 'time)
  (setq org-agenda-include-diary t)
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file (concat org-directory "/agenda.org"))
  (setq org-export-with-toc nil)
  (setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")
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
  (use-package ox-taskjuggler
    :init
    (add-to-list 'org-export-backends 'taskjuggler))
  (defun deactivate-c-tab ()
    "Deactivate a key in `org-mode'."
    (local-unset-key (kbd "<C-tab>")))
  (defun org-bindings ()
    "Defines `org-mode' custom bindings."
    (local-set-key (kbd "M-n") #'org-move-item-down)
    (local-set-key (kbd "M-p") #'org-move-item-up)
    (local-set-key (kbd "C-M-n") #'org-move-subtree-down)
    (local-set-key (kbd "C-M-p") #'org-move-subtree-up))
  (add-hook 'org-mode-hook #'deactivate-c-tab)
  (add-hook 'org-mode-hook #'auto-fill-mode)
  (add-hook 'org-mode-hook #'org-bindings)
  (add-hook 'org-mode-hook #'org-bullets-mode)
  (add-to-list 'load-path "~/.emacs.d/plugins/org-git-link")
  (use-package writegood-mode
    :config
    (add-hook 'org-mode-hook #'(lambda () (writegood-mode 1))))
  (add-hook 'org-mode-hook #'(lambda () (flyspell-mode 1)))
  (use-package org-git-link)
  (require 'org-mu4e)
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
     (org . t)
     (ruby . t)
     (sql . t)
     (sqlite . t)
     (python .)
     (plantuml . t)))
  (use-package ox-latex
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
                   ("\\part{%s}" . "\\part*{%s}")
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
    (setq org-latex-listings 'minted))
  (use-package ox))


;; OCaml
(use-package tuareg
  :init
  (use-package lsp-mode
    :init
    (use-package lsp-ocaml
      :init
      (add-hook 'tuareg-mode-hook #'lsp-ocaml-enable)
      (add-hook 'caml-mode-hook #'lsp-ocaml-enable)
      (add-hook 'reason-mode-hook #'lsp-ocaml-enable)))
  (when (executable-find "opam")
    (let ((opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
          (opam-bin (substring (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1)))
      (add-to-list 'exec-path opam-bin)
      (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
      (dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
        (setenv (car var) (cadr var)))

      (use-package ocp-indent)
      (use-package merlin
        :init
        (use-package reason-mode
          :init
          (defun shell-cmd (cmd)
            "Returns the stdout output of a shell command or nil if the command returned
   an error"
            (car (ignore-errors (apply 'process-lines (split-string cmd)))))

          (let ((refmt-bin (shell-cmd "which refmt")))
            (when refmt-bin
              (setq refmt-command refmt-bin)))
          (add-hook 'reason-mode-hook #'(lambda ()
                                          (add-hook 'before-save-hook 'refmt-before-save)
                                          (merlin-mode))))

        (setq merlin-command "ocamlmerlin")
        (add-hook 'tuareg-mode-hook #'merlin-mode)
        (add-hook 'caml-mode-hook #'merlin-mode)))))

;; Elscreen
(use-package elscreen
  :demand t
  :ensure t
  :bind (("<C-tab>" . elscreen-next)
         ("<C-iso-lefttab>" . elscreen-previous))
  :init
  (setq elscreen-prefix-key (kbd "s-z"))
  :config
  (elscreen-start))

;; Slime
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Editor config
(use-package editorconfig
  :config
  (editorconfig-mode 1))


;; Flyspell
(use-package helm-flyspell
  :config
  (define-key flyspell-mode-map (kbd "C-;") #'helm-flyspell-correct))

;; Plantuml
(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/opt/plantuml/plantuml.jar"))

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
   mu4e-compose-context-policy 'always-ask)
(setq
 ;; Using the default values here because they play nicer with Gmail
 mu4e-index-cleanup t
 mu4e-index-lazy-check nil
 mu4e-update-interval 300)
(setq mu4e-msg2pdf "~/.local/bin/msg2pdf")
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq message-kill-buffer-on-exit t)
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
                  (mu4e-maildir-shortcuts . (("/ba/INBOX"             . ?i)
                                             ("/ba/[Gmail]/Sent Mail" . ?s)
                                             ("/ba/[Gmail]/Trash"     . ?t)
                                             ("/ba/[Gmail]/All Mail"  . ?a)))
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

(use-package webpaste
  :ensure t
  :bind (("C-c w b" . webpaste-paste-buffer)
         ("C-c w r" . webpaste-paste-region)))

(use-package fsharp-mode)

(use-package lsp-mode
  :bind (("C-c C-t" . lsp-info-under-point)
         ("C-c C-r" . lsp-rename)
         ("C-c C-i" . lsp-info-under-point)
         ("C-c t" . lsp-info-under-point)
         ("C-c r" . lsp-rename)
         ("C-c i" . lsp-info-under-point))
  :init
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

(provide 'init)
;;; init.el ends here
