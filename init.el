;; run emacs as client server
(require 'server)
(unless (server-running-p)
(server-start))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Note: Only add MELPA if MELPA-stable is not enough
;;(add-to-list 'package-archives
;;	     '("melpa" . "https://melpa.org/packages/"))

;; Note: It is possible to pin packages to melpa-stable like this:
;; (setq package-pinned-packages
;;      '((imenu-anywhere . "melpa-stable")
;;        (spaceline . "melpa-stable")))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/")

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(setq use-package-always-ensure t)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(desktop-save-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(package-selected-packages
   '(key-chord projectile spacemacs-theme magit which-key use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
