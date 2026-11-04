;;; -*- lexical-binding: t; -*-

(defun open-init-el ()
  (interactive)
  (find-file "/emacs/init.el"))

(defun mark-whole-line ()
  (interactive)
  (beginning-of-line)
  (set-mark-command nil)
  (end-of-line))

(defun duplicate-and-move-down ()
  "Duplicate current line"
  (interactive)
  (duplicate-line)
  (next-line))
