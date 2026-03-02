;; =========================
;; INICIO - OPTIMIZACION
;; =========================

(setq gc-cons-threshold (* 50 1000 1000))
(setq inhibit-startup-message t) 
(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
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

;; Rust moderno con tree-sitter
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(use-package lsp-mode
  :hook (rust-ts-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; =========================
;; THEME KANAGAWA
;; =========================

(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))
;; =========================
;; TAB-LINE ESTILO KANAGAWA
;; =========================

(global-tab-line-mode 0)

(setq tab-line-close-button-show nil)
(setq tab-line-new-button-show nil)
(setq tab-line-separator "  ")

;; colores estilo kanagawa-wave
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-line ((t (:background "#1f1f28" :foreground "#727169" :box nil))))
 '(tab-line-tab ((t (:background "#2a2a37" :foreground "#c8c093" :box (:line-width 6 :color "#2a2a37")))))
 '(tab-line-tab-current ((t (:background "#363646" :foreground "#e6c384" :box (:line-width 6 :color "#363646") :weight bold))))
 '(tab-line-tab-inactive ((t (:background "#1f1f28" :foreground "#727169" :box (:line-width 6 :color "#1f1f28"))))))
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
;; TOGGLE TAB-LINE
;; =========================

(defun my/toggle-tabs ()
  (interactive)
  (if global-tab-line-mode
      (progn
        (global-tab-line-mode -1)
        (message "Tabs OFF"))
    (global-tab-line-mode 1)
    (message "Tabs ON")))

;; Keybind global
(global-set-key (kbd "C-c t") #'my/toggle-tabs)

;; Keybind en modo normal (Evil)
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd "<leader>tt") #'my/toggle-tabs))
;; =========================
;; COMPLETADO MODERNO
;; =========================

(use-package company
  :config
  (global-company-mode 1))

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (display-line-numbers-mode -1)))
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

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60) ; dónde aparece el gráfico

(setq org-directory "~/org")

(setq org-agenda-files '("~/org/agenda/"))

(setq org-default-notes-file
      (concat org-directory "/todo.org"))

(setq org-startup-indented t)

(setq org-hide-emphasis-markers t)

(setq org-log-into-drawer t)

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(setq org-todo-keywords
      '((sequence "☐ TODO(t)" "☑ DONE(d)")))
; =========================
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
                    :height 140)

;; =========================
;; FINAL
;; =========================

(message "Emacs listo 🚀")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))

