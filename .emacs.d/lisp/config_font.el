; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; フォントの設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 13:00:25
;;=============================================================================

(cond

 ;; Unix用の設定
 (run-unix
  (setq default-frame-alist
        (cons '(font . "fontset-standard")
              default-frame-alist)))

 ;; Windows用の設定
 (run-w32
  (w32-add-font
   "MS Gothic 18"
   '((spec
      ((:char-spec ascii :height any)
       strict
       (w32-logfont "MS Gothic" 0 -18 400 0 nil nil nil 0 1 3 0))
      ((:char-spec ascii :height any :weight bold)
       strict
       (w32-logfont "MS Gothic" 0 -18 700 0 nil nil nil 0 1 3 0)
       ((spacing . -1)))
      ((:char-spec ascii :height any :slant italic)
       strict
       (w32-logfont "MS Gothic" 0 -18 400 0   t nil nil 0 1 3 0))
      ((:char-spec ascii :height any :weight bold :slant italic)
       strict
       (w32-logfont "MS Gothic" 0 -18 700 0   t nil nil 0 1 3 0)
       ((spacing . -1)))
      ((:char-spec japanese-jisx0208 :height any)
       strict
       (w32-logfont "MS Gothic" 0 -18 400 0 nil nil nil 128 1 3 0))
      ((:char-spec japanese-jisx0208 :height any :weight bold)
       strict
       (w32-logfont "MS Gothic" 0 -18 700 0 nil nil nil 128 1 3 0)
       ((spacing . -1)))
      ((:char-spec japanese-jisx0208 :height any :slant italic)
       strict
       (w32-logfont "MS Gothic" 0 -18 400 0   t nil nil 128 1 3 0))
      ((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
       strict
       (w32-logfont "MS Gothic" 0 -18 700 0   t nil nil 128 1 3 0)
       ((spacing . -1))))))

  (setq default-frame-alist
        (append (list
                 '(font . "MS Gothic 18") ; フォントセット
                 )
                default-frame-alist)))

 ;; MacOSX用の設定
 (run-darwin
  (set-face-attribute 'default nil
                      :family "monaco"
                      :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3))))

;  (set-fontset-font "fontset-default"
;                    'japanese-jisx0208
;                    '("ヒラギノ丸ゴ pro w4*" . "jisx0208.*"))
;  (set-fontset-font "fontset-default"
;                    'katakana-jisx0201
;                    '("ヒラギノ丸ゴ pro w4*" . "jisx0201.*"))
;  (add-to-list 'face-font-rescale-alist
;               `(,(encode-coding-string ".*ヒラギノ丸ゴ pro w4.*" 'emacs-mule) . 1.2)))

 )
