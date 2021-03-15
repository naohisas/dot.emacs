; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; アプリケーションの設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2021/03/16  0:13:44
;;=============================================================================

;;-----------------------------------------------------------------------------
;; Dirtree
;;-----------------------------------------------------------------------------
;(require 'tree-mode)
;(require 'windata)
;(require 'dirtree)
;(autoload 'dirtree "dirtree" "Add directory to tree view" t)

;;-----------------------------------------------------------------------------
;; Emacs Nav
;;-----------------------------------------------------------------------------
(require 'nav)

;;-----------------------------------------------------------------------------
;; PSVN
;;-----------------------------------------------------------------------------
(cond
 (run-unix
  (require 'psvn))
 (run-darwin
  (require 'psvn))
 (run-meadow
  (load "psvn_meadow"))
)

;;-----------------------------------------------------------------------------
;; Magit
;;-----------------------------------------------------------------------------
;(require 'magit)

;;-----------------------------------------------------------------------------
;; Direx
;;-----------------------------------------------------------------------------
;(require 'popwin)
;(setq display-buffer-function 'popwin:display-buffer)

;(require 'direx)
;(require 'direx-project)
;;(setq direx:leaf-icon "  "
;;      direx:open-icon "\&#9662; "
;;      direx:closed-icon "&#9654; ")
;(push '(direx:direx-mode :position left :width 25 :dedicated t)
;      popwin:special-display-config)

;(defun direx:jump-to-project-directory ()
;  (interactive)
;  (let ((result (ignore-errors
;                  (direx-project:jump-to-project-root-other-window)
;                  t)))
;    (unless result
;      (direx:jump-to-directory-other-window))))
;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
;;(global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root-other-window)
;;(global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root)

;;-----------------------------------------------------------------------------
;; Auto-complete
;;-----------------------------------------------------------------------------
(cond
 (run-darwin
  (require 'auto-complete)
  (global-auto-complete-mode t)))

;;-----------------------------------------------------------------------------
;; Highlight
;;-----------------------------------------------------------------------------
(load "hl-line")
(setq hl-line-face 'secondary-selection)
(global-hl-line-mode)
;(hl-line-mode t)

;;-----------------------------------------------------------------------------
;; igrep
;;-----------------------------------------------------------------------------
(autoload 'igrep "igrep"
  "*Run `grep` PROGRAM to match EXPRESSION in FILES..." t)
(autoload 'igrep-find "igrep"
  "*Run `grep` via `find`..." t)
(autoload 'igrep-visited-files "igrep"
  "*Run `grep` ... on all visited files." t)
(autoload 'dired-do-igrep "igrep"
  "*Run `grep` on the marked (or next prefix ARG) files." t)
(autoload 'dired-do-igrep-find "igrep"
  "*Run `grep` via `find` on the marked directories." t)
(autoload 'Buffer-menu-igrep "igrep"
  "*Run `grep` on the files visited in buffers marked with '>'." t)
(autoload 'igrep-insinuate "igrep"
  "Define `grep' aliases for the corresponding `igrep' commands." t)

;;-----------------------------------------------------------------------------
;; YaTeX
;;-----------------------------------------------------------------------------
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
; 漢字コードの設定
; 1 = Shift_JIS, 2 = ISO-2022-JP, 3 = EUC-JP (default:2)
(setq YaTeX-kanji-code 3)
(setq YaTeX-use-font-lock t)

;;-----------------------------------------------------------------------------
;; YaHTML
;;-----------------------------------------------------------------------------
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)

;;-----------------------------------------------------------------------------
;; Ruby
;;-----------------------------------------------------------------------------
(autoload 'ruby-mode "ruby-mode" "Ruby mode")
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist
      (append '(("^#!.*ruby" . ruby-mode)) interpreter-mode-alist))

(add-hook 'ruby-mode-hook
      '(lambda ()
         (setq tab-width 4)
         (setq indent-tabs-mode 'n)
         (setq ruby-indent-level tab-width)))

;;-----------------------------------------------------------------------------
;; Shell (Cygwin の bash を使う)
;;-----------------------------------------------------------------------------
(when run-meadow
  (require 'mw32script)
  (mw32script-init)
  (setq explicit-shell-file-name "bash")
  (setq shell-file-name "sh")
  (setq shell-command-switch "-c"))

;;-----------------------------------------------------------------------------
;; web-mode.el
;;-----------------------------------------------------------------------------
(require 'web-mode)
;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))
