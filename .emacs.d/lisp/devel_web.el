;;; インデント数
;(add-hook 'web-mode-hook
;	  (lambda ()
;            (setq web-mode-html-offset   4)
;            (setq web-mode-css-offset    4)
;            (setq web-mode-script-offset 4)
;            (setq web-mode-php-offset    4)
;            (setq web-mode-java-offset   4)
;            (setq web-mode-asp-offset    4)))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
