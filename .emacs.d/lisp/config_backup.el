; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; バックアップの設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2007/07/28 23:46:58
;;=============================================================================

;; 自動保存ファイル(*~)の生成場所を指定する。
(setq auto-save-list-file-prefix "~/.emacs_autosave/")

;; オートセーブファイル(#filename#)を作らない。
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; バックアップファイル(filename~)を作らない。
(setq make-backup-files nil)
