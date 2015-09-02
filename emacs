;; --------
;; packages
;; --------

(require 'package) 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 


(setq package-list '(helm projectile helm-projectile magit zenburn-theme))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


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

;; --
;; ui
;; --

(load-theme 'zenburn t)
(global-visual-line-mode t)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-linum-mode t)


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


;; -------
;; backups
;; -------

(setq backup-directory-alist `(("." . "~/.saves")))
