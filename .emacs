; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; Emacs Configuration.
;;
;;-----------------------------------------------------------------------------
;;
;; @author Naohisa Sakamoto
;; @date   2016/10/13  1:45:50
;;=============================================================================

(defconst default-frame-width  120)
(defconst default-frame-height 35)

;; Set local variables
(setq user-full-name    "Naohisa Sakamoto")
(setq user-mail-address "naohisa.sakamoto@people.kobe-u.ac.jp")

;; Add load path
(setq load-path (cons "~/.emacs.d" load-path))
(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

(defmacro setq-local (var val )
  `(set (make-local-variable 'var) ,val))

;; Load configration files
(load "config_environment")
(load "config_japanese")
(load "config_input_method")
(load "config_backup")
(load "config_appearance")
(load "config_command")
(load "config_misc")
(load "config_font")
(load "config_application")
(load "config_auto_mode")

;; Load developing environment configuration files
(load "devel_elisp")
(load "devel_cpp")
(load "devel_cvs")
(load "devel_js")
(load "devel_web")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
