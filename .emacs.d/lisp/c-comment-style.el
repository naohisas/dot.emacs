; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; C/C++ comment.
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2010/08/19 20:25:34
;;=============================================================================

;;-----------------------------------------------------------------------------
;; file comment
;;-----------------------------------------------------------------------------
(defun insert-src-file-comment()
  (interactive "*")
  (let ((file-name (if (buffer-file-name)
                       (file-name-nondirectory (buffer-file-name))
                     "untitled"))
        (user-name (user-full-name)))
    (insert
     (format
      (concat
       "/*****************************************************************************/\n"
       "/**\n"
       " *  @file   %s\n"
       " *  @author %s\n"
       " *  @brief  \n"
       " */\n"
       "/*----------------------------------------------------------------------------\n"
       " *\n"
       " *  Copyright (c) Visualization Laboratory, Kyoto University.\n"
       " *  All rights reserved.\n"
       " *  See http://www.viz.media.kyoto-u.ac.jp/kvs/copyright/ for details.\n"
       " *\n"
       " *  $Id$\n"
       " */\n"
       "/*****************************************************************************/\n"
       ) file-name user-name)) ))

;;-----------------------------------------------------------------------------
;; struct comment
;;-----------------------------------------------------------------------------
(defun insert-src-struct-comment()
  (interactive "*")
  (insert
   (format
    (concat
     "/*===========================================================================*/\n"
     "/**\n"
;     " *  @struct \n"
     " *  @brief  \n"
     " */\n"
     "/*===========================================================================*/\n"
     ))))

;;-----------------------------------------------------------------------------
;; class comment
;;-----------------------------------------------------------------------------
(defun insert-src-class-comment()
  (interactive "*")
  (insert
   (format
    (concat
     "/*===========================================================================*/\n"
     "/**\n"
;     " *  @class  \n"
     " *  @brief  \n"
     " */\n"
     "/*===========================================================================*/\n"
     ))))

;;-----------------------------------------------------------------------------
;; function comment
;;-----------------------------------------------------------------------------
(defun insert-src-func-comment()
  (interactive "*")
  (beginning-of-line)
  (save-excursion 
    (save-restriction
      (widen)
      (let ((start (point)))
        (let ((args (find-arg-list)))
          (insert
           (concat
            "/*===========================================================================*/\n"
            "/**\n"
;            " *  @fn     \n"
            " *  @brief  \n"
;            " *\n"
            ))
          (when (cdr (assoc 'args args))
            (dump-arguments (cdr (assoc 'args args))))
          (unless (string= "void" (cdr (assoc 'return args)))
            (insert " *  @return <ReturnValue>\n"))
          (insert
           (concat
            "*/\n"
            "/*===========================================================================*/\n")))
        (let ((end (point)))
          (indent-region start end nil)
          (untabify start end)))))
  (end-of-line))

;;-----------------------------------------------------------------------------
;; method comment
;;-----------------------------------------------------------------------------
(defun insert-src-method-comment()
  (interactive "*")
  (beginning-of-line)
  (save-excursion 
    (save-restriction
      (widen)
      (let ((start (point)))
        (let ((args (find-arg-list)))
          (insert
           (concat
            "    /*-----------------------------------------------------------------------*/\n"
            "    /**\n"
            "     *  @brief  \n"
            "     *\n"
            ))
          (when (cdr (assoc 'args args))
            (dump-arguments (cdr (assoc 'args args))))
          (unless (string= "void" (cdr (assoc 'return args)))
            (insert "     *  @return <ReturnValue>\n"))
          (insert
           (concat
            "    */\n"
            "    /*-----------------------------------------------------------------------*/\n")))
        (let ((end (point)))
          (indent-region start end nil)
          (untabify start end)))))
  (end-of-line))

;;-----------------------------------------------------------------------------
;; makefile comment
;;-----------------------------------------------------------------------------
(defun insert-mkfile-comment()
  (interactive "*")
  (let ((file-name (if (buffer-file-name)
                       (file-name-nondirectory (buffer-file-name))
                     "untitled"))
        (user-name (user-full-name)))
    (insert
     (format
      (concat
       "#*****************************************************************************/\n"
       "#\n"
       "#   @file   %s\n"
       "#   @brief  Makefile.\n"
       "#\n"
       "#   @author %s\n"
       "#   @date\n"
       "#\n"
       "#-----------------------------------------------------------------------------\n"
       "#\n"
       "#   $Author$\n"
       "#   $Date$\n"
       "#   $Source$\n"
       "#   $Revision$\n"
       "#\n"
       "#*****************************************************************************/\n"
       ) file-name user-name)) ))




(defun dump-arguments (arglist)
  "Insert a comment with the KVS comments for a function."
  (mapcar (function (lambda (x)
                      (insert (format " *  @param  %s\t\n"
                                      (extract-argument-name x)))))
          arglist))

(defun extract-argument-name (arg)
  "Get the argument name from the argument string 'arg'."
  ; this does *not* work for function pointer arguments
  (if (string-match "\\([a-zA-Z0-9_]+\\)\\s-*\\(=\\s-*.+\\s-*\\)?$" arg)
      (substring arg (match-beginning 1) (match-end 1))
    arg))

(defun find-return-type ()
  "Extract the return type of a function.
   If the function is a constructor, it returns void."
  (interactive "*")
  (save-excursion
    (let ((start (point)))
      (search-forward "(")
      (let ((bound (point)))
        (goto-char start)
        (if (re-search-forward 
             (concat
              "\\(virtual \|static \|const \\)*" ; opt. modifiers
              "\\([a-zA-Z0-9_:*]+\\)\\s-+[a-zA-Z0-9_:*]+\\s-*(") ; return type
             bound t)
            (buffer-substring (match-beginning 2)(match-end 2))
          "void")
        ))))

(defun find-arg-list ()
  "Extract various bits of information from a C or C++ function declaration"
  (interactive "*")
  (let ((return-type (find-return-type)))
    (save-excursion
      (if (re-search-forward (concat
                              "\\([a-zA-Z0-9_:]+\\)\\s-*("    ; function name
                              "\\([^)]*\\))")                 ; argument list
                             nil t)
          (list (cons 'return   return-type)
                (cons 'function (buffer-substring (match-beginning 1)
                                                  (match-end 1)))
                (cons 'args     (split-string
                                 (buffer-substring (match-beginning 2)
                                                   (match-end 2)) ",")))
        nil))))
