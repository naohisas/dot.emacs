; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; Emacs lisp開発環境の設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2007/12/03 23:35:50
;;=============================================================================

;; lisp-modeでタブを使わない。
;(add-hook 'emacs-lisp-mode-hook
;          '(lambda()
;             (setq indent-tabs-mode nil)))
(setq emacs-lisp-mode-hook
      '(lambda()
         (setq indent-tabs-mode nil)))
