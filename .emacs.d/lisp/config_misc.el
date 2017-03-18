; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;=============================================================================
;;
;; その他の設定
;;
;;-----------------------------------------------------------------------------
;; @author Naohisa Sakamoto
;; @date   2013/02/19 13:03:43
;;=============================================================================

;; font-lockを常にオンにする。
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; カーソルが画面から出たときに一行だけスクロールするようにする。
(setq scroll-conservatively 1)

;; 最終行で C-n しても行が挿入されないようにする。
(setq next-line-add-newlines nil)

;; ビープ音の停止
(setq visible-bell t)

;; 「yes/no」ではなく「y/n」で答える。
(fset 'yes-or-no-p 'y-or-n-p)

;; カレントディレクトリを変更する。
(cd "~")

;; @dateという行があれば更新時間を書き換える。
(defvar my-save-buffer-hook nil)
(defun save-buffer-wrapper ()
  (interactive)
  (let ((tostr (concat "@date   " (format-time-string "%Y/%m/%d %k:%M:%S") "\n")))
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "\\@date\\([0-9/: ]*\\)?\n" nil t)
          (replace-match tostr nil t)))
    (run-hooks 'my-save-buffer-hook)
    (save-buffer)))
(global-set-key "\C-x\C-s" 'save-buffer-wrapper)

;; local valiableを適用するかどうか聞かれないようにする。(CarbonEmacs用)
(when run-carbon-emacs
  (add-to-list 'ignored-local-variables 'syntax))

;; commandキーにmetaキーを割り当てる。
(when run-darwin
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
)
