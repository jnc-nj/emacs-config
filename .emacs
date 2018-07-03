;; init
(package-initialize)
(require 'package)
(setq warning-minimum-level :emergency)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq display-time-format (format-time-string "%I:%M %p"))
(setq split-height-threshold nil)
(setq org-agenda-files '("~/Documents/agendas/"))
(setq default-directory "~/.roswell/local-projects")
(delete-selection-mode 1)
(display-time-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-visual-line-mode t)
(blink-cursor-mode 0)

;; reroute to emacs-china
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("org" . "http://elpa.emacs-china.org/org/")))

;; keys
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C--") 'undo)
(global-set-key (kbd "C-=") 'redo)
(global-set-key (kbd "C-f") 'set-mark-command)

;; symbols
(defconst lisp--prettify-symbols-alist
  '(("lambda" . ?λ) (">=" . ?≥) ("<=" . ?≤)))
(add-hook 'lisp-mode-hook #'prettify-symbols-mode)

;; config
(use-package aggressive-indent
             :ensure t
             :config 
             (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
             (add-hook 'lisp-mode-hook #'aggressive-indent-mode))

(use-package all-the-icons
             :ensure t)

(use-package anzu
             :ensure t
             :bind (("C-d" . anzu-query-replace))
             :config
             (global-anzu-mode +1))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package auto-package-update
  :ensure t
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "00:00"))

(use-package beacon
             :ensure t
             :config
             (beacon-mode 1)
             (setq beacon-color "#72dfd9"))

(use-package dashboard
             :ensure t
             :config
             (dashboard-setup-startup-hook)
             (setq dashboard-banner-logo-title "あなたの愛した世界     ")
             (setq dashboard-items '((recents . 20)
                                     (bookmarks . 5)
                                     (agenda . 5))))

(use-package docker
             :ensure t 
             :config
             (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
             (setq exec-path (append exec-path '("/usr/local/bin"))))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t t)
  (enable-theme 'dracula))

(use-package elfeed
             :ensure t
             :bind (("C-x f" . elfeed))
             :config
             (setq elfeed-feeds '("http://xkcd.com/rss.xml")))

(use-package elpy
             :ensure t
             :config
             (elpy-enable))

(use-package exec-path-from-shell
             :ensure t
             :config
             (when (memq window-system '(mac ns x))
               (exec-path-from-shell-initialize)))

(use-package expand-region
             :ensure t
             :bind (("C-a" . er/expand-region)))

(use-package fancy-battery
  :ensure t
  :config
  (add-hook 'after-init-hook #'fancy-battery-mode))

(use-package flx-ido
             :ensure t
             :config
             (ido-everywhere 1)
             (flx-ido-mode 1)
             (setq ido-enable-flex-matching t)
             (setq ido-use-faces nil))

(use-package ghub
             :ensure t)

(use-package highlight-indent-guides
             :ensure t
             :config
             (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
             (setq highlight-indent-guides-method 'character))

(use-package hlinum
  :ensure t
  :config
  (hlinum-activate))

(use-package icomplete
  :ensure t
  :config
  (icomplete-mode 1))

(use-package ido
  :ensure t
  :config
  (ido-mode t))

(use-package ido-grid-mode
  :ensure t
  :config
  (ido-grid-mode 1)
  (setq ido-grid-mode-prefix-scrolls t))

(use-package linum
  :ensure t
  :config
  (setq linum-format
	(lambda (line)
	  (concat
	   (propertize (number-to-string (1- line)) 'face 'linum)
	   " ")))
  (add-hook 'prog-mode-hook 'linum-mode))

(use-package magit
  :ensure t
  :bind (("C-x m" . magit-status)))

(use-package markdown
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package neotree
  :ensure t
  :bind (("C-x SPC" . neotree-toggle)
	 ("C-c 1" . neotree-dir))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 35)) 

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 1)
  (nyan-start-animation)
  (setq nyan-wavy-trail t)
  (setq nyan-cat-face-number 3)
  (setq nyan-bar-length 24))

(use-package org
  :ensure t
  :config
  (setq org-startup-indented t)
  (setq truncate-lines t))

(use-package ox-md)

(use-package page-break-lines
  :ensure t
  :config
  (turn-on-page-break-lines-mode))

(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 1)
  (setq pangu-spacing-real-insert-separtor t))

(use-package paredit
             :ensure t
             :bind (("C-<right>" . paredit-forward)                    
                    ("C-<left>" . paredit-backward)                    
                    ("C-'" . paredit-meta-doublequote)
                    ("C-c ]" . paredit-forward-slurp-sexp)
                    ("C-c [" . paredit-backward-slurp-sexp)
                    ("C-c C-]" . paredit-forward-barf-sexp)
                    ("C-c C-[" . paredit-backward-barf-sexp)))

(use-package perspective
             :ensure t
             :config
             (persp-mode))

(use-package rainbow-delimiters
             :ensure t
             :config
             (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
             (add-hook 'comint-mode-hook 'rainbow-delimiters-mode))

(use-package restclient
  :ensure t
  :bind (("C-x r" . restclient-http-send-current)))

(use-package shell-pop
  :ensure t
  :bind (("C-t" . shell-pop)
	 :map comint-mode-map
	 ("<up>" . comint-previous-input)
	 ("<down>" . comint-next-input)))

(use-package slime
             :ensure t
             :config
             (load (expand-file-name "~/.roswell/helper.el"))
             (setq inferior-lisp-program "ros -Q -L sbcl run")
             (setq slime-contribs '(slime-fancy))             
             (load "~/.roswell/lisp/quicklisp/log4slime-setup.el")
             (global-log4slime-mode 1))

(use-package smartparens
             :ensure t
             :config
             (smartparens-global-mode t)
             (smartparens-strict-mode t)
             (sp-pair "<" ">")
             (sp-pair "（" "）")
             (sp-pair "'" nil :actions :rem)
             (sp-pair "`" nil :actions :rem))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c M-x" . execute-extended-command))
  :config
  (smex-initialize))

(use-package spaceline
             :ensure t
             :config
             (spaceline-spacemacs-theme)
             (spaceline-toggle-line-column-on))

(use-package spaceline-all-the-icons 
             :ensure t
             :config
             (spaceline-all-the-icons-theme))

(use-package ssh
             :ensure t
             :config
             (add-hook 'ssh-mode-hook
                       (lambda ()
                         (setq ssh-directory-tracking-mode t)
                         (shell-dirtrack-mode t)
                         (setq dirtrackp nil))))

(use-package symon
  :ensure t
  :config
  (setq symon-delay 1)
  (setq symon-monitors '(symon-darwin-memory-monitor
			 symon-darwin-cpu-monitor 
			 symon-darwin-network-rx-monitor
			 symon-darwin-network-tx-monitor))
  (symon-mode))

(use-package tramp
  :ensure t
  :config
  (setq tramp-default-method "ssh"))

(use-package undo-tree
  :ensure t
  :config
  (setq global-undo-tree-mode t)
  (defalias 'undo 'undo-tree-undo)
  (defalias 'redo 'undo-tree-redo))

(use-package winum
  :ensure t
  :config 
  (setq winum-auto-setup-mode-line nil)
  (winum-mode))

(use-package zoom-window
  :ensure t
  :bind (("C-z" . zoom-window-zoom))
  :config
  (setq zoom-window-mode-line-color nil))

(use-package zone
  :ensure t
  :config 
  (setq zone-programs [zone-nyan])
  (setq zone-nyan-hide-progress t)
  (zone-when-idle 1800))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#282936" "#ea51b2" "#00f769" "#ebff87" "#62d6e8" "#b45bcf" "#62d6e8" "#e9e9f4"] t)
 '(custom-safe-themes
   (quote
    ("7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "b79104a19e95f10698badb711bd4ab25565af3ffcf18fa7d3c7db4de7d759ac8" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "08f5da7e1f5064a2917af94f0dab946adfb25665b25450168ded749ec78a1145" "cde05ed51346d6925d29311fb131511115ae7612764297077ca1b61371e6b047" "c30d153e623dfe32184857790a0cad243b979e8b1104e057c4a6ffe2210856f7" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (slime highlight-indent-guides perspective caroline-theme base16-theme avk-emacs-themes undo-tree smartparens spaceline-all-the-icons spaceline winum symon ssh spaceline-config smex smartparens-config shell-pop restclient redo+ rainbow-delimiters paredit pangu-spacing ox-md nyan-mode neotree markdown magit ido-grid-mode hlinum flx-ido fancy-battery expand-region elpy elfeed dockerfile-mode docker dashboard beacon auto-package-update anzu aggressive-indent auto-complete dracula-theme use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#d3d7cf" :foreground "#2e3436" :box (:line-width -1 :style released-button))))))
