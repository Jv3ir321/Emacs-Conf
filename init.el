;; =========================
;; INICIO - OPTIMIZACION
;; =========================

(setq gc-cons-threshold (* 50 1000 1000))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore)

;; =========================
;; UI LIMPIA
;; =========================

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq visible-bell nil)

;; números de línea
(global-display-line-numbers-mode t)

;; quitar splash
(setq inhibit-startup-screen t)

;; =========================
;; PACKAGE MANAGER
;; =========================

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; instalar use-package si no existe

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
(add-to-list 'auto-mode-alist '("xmonad\\.hs\\'" . haskell-mode))
;; =========================
;; THEME KANAGAWA
;; =========================

(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))

;; =========================
;; EVIL MODE
;; =========================

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; =========================
;; COMPLETADO MODERNO
;; =========================

(use-package company
  :config
  (global-company-mode 1))

;; =========================
;; LSP PARA PROGRAMAR
;; =========================

(use-package lsp-mode
  ;;:hook (prog-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; =========================
;; ORG MODE PARA NOTAS
;; =========================

(setq org-directory "~/org")

(setq org-default-notes-file
      (concat org-directory "/notes.org"))

(setq org-startup-indented t)

(setq org-hide-emphasis-markers t)

;; =========================
;; MEJORAS GENERALES
;; =========================

(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))

(setq auto-save-default nil)

;; indentacion

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; =========================
;; TERMINAL MEJOR
;; =========================

(use-package term)

;; =========================
;; MEJOR NAVEGACION
;; =========================

(use-package which-key
  :config
  (which-key-mode))

;; =========================
;; FUENTE
;; =========================

(set-face-attribute 'default nil
                    :font "CaskaydiaCove Nerd Font"
                    :height 160)

;; =========================
;; FINAL
;; =========================

(message "Emacs listo 🚀")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company consult dashboard diff-hl doom-modeline evil-collection
             evil-nerd-commenter go-mode haskell-mode kanagawa-themes
             lsp-ui lua-mode marginalia orderless org-bullets
             projectile python-mode rust-mode tree-sitter-langs
             treemacs vertico vterm vterm-hotkey vterm-toggle web-mode
             with-editor)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
