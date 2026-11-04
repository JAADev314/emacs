;;; -*- lexical-binding: t; -*-
(require 'package)

(dolist (archive '(("melpa" . "https://melpa.org/packages/")
		   ("org" . "https://orgmode.org/elpa/")
		   ))
  (add-to-list 'package-archives archive))

(setq my-emacs-directory
      (cond
       ((eq system-type 'windows-nt) "~/emacs/")
       (t "/emacs/")))
(setq emacs-custom-directory
      (cond
       ((eq system-type 'windows-nt) "~/.emacs.d/custom.el")
       (t "/emacs/custom.el")))

(setq custom-file emacs-custom-directory)
(load-file custom-file)
(load (concat my-emacs-directory "rc.el"))
(load (concat my-emacs-directory "myfunctions.el"))

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

;; org-mode
(rc/require 'org)
(rc/require 'org-bullets)
(rc/require 'visual-fill-column)
        

(defun org-setup ()
  (setq org-bullets-bullet-list '("◉" "○" "△" "◇" "⬡" "▪")) ;; see EOF for other possible characters
  (setq org-ellipsis " ▾")
  (setq visual-fill-column-width 100)
  (setq visual-fill-column-center-text t)
  (org-bullets-mode 1)
  (visual-fil-column-mode 1) ;; padding left and right
  (visual-line-mode 1) ;; word wrap
  )


(add-hook 'org-mode-hook #'org-setup)

;; ● ○ ◉ ◎ ◌ ◍ ⦿ ⊙ ⊚ | ▲ △ ▼ ▽ ◀ ◁ ▶ ▷ ◢ ◣ | ◆ ◇ ◈ ◊ ⬖ ⬗ | ■ □ ▪ ▫ ▣ ▤ ▥ ▦ | ⬟ ⬠ ⬡ ⬢ | ✦ ✧ ✶ ✳ ✴ ✺ ✹ ❖
