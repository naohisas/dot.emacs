; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; 入力メソッドの設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 12:22:27
;;=============================================================================

(cond

 ;; UNIX用の設定
 (run-unix
  (setq jserver-list '("localhost"))
  ;(set-input-method 'japanese-canna)
  (set-input-method "japanese-anthy"))

 ;; Windows用の設定
 (run-w32
  ; IMEの設定
  (mw32-ime-initialize)
  (setq default-input-method "MW32-IME")
  (setq-default mw32-ime-mode-line-state-indicator "[--]")
  (setq mw32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
  (add-hook 'mw32-ime-on-hook
            (function (lambda () (set-cursor-height 2))))
  (add-hook 'mw32-ime-off-hook
            (function (lambda () (set-cursor-height 4))))
  ; IME の on と off でカーソルの色を変える。
  (add-hook 'mw32-ime-on-hook
            (function (lambda () (set-cursor-color "brown"))))
  (add-hook 'mw32-ime-off-hook
            (function (lambda () (set-cursor-color "blue")))))

 ;; Mac OS X用の設定
 (run-darwin
  (setq default-input-method "MacOSX"))

)
