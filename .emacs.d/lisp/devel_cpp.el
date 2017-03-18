;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; C/C++開発環境の設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2009/07/07  8:04:41
;;=============================================================================

(setq c-mode-hook
      '(lambda ()
         (c-set-style "stroustrup")
         (setq c-basic-offset 4)
         (setq indent-tabs-mode nil)
         (auto-fill-mode 0)))

(setq c++-mode-hook
      '(lambda ()
         (c-set-style "stroustrup")
         (c-set-offset 'innamespace 0)
         (c-set-offset 'inline-open 0)
         (setq c-basic-offset 4)
         (setq indent-tabs-mode nil)
         (auto-fill-mode 0)))

;; Makeコマンドの設定
(setq compilation-window-height 10)
(setq compile-command "make ")

;; font-lock設定の追加
(load "font-lock-qt.el")
(load "font-lock-kvs.el")
(load "font-lock-opengl.el")
(load "c-comment-style")
