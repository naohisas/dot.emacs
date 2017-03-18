;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
(mapcar (lambda (mode)
          (progn
            ;; gl.h
            (font-lock-add-keywords mode '(("\\<GL[a-z]+\\>"        . 'font-lock-type-face)))
            (font-lock-add-keywords mode '(("\\<gl[A-Z][^.(]+\\>"   . 'font-lock-function-name-face)))
            (font-lock-add-keywords mode '(("\\<GL_[A-Z0-9_]+\\>"   . 'font-lock-constant-face)))
            ;; glu.h
            (font-lock-add-keywords mode '(("\\<GLU[a-zA-Z]+\\>"    . 'font-lock-type-face)))
            (font-lock-add-keywords mode '(("\\<glu[A-Z][^.(]+\\>"  . 'font-lock-function-name-face)))
            (font-lock-add-keywords mode '(("\\<GLU_[A-Z0-9_]+\\>"  . 'font-lock-constant-face)))
            ;; glx.h
            (font-lock-add-keywords mode '(("\\<GLX[a-zA-Z]+\\>"    . 'font-lock-type-face)))
            (font-lock-add-keywords mode '(("\\<glX[A-Z][^.(]+\\>"  . 'font-lock-function-name-face)))
            (font-lock-add-keywords mode '(("\\<GLX_[A-Z0-9_]+\\>"  . 'font-lock-constant-face)))
            ;; glut.h
            (font-lock-add-keywords mode '(("\\<GLUT[a-zA-Z]+\\>"   . 'font-lock-type-face)))
            (font-lock-add-keywords mode '(("\\<glut[A-Z][^.(]+\\>" . 'font-lock-function-name-face)))
            (font-lock-add-keywords mode '(("\\<GLUT_[A-Z0-9_]+\\>" . 'font-lock-constant-face)))))
        '(c-mode c++mode))
