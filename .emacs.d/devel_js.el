;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; JavaScript$B3+H/4D6-$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2014/06/13 11:44:43
;;=============================================================================

(add-hook 'js-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (setq c-basic-offset 4)
            (auto-fill-mode 0)))
