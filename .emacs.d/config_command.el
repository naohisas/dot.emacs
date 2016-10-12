; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; コマンドの設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2014/01/16 15:11:02
;;=============================================================================

;; M-g を goto-line にする
(global-set-key "\M-g" 'goto-line)

;; M-c を compile にする
(global-set-key "\M-c" 'compile)

;; M-p で scroll down
(define-key esc-map "p" 'scroll-down)

;; M-n で scroll up
(define-key esc-map "n" 'scroll-up)

;; M-a で buffer の先頭へ。
(define-key esc-map "a" 'beginning-of-buffer)

;; M-e で buffer の末尾へ。
(define-key esc-map "e" 'end-of-buffer)

;; M-5 で 置換 ( M-% )
(define-key global-map "\M-5" 'query-replace-regexp)

;; M-6  で active window の高さを広げる。
(define-key global-map "\M-6" 'enlarge-window)

;; M-] で active window の幅を広げる。
(define-key global-map "\M-]" 'enlarge-window-horizontally)

;; M-[ で active window の幅を狭める。
(define-key global-map "\M-[" 'shrink-window-horizontally)

;; C-x ; でコメントアウト。
(global-set-key "\C-x;" 'comment-region)

;; C-x : でコメントイン。
(fset 'uncomment-region "\C-u\C-[xcomment-region\C-m")
(global-set-key "\C-x:" 'uncomment-region)

;; M-Enter でフルスクリーン表示
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
      (if (equal 'fullboth current-value)
        (if (boundp 'old-fullscreen) old-fullscreen nil)
        (progn (setq old-fullscreen current-value)
          'fullboth)))))
;(setq ns-use-native-fullscreen nil)
;(global-set-key [(meta return)] 'ns-toggle-fullscreen)
;(defun toggle-fullscreen ()
;  (interactive)
;  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
;                                           nil
;                                         'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)
