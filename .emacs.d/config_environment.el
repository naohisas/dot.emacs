; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; 環境を識別するための変数の定義
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 12:11:46
;;=============================================================================
;;
;; 使用例:
;;
;;   (cond
;;     (run-meadow2
;;       ;; some settings here for Meadow2
;;     )
;;     (run-xemacs
;;       ;; some settings here for XEmacs
;;     )
;;   )
;;
;;   (when run-meadow2
;;     ;; some settingd here for Meadow2
;;   )
;;=============================================================================

;; OS
(defvar run-unix
  (or (equal system-type 'gnu/linux)
      (equal system-type 'usg-unix-v)))

(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))

(defvar run-darwin
  (equal system-type 'darwin))

;; Emacs version
(defvar run-emacs20
  (and (equal emacs-major-version 20)
       (null (featurep 'xemacs))))

(defvar run-emacs21
  (and (equal emacs-major-version 21)
       (null (featurep 'xemacs))))

(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs))))

(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))

(defvar run-emacs24
  (and (equal emacs-major-version 24)
       (null (featurep 'xemacs))))

(defvar run-meadow (featurep 'meadow))

(defvar run-meadow1 (and run-meadow run-emacs20))

(defvar run-meadow2 (and run-meadow run-emacs21))

(defvar run-meadow2 (and run-meadow run-emacs22))

(defvar run-xemacs (featurep 'xemacs))

(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))

(defvar run-carbon-emacs
  (and run-darwin window-system))
