; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $B%3%^%s%I$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2014/01/16 15:11:02
;;=============================================================================

;; M-g $B$r(B goto-line $B$K$9$k(B
(global-set-key "\M-g" 'goto-line)

;; M-c $B$r(B compile $B$K$9$k(B
(global-set-key "\M-c" 'compile)

;; M-p $B$G(B scroll down
(define-key esc-map "p" 'scroll-down)

;; M-n $B$G(B scroll up
(define-key esc-map "n" 'scroll-up)

;; M-a $B$G(B buffer $B$N@hF,$X!#(B
(define-key esc-map "a" 'beginning-of-buffer)

;; M-e $B$G(B buffer $B$NKvHx$X!#(B
(define-key esc-map "e" 'end-of-buffer)

;; M-5 $B$G(B $BCV49(B ( M-% )
(define-key global-map "\M-5" 'query-replace-regexp)

;; M-6  $B$G(B active window $B$N9b$5$r9-$2$k!#(B
(define-key global-map "\M-6" 'enlarge-window)

;; M-] $B$G(B active window $B$NI}$r9-$2$k!#(B
(define-key global-map "\M-]" 'enlarge-window-horizontally)

;; M-[ $B$G(B active window $B$NI}$r69$a$k!#(B
(define-key global-map "\M-[" 'shrink-window-horizontally)

;; C-x ; $B$G%3%a%s%H%"%&%H!#(B
(global-set-key "\C-x;" 'comment-region)

;; C-x : $B$G%3%a%s%H%$%s!#(B
(fset 'uncomment-region "\C-u\C-[xcomment-region\C-m")
(global-set-key "\C-x:" 'uncomment-region)

;; M-Enter $B$G%U%k%9%/%j!<%sI=<((B
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
