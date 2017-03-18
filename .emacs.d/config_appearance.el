; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $B308+$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2017/03/18 10:09:44
;;=============================================================================

;; $B%b!<%I%i%$%s$K%+!<%=%k$N0LCV$,2?9TL\$+$rI=<($9$k!#(B
(line-number-mode 1)

;; $B%b!<%I%i%$%s$K%+!<%=%k$N0LCV$,2?7eL\$+$rI=<($9$k!#(B
(column-number-mode 1)

;; $B%b!<%I%i%$%s$K;~9o$r(B24$B;~4V@)$GI=<($9$k!#(B
(setq display-time-24hr-format t)
(display-time)

;; $B%a%K%e!<%P!<$rI=<($7$J$$!#(B
(menu-bar-mode 0)

;; $B%D!<%k%P!<$rI=<($7$J$$!#(B
(tool-bar-mode 0)

;; $B%9%/%m!<%k%P!<$rI=<($7$J$$!#(B
(toggle-scroll-bar nil)

;; $B%G%#%l%/%H%j$r:G=i$KI=<($9$k!#(B
(add-hook 'dired-load-hook
          '(lambda ()
             (load-library "ls-lisp")
             (setq ls-lisp-dirs-first t)))

;; emacs$B>e$G2hA|$rI=<($G$-$k$h$&$K$9$k!#(B
(auto-image-file-mode)

;; $BBP1~$9$k3g8L$r%O%$%i%$%H$9$k!#(B
(show-paren-mode 1)

;; $B%j!<%8%g%s$r%O%$%i%$%H$9$k!#(B
(transient-mark-mode 1)

;; $B2hLLJ,3d;~$K2hLL30J8;z$r@^$jJV$9!#(B
(setq truncate-partial-width-windows nil)

;; $B=i4|%U%l!<%`$N?'$N@_Dj(B
(setq default-frame-alist
      (append
       (list
        '(top . 0)
        '(left . 0)
        '(foreground-color . "black")
        '(background-color . "wheat")
        '(border-color .     "black")
        '(mouse-color .      "white")
        '(cursor-color .     "black"))
       default-frame-alist))

(unless window-system
  (progn
    (set-foreground-color "black")
    (set-background-color "white")
    (set-mouse-color      "white")
    (set-cursor-color     "black")))

;; $B=i4|%U%l!<%`$NBg$-$5$N@_Dj(B
(setq default-frame-alist
      (append
       (list
        (nconc (list 'width)  default-frame-width)
;        (nconc (list 'height) default-frame-height))
        (nconc (list 'height) 32))
       default-frame-alist))

;; $B=i4|%U%l!<%`$N0LCV$N@_Dj!J2hLLCf1{$KG[CV!K(B
;(defconst frame-top-position
;  (/ (- (x-display-pixel-height) (frame-pixel-height)) 2))
;(defconst frame-left-position
;  (/ (- (x-display-pixel-width) (frame-pixel-width)) 2))

;(setq default-frame-alist
;      (append
;       (list
;        (nconc (list 'top)  frame-top-position)
;        (nconc (list 'left) frame-left-position))
;       default-frame-alist))

;; $B%b!<%I%i%$%s9T$N?'$N@_Dj(B
(set-face-foreground 'mode-line "#ffffff")
(set-face-background 'mode-line "#b40000")

;; $B%?%V(B, $BA43Q%9%Z!<%9$rI=<((B
;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "white"))) nil)
(defface my-face-b-2 '((t (:background "wheat3"))) nil)
(defface my-face-u-1 '((t (:foreground "wheat4" :underline t))) nil)
;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("$B!!(B" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; $B%?%$%H%k%P!<$KJT=8Cf$N%U%!%$%kL>$rI=<($9$k!#(B
;(setq frame-title-format "%b - Emacs")
;; frame-title $B$K(B buffer name $B$H(B system-name, emacs-version $B$r:\$;$k!#(B
;;  cf. %b: buffer name,  %f: file name
(setq frame-title-format `(" %b", " @ ",(system-name) " -- Emacs " ,emacs-version))
