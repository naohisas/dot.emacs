; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; Emacs lisp$B3+H/4D6-$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2007/12/03 23:35:50
;;=============================================================================

;; lisp-mode$B$G%?%V$r;H$o$J$$!#(B
;(add-hook 'emacs-lisp-mode-hook
;          '(lambda()
;             (setq indent-tabs-mode nil)))
(setq emacs-lisp-mode-hook
      '(lambda()
         (setq indent-tabs-mode nil)))
