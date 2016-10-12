; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $BF~NO%a%=%C%I$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 12:22:27
;;=============================================================================

(cond

 ;; UNIX$BMQ$N@_Dj(B
 (run-unix
  (setq jserver-list '("localhost"))
  ;(set-input-method 'japanese-canna)
  (set-input-method "japanese-anthy"))

 ;; Windows$BMQ$N@_Dj(B
 (run-w32
  ; IME$B$N@_Dj(B
  (mw32-ime-initialize)
  (setq default-input-method "MW32-IME")
  (setq-default mw32-ime-mode-line-state-indicator "[--]")
  (setq mw32-ime-mode-line-state-indicator-list '("[--]" "[$B$"(B]" "[--]"))
  (add-hook 'mw32-ime-on-hook
            (function (lambda () (set-cursor-height 2))))
  (add-hook 'mw32-ime-off-hook
            (function (lambda () (set-cursor-height 4))))
  ; IME $B$N(B on $B$H(B off $B$G%+!<%=%k$N?'$rJQ$($k!#(B
  (add-hook 'mw32-ime-on-hook
            (function (lambda () (set-cursor-color "brown"))))
  (add-hook 'mw32-ime-off-hook
            (function (lambda () (set-cursor-color "blue")))))

 ;; Mac OS X$BMQ$N@_Dj(B
 (run-darwin
  (setq default-input-method "MacOSX"))

)
