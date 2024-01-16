;;; package --- My init file
;;; Commentary:
;;; This is my personal init file, it bootstrap the basics to have a full file
;;; org file.

;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'org)
(org-babel-load-file
  (expand-file-name "settings.org"
     user-emacs-directory))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (require 'evil-org-agenda))

(provide 'init)
;;; init.el ends here
