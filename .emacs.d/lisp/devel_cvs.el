;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; CVS操作の設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2009/05/19 23:37:14
;;=============================================================================

(autoload 'diff-mode "diff-mode" "Diff major mode" t)
(add-to-list 'auto-mode-alist '("\\.\\(diffs?\\|patch\\|rej\\)\\'" . diff-mode))

;; log はどのコードで書くか決めて、固定にしておかないと危険です
;; (euc-japan でも sjis でも良いんけど)
(when run-w32
  (modify-coding-system-alist 'process "cvs" '(undecided . euc-japan)))

(setq cvs-cvsroot ":pserver:naohisa@viz-code:/home/Repository/viz-server2/cvsroot")

;; I have to ssh into all the computers I connect to.  Make sure CVS_RSH is set right
;; (if (not (getenv "CVS_RSH"))
;;     (setenv "CVS_RSH" "ssh"))

;; An alist of name/cvsroot pairs
;; (defvar cvsroot-alist '(
;;                         ("host1" . ":pserver:naohisa@viz-code:/home/Repository/viz-server2/cvsroot")
;;                         ("host2" . "user@host2:/usr/local/CVS")
;;                         ("host3" . "user@host3:/home/user/cvsroot")))

;; (defun select-cvs (server)
;;   (interactive
;;    (let ((out
;;           ;;This will ask for the name of the cvs server you want, pulling the
;;           ;;names from cvsroot-alist, above.  It does completion.
;;           (completing-read "Cvs server: "
;;                            cvsroot-alist
;;                            nil
;;                            t
;;                            nil
;;                            nil
;;                            (cdr (cdr cvsroot-alist))
;;                            nil)))
;;      (list out)))
;;   ;;the variable we actualy want to set is cvs-cvsroot
;;   (setq cvs-cvsroot (cdr (assoc server cvsroot-alist))))
