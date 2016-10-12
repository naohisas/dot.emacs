;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
(defun kvs/c-mode-common-hook ()
  (c-set-style "stroustrup")
  (setq c++-font-lock-extra-types
        '(
          "\\<[a-z]*_type\\>" "\\<[TU]\\>"
          ;; Utility
          "DefaultAllocator"
          "AnyArray"
          "Array"
          "Character"
          ;; Matrix
          "\\<Vector[234]\\>" "\\<Vector[234][ifdb]\\>" "\\<Vector\\>"
          "\\<Matrix[34][34]\\>"
          ))

  (progn
    ;; make new font-lock for rest of kvs
    (make-face 'kvs-keywords-face)
    ;(copy-face 'bold 'kvs-keywords-face)
    (set-face-foreground 'kvs-keywords-face "ForestGreen")

    ;; Matrix
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Vector[234]\\>" . 'kvs-keywords-face)))
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Vector[234][ifdb]\\>" . 'kvs-keywords-face)))
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Vector\\>" . 'kvs-keywords-face)))
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Vector[234][ifdb]Array\\>" . 'kvs-keywords-face)))
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Vector[234][ifdb]List\\>" . 'kvs-keywords-face)))
;    (font-lock-add-keywords 'c++-mode
;                            '(("\\<Matrix[34][34]\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Matrix[34][34][ifd]\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Matrix\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<LUDecomp\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<QRDecomp\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<SVDecomp\\>" . 'kvs-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Eigen\\>" . 'kvs-keywords-face)))
    ))

(add-hook 'c-mode-common-hook 'kvs/c-mode-common-hook)