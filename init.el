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
 '(custom-safe-themes
   (quote
    ("af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" "235dc2dd925f492667232ead701c450d5c6fce978d5676e54ef9ca6dd37f6ceb" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "7a6bc9de067a7a0aa00272812d45087eec02c3befdf2b54c291578210ce7baca" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(erc-ignore-list (quote ("ihatehex" "ams")))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/metas.org" "~/Dropbox/org/agenda.org" "~/Dropbox/org/mobile.org" "~/Dropbox/org/capture.org")))
 '(package-selected-packages
   (quote
    (tuareg rust-mode org-plus-contrib use-package yasnippet helm-bbdb bbdb-android bbdb hc-zenburn-theme php-mode ob-php slime idris-mode dockerfile-mode intero exercism scala-mode markdown-mode markdown-mode+ htmlize tronesque-theme fsharp-mode editorconfig python-django multiple-cursors nix-mode feature-mode color-theme-solarized yaml-mode web-mode undo-tree twittering-mode toml-mode smartparens show-css ruby-block robe rinari qml-mode org-mime mew magit-svn lua-mode js2-mode hydra helm-projectile gitconfig-mode ggtags elscreen dired+ cyberpunk-theme csharp-mode company-ghci cmake-mode clojure-mode bundler bind-key auctex)))
 '(safe-local-variable-values
   (quote
    ((org-taskjuggler-default-reports "include \"taskjuggler-default-reports.tji\"")
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
     (web-mode-engines-alist
      ("django" . "*\\.html\\'"))
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(socks-server (quote ("Default server" "localhost" 9050 5)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Anonymous Pro")))))

;; Misc
(setenv "SSH_AUTH_SOCK" (concat (getenv "XDG_RUNTIME_DIR") "/ssh-agent.socket"))
(require 'cl)
(setq visible-bell 1)
(add-to-list 'default-frame-alist
             '(font . "Anonymous Pro-11"))
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/erc-sasl")
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
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)
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

(setq projectile-keymap-prefix (kbd "C-z"))
(defun empty-trash (decision)
  (interactive (list (yes-or-no-p "Really empty the trash? ")))
  (if decision
      (let ((delete-by-moving-to-trash nil))
        (cl-loop for directory in '("~/.local/share/Trash/files/"
                                    "~/.local/share/Trash/info/")
                 do (cl-loop for file in (directory-files directory)
                             unless (or (string= file ".") (string= file ".."))
                             do (delete-file (concat directory file)))))))

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
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

;;BBDB
(use-package bbdb
  :config
  (progn
    (bbdb-initialize 'gnus 'message)
    (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
    (add-hook 'mail-setup-hook 'bbdb'insinuate-sendmail)
    (setq bbdb-file "~/Dropbox/bbdb.gpg")
    (setq bbdb-complete-name-full-completion t)
    (setq bbdb-completion-type 'primary-or-name)
    (setq bbdb-complete-name-allow-cycling t)))

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

(defun delete-file-and-buffer ()
  "Kills the current buffer and the file that it is visiting"
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
(add-hook 'haskell-mode-hook #'turn-on-haskell-indentation)
(use-package intero
  :config
  (add-hook 'haskell-mode-hook #'intero-mode))

;; Flycheck
(setq sentence-end-double-space nil)
(global-flycheck-mode)
;(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

;; SmartParens
(require 'smartparens-config)
(defun enable-smartparens-mode ()
  (smartparens-mode +1))
(add-hook 'js2-mode-hook #'enable-smartparens-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-smartparens-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-smartparens-mode)
(add-hook 'ielm-mode-hook             #'enable-smartparens-mode)
(add-hook 'lisp-mode-hook             #'enable-smartparens-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-smartparens-mode)
(add-hook 'scheme-mode-hook           #'enable-smartparens-mode)
(add-hook 'clojure-mode-hook          #'enable-smartparens-mode)
(add-hook 'ruby-mode-hook #'enable-smartparens-mode)
(add-hook 'slime-repl-mode-hook #'enable-smartparens-mode)
(require 'smartparens-haskell)
(load-file "~/.emacs.d/smartparens.el")

;; Ruby
(global-rinari-mode)

;; JS2-Mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

;; Twittering mode
(add-hook 'twittering-mode-hook
          #'(lambda ()
              (local-set-key (kbd "C-c p") 'twittering-goto-previous-uri)
              (local-set-key (kbd "C-c n") 'twittering-goto-next-uri)))

;; YASnippet
(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets" t)
(add-hook 'term-mode-hook #'(lambda () (yas-minor-mode -1)))

;; Company
(use-package company
  :demand t
  :ensure t
  :config
  (global-company-mode 1)
  (require 'company-ghci)
  (add-to-list 'company-backends 'company-ghci)
  (add-to-list 'company-backends 'company-robe))

;; Web Mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-enable-engine-detection t)
(setq web-mode-markup-indent-offset 4)

;; C code
(c-add-style "qt" '("stroustrup" (indent-tabs-mode . nil) (tab-width . 4)))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (c-set-style "qt")
              (subword-mode 1)))
(setq flycheck-clang-language-standard "c++14")

;; Undo tree
(use-package undo-tree
  :demand t
  :ensure t
  :config
  (global-undo-tree-mode 1))

;; Projectile
(projectile-global-mode 1)
(setq projectile-indexing-method 'alien)
(setq projectile-mode-line "Projectile") ;; Projectile makes tramp A LOT slower because of the mode line
;;(setq projectile-enable-caching nil)
(require 'helm-projectile)
(helm-projectile-on)

;; Magit
(add-hook 'magit-mode-hook
          #'(lambda ()
              (require 'magit-svn)
              (local-set-key (kbd "V") #'magit-key-mode-popup-svn)
              (local-unset-key (kbd "<C-tab>"))))
(setq magit-last-seen-setup-instructions "1.4.0")

;; CMake
(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists.txt" . cmake-mode))

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
(defadvice load-theme (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))
(load-theme 'cyberpunk t)

;;Org-Mode
(require 'org)
(add-to-list 'org-export-backends 'taskjuggler)
(require 'ox-taskjuggler)
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
                                        ;(load "~/.emacs.d/plugins/brazilian-holidays.el")
(defun deactivate-c-tab ()
  (local-unset-key (kbd "<C-tab>")))
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'deactivate-c-tab)
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
   (ditaa . t)
   (js . t)
   (org . t)
   (ruby . t)
   (php . t)))
(eval-after-load 'ox-latex
  '(add-to-list 'org-latex-packages-alist '("AUTO" "babel" t) t))
(eval-after-load 'ox-latex
  '(add-to-list 'org-latex-packages-alist '("" "minted")))
(eval-after-load 'ox-latex
  '(setq org-latex-listings 'minted))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(require 'ox)
;; Use minted
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

;; Add the shell-escape flag
(setq org-latex-pdf-process '(
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              ;; "bibtex %b"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              ))

;; Sample minted options.
(setq org-latex-minted-options '(
                                 ("frame" "lines")
                                 ("fontsize" "\\scriptsize")
                                 ("xleftmargin" "\\parindent")
                                 ("linenos" "")
                                 ))

;; OCaml
(use-package tuareg
  :config
  (when (executable-find "opam")
    (let ((opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
          (opam-bin (substring (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1)))
      (add-to-list 'exec-path opam-bin)
      (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
      (dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
        (setenv (car var) (cadr var)))

      (require 'ocp-indent)
      (require 'merlin)
      (setq merlin-command "ocamlmerlin")
      (add-hook 'tuareg-mode-hook #'merlin-mode)
      (add-hook 'caml-mode-hook #'merlin-mode))))

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

;; Mu4e
(require 'mu4e)
(require 'smtpmail)
(setq
   message-send-mail-function    'smtpmail-send-it
   smtpmail-stream-type          'starttls
   smtpmail-smtp-service         587
   smtpmail-default-smtp-server  "smtp.gmail.com"
   smtpmail-smtp-server          "smtp.gmail.com"
   smtpmail-local-domain         "gmail.com"
   mu4e-trash-folder             "/[Gmail].Trash"
   mu4e-sent-folder              "/[Gmail].Sent Mail"
   mu4e-drafts-folder            "/[Gmail].Drafts"
   mu4e-sent-messages-behavior   'delete
   mu4e-get-mail-command         "offlineimap"
   mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)
       ("/[Gmail].Trash"       . ?t)
       ("/[Gmail].All Mail"    . ?a)))
(setq message-kill-buffer-on-exit t)
(setq
   user-mail-address "yurialbuquerque@brickabode.com"
   user-full-name  "Yuri Albuquerque"
   mu4e-compose-signature
    (concat
      "Yuri Albuquerque\n"))
(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
