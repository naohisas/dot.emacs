; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; 外見の設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2017/03/18 10:09:44
;;=============================================================================

;; モードラインにカーソルの位置が何行目かを表示する。
(line-number-mode 1)

;; モードラインにカーソルの位置が何桁目かを表示する。
(column-number-mode 1)

;; モードラインに時刻を24時間制で表示する。
(setq display-time-24hr-format t)
(display-time)

;; メニューバーを表示しない。
(menu-bar-mode 0)

;; ツールバーを表示しない。
(tool-bar-mode 0)

;; スクロールバーを表示しない。
(toggle-scroll-bar nil)

;; ディレクトリを最初に表示する。
(add-hook 'dired-load-hook
          '(lambda ()
             (load-library "ls-lisp")
             (setq ls-lisp-dirs-first t)))

;; emacs上で画像を表示できるようにする。
(auto-image-file-mode)

;; 対応する括弧をハイライトする。
(show-paren-mode 1)

;; リージョンをハイライトする。
(transient-mark-mode 1)

;; 画面分割時に画面外文字を折り返す。
(setq truncate-partial-width-windows nil)

;; 初期フレームの色の設定
(setq default-frame-alist
      (append
       (list
        '(top . 0)
        '(left . 0)
        '(foreground-color . "black")
        '(background-color . "wheat")
        '(border-color .     "black")
        '(mouse-color .      "white")
        '(cursor-color .     "black"))
       default-frame-alist))

(unless window-system
  (progn
    (set-foreground-color "black")
    (set-background-color "white")
    (set-mouse-color      "white")
    (set-cursor-color     "black")))

;; 初期フレームの大きさの設定
(setq default-frame-alist
      (append
       (list
        (nconc (list 'width)  default-frame-width)
;        (nconc (list 'height) default-frame-height))
        (nconc (list 'height) 32))
       default-frame-alist))

;; 初期フレームの位置の設定（画面中央に配置）
;(defconst frame-top-position
;  (/ (- (x-display-pixel-height) (frame-pixel-height)) 2))
;(defconst frame-left-position
;  (/ (- (x-display-pixel-width) (frame-pixel-width)) 2))

;(setq default-frame-alist
;      (append
;       (list
;        (nconc (list 'top)  frame-top-position)
;        (nconc (list 'left) frame-left-position))
;       default-frame-alist))

;; モードライン行の色の設定
(set-face-foreground 'mode-line "#ffffff")
(set-face-background 'mode-line "#b40000")

;; タブ, 全角スペースを表示
;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "white"))) nil)
(defface my-face-b-2 '((t (:background "wheat3"))) nil)
(defface my-face-u-1 '((t (:foreground "wheat4" :underline t))) nil)
;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; タイトルバーに編集中のファイル名を表示する。
;(setq frame-title-format "%b - Emacs")
;; frame-title に buffer name と system-name, emacs-version を載せる。
;;  cf. %b: buffer name,  %f: file name
(setq frame-title-format `(" %b", " @ ",(system-name) " -- Emacs " ,emacs-version))
