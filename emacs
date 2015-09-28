;; --------
;; packages
;; --------

(require 'package) 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 


(setq package-list '(helm
                     projectile
                     helm-projectile
                     magit
                     zenburn-theme
                     js2-mode
                     exec-path-from-shell
                     ac-js2
                     auto-complete
                     paredit
                     geiser
                     scss-mode
                     yaml-mode
                     racket-mode
                     rainbow-delimiters
                     cider
                     edts
                     go-mode
                     go-projectile
                     go-autocomplete
                     flycheck))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; -----
;; paths
;; -----

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))


;; ----
;; helm
;; ----

(require 'helm-config)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))


;; ----------
;; projectile
;; ----------

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-switch-project-action 'helm-projectile)


;; -----------
;; indentation
;; -----------

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq tab-stop-list (number-sequence 2 200 2))

(defvaralias 'css-indent-level 'tab-width)
(defvaralias 'scss-indent-level 'tab-width)
(defvaralias 'sass-indent-level 'tab-width)


;; --
;; ui
;; --

(load-theme 'zenburn t)
(global-visual-line-mode t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-linum-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(scroll-bar-mode -1)


;; ----
;; keys
;; ----

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)


;; --------
;; org-mode
;; --------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (quote ("~/org")))


;; --
;; js
;; --

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)


;; -------
;; backups
;; -------

(setq backup-directory-alist `(("." . "~/.saves")))


;; ----
;; nxml
;; ----

(mapc
 (lambda (pair)
   (if (or (eq (cdr pair) 'xml-mode)
           (eq (cdr pair) 'sgml-mode)
           (eq (cdr pair) 'html-mode))
       (setcdr pair 'nxml-mode)))
 magic-mode-alist)


;; ----
;; sass
;; ----

(require 'scss-mode)


;; --
;; go
;; --

(require 'go-mode)
(require 'go-projectile)
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-autocomplete)

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")


;; ------------
;; autocomplete
;; ------------

(require 'auto-complete-config)
(ac-config-default)


;; -------
;; rainbow
;; -------

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; -------
;; paredit
;; -------

(add-hook 'racket-mode-hook #'enable-paredit-mode)


;; ----
;; edts
;; ----

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(edts-man-root "/Users/stereohorse/.emacs.d/edts/doc/18.0"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
