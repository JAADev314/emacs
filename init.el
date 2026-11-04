;;; -*- lexical-binding: t; -*-
(require 'package)
(setq custom-file "/emacs/custom.el")
(load-file custom-file)
(load "/emacs/rc.el")
(load "/emacs/myfunctions.el")
(package-initialize)

;; visuals
(setq visible-bell 1
      display-line-numbers-type 'relative
      inhibit-splash-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-display-line-numbers-mode)
(ido-mode 1)
(ido-everywhere 1)

(set-face-attribute 'line-number-current-line nil
		    :background nil
		    :foreground "#8ac6f2"
		    :weight 'bold)

(set-face-attribute 'cursor nil
		    :background "light gray")

(load-theme 'wombat)

;; move-text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; multiple-cursors
(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; windows
(rc/require 'ace-window)
(global-set-key (kbd "M-o") #'ace-window)

;; helm keybinds
(rc/require 'helm-descbinds)
(global-set-key (kbd "C-h b") 'helm-descbinds)
(global-set-key (kbd "C-h B") 'describe-bindings)

;; misc
(global-set-key (kbd "C-,") 'duplicate-and-move-down)
(global-set-key (kbd "C-c l") 'mark-whole-line)
(global-set-key (kbd "C-c i") #'open-init-el)
