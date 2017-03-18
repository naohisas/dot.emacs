; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; 対応拡張子(ファイル形式)の追加とモード設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2014/06/13 11:42:44
;;=============================================================================
(setq auto-mode-alist
      (append '(("\\.h\\'"             . c++-mode)
                ("\\.v\\'"             . c++-mode)
                ("\\.fwd\\'"           . c++-mode)
                ("\\.cu\\'"            . c++-mode)
                ("\\.cuh\\'"           . c++-mode)
                ("\\.dct\\'"           . c-mode)
                ("Makefile.*\\'"       . makefile-mode)
                ("\\.def\\'"           . makefile-mode)
                ("\\.js\\'"            . js-mode)
                ("\\.tex$"             . tex-mode)
                ("\\.html\\'"          . web-mode)
                ("\\.htm\\'"           . web-mode)
                ("\\.xml\\'"           . xml-mode)
                ("\\.kvsml\\'"         . xml-mode)
                ("\\.xsl\\'"           . sgml-mode))
              auto-mode-alist))

(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
