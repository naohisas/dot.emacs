; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $B%P%C%/%"%C%W$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2007/07/28 23:46:58
;;=============================================================================

;; $B<+F0J]B8%U%!%$%k(B(*~)$B$N@8@.>l=j$r;XDj$9$k!#(B
(setq auto-save-list-file-prefix "~/.emacs_autosave/")

;; $B%*!<%H%;!<%V%U%!%$%k(B(#filename#)$B$r:n$i$J$$!#(B
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; $B%P%C%/%"%C%W%U%!%$%k(B(filename~)$B$r:n$i$J$$!#(B
(setq make-backup-files nil)
