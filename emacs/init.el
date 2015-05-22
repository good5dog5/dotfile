;;; this loads the package manager
(require 'package)

;;; here there's a variable named package-archives, and we are adding the MELPA repository to it
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; loads packages and activates them
(package-initialize)

(require 'evil)

;;; Emacs 's vi mode
(evil-mode t)

(load-theme 'misterioso t)
(global-linum-mode t)

(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5)
  )
 (add-hook 'gnus-group-mode-hook
           ;; list all the subscribed groups even they contain zero un-read messages
           (lambda () (local-set-key "o" 'my-gnus-group-list-subscribed-groups ))
           )
