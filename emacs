;; --------
;; Packages
;; --------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)


(setq package-list '(helm
                     helm-ag
                     projectile
                     helm-projectile
                     exec-path-from-shell
                     
                     magit
                     company

                     expand-region

                     multi-term

                     smart-mode-line
                     
                     ace-jump-mode
                     neotree
                     multiple-cursors
                     
                     rainbow-delimiters
                     cider
                     smartparens
                     clj-refactor

                     geiser
                     
                     ample-theme
                     
                     elpy

                     json-mode
                     web-mode
                     js2-mode
                     js2-refactor
                     tern
                     company-tern
                     nodejs-repl
                     emmet-mode

                     flycheck

                     w3m

                     markdown-mode

                     symon

                     go-mode

                     yaml-mode
                     
                     symon))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; -----
;; paths
;; -----

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(wakatime-python-bin "/usr/local/bin/python")
 '(wakatime-cli-path "/usr/local/bin/wakatime"))


;; --
;; ui
;; --

(add-hook 'after-init-hook
          (lambda () (load-theme 'ample-flat t)))

(global-visual-line-mode t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-linum-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(scroll-bar-mode -1)

(delete-selection-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(set-frame-parameter (selected-frame) 'alpha '(97 97))
(add-to-list 'default-frame-alist '(alpha 97 97))

(windmove-default-keybindings)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; ----
;; keys
;; ----

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)


;; navigation
(setq next-line-add-newlines t)


;; -------
;; backups
;; -------

(setq backup-directory-alist `(("." . "~/.saves")))


;; -------
;; rainbow
;; -------

(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)


;; -----------
;; smartparens
;; -----------

(smartparens-global-mode t)

(require 'smartparens-config)

(smartparens-global-mode t)

(define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)


;; ------------
;; clj-refactor
;; ------------

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)


;; -----
;; cider
;; -----

(add-hook 'cider-mode-hook #'eldoc-mode)


;; -------
;; company
;; -------

(global-company-mode)

(add-to-list 'company-backends 'company-tern)

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)


;; ----------------
;; multiple cursors
;; ----------------

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; -------
;; neotree
;; -------

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;; ----
;; elpy
;; ----

(elpy-enable)
(global-set-key (kbd "C-c z") 'pyvenv-restart-python)
(elpy-use-ipython)


;; --------
;; ace jump
;; --------

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(add-hook 'clojure-mode-hook '(lambda () (local-set-key (kbd "C-c SPC") 'ace-jump-mode)))



;; --------
;; web mode
;; --------

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-enable-current-element-highlight t)


;; ------------
;; js2 refactor
;; ------------

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'web-mode-hook #'js2-refactor-mode)


;; --------
;; js2 mode
;; --------

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;; -----------
;; nodejs-repl
;; -----------

(require 'nodejs-repl)
(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key "\C-x\C-e" 'nodejs-repl-send-last-sexp)
                            (local-set-key "\C-c\C-z" 'nodejs-repl)
                            (local-set-key "\C-c\C-k" 'nodejs-repl-send-buffer)))


;; ----
;; tern
;; ----

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))


;; -------------
;; expand region
;; -------------

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; ---------------
;; smart mode line
;; ---------------

(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)


;; ---------
;; json mode
;; ---------

(require 'json-reformat)
(json-reformat:indent 2)


;; --------
;; flycheck
;; --------

(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-temp-prefix ".flycheck")

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))


;; ------
;; eslint
;; ------

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)


;; ---
;; w3m
;; ---

(require 'w3m)

(setq browse-url-browser-function 'w3m-browse-url)


;; -----
;; symon
;; -----

(require 'symon)
(symon-mode)


;; --------
;; wakatime
;; --------

; (global-wakatime-mode)


;; -----
;; emmet
;; -----

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)


;; --------
;; markdown
;; --------

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
