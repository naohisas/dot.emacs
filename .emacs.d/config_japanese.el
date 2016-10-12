; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; $BF|K\8l4D6-$N@_Dj(B
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 12:29:35
;;=============================================================================

(set-language-environment 'Japanese)

(cond
 (run-unix
  (set-default-coding-systems     'euc-jp-unix)
  (set-buffer-file-coding-system  'euc-jp-unix)
  (set-terminal-coding-system     'euc-jp-unix))

 (run-w32
  (set-default-coding-systems     'euc-jp-unix)
  (set-buffer-file-coding-system  'euc-jp-unix)
  (set-terminal-coding-system     'euc-jp-unix))

 (run-darwin
  (set-terminal-coding-system             'utf-8)
  (set-keyboard-coding-system             'utf-8)
  (set-buffer-file-coding-system          'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
)
