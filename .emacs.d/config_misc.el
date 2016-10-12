; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $B$=$NB>$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 13:03:43
;;=============================================================================

;; font-lock$B$r>o$K%*%s$K$9$k!#(B
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; $B%+!<%=%k$,2hLL$+$i=P$?$H$-$K0l9T$@$1%9%/%m!<%k$9$k$h$&$K$9$k!#(B
(setq scroll-conservatively 1)

;; $B:G=*9T$G(B C-n $B$7$F$b9T$,A^F~$5$l$J$$$h$&$K$9$k!#(B
(setq next-line-add-newlines nil)

;; $B%S!<%W2;$NDd;_(B
(setq visible-bell t)

;; $B!V(Byes/no$B!W$G$O$J$/!V(By/n$B!W$GEz$($k!#(B
(fset 'yes-or-no-p 'y-or-n-p)

;; $B%+%l%s%H%G%#%l%/%H%j$rJQ99$9$k!#(B
(cd "~")

;; @date$B$H$$$&9T$,$"$l$P99?7;~4V$r=q$-49$($k!#(B
(defvar my-save-buffer-hook nil)
(defun save-buffer-wrapper ()
  (interactive)
  (let ((tostr (concat "@date   " (format-time-string "%Y/%m/%d %k:%M:%S") "\n")))
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "\\@date\\([0-9/: ]*\\)?\n" nil t)
          (replace-match tostr nil t)))
    (run-hooks 'my-save-buffer-hook)
    (save-buffer)))
(global-set-key "\C-x\C-s" 'save-buffer-wrapper)

;; local valiable$B$rE,MQ$9$k$+$I$&$+J9$+$l$J$$$h$&$K$9$k!#(B(CarbonEmacs$BMQ(B)
(when run-carbon-emacs
  (add-to-list 'ignored-local-variables 'syntax))

;; command$B%-!<$K(Bmeta$B%-!<$r3d$jEv$F$k!#(B
(when run-darwin
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
)
