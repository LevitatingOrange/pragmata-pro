;;; pragmata-pro.el --- Wrapper for pragmata pro so it can be easily installed with  -*- lexical-binding: t -*-

;; Author: LevitatingOrange, Fabrizio Schiavi
;; Package-Requires: ((emacs "24"))
;; Version: 0.1
;; Keywords: pass, password, convenience, data

;; This file is not part of GNU Emacs.

;;; Commentary
;; This is just a ultra-thin wrapper around
;; fabrizio schiavi's code so that we can
;; include easily with straight.el

(defconst pragmata-pro/font-name "PragmataPro")

(load-file "./pragmatapro/emacs_snippets/pragmatapro-prettify-symbols-v0.828.el")

(when (display-graphic-p)
  (set-face-attribute 'default nil :font pragmata-pro/font-name))

                                        ; If we started emacsclient though, and connect to an emacs server,
                                        ; some trickery is required. An emacs instance in daemon mode does not
                                        ; pickup fonts (or anything related to the graphical interface for
                                        ; that matter) until an actual GUI window is created, so we have to
                                        ; defer font loading until after the creation of a frame.
(add-hook 'after-make-frame-functions (lambda (frame)
                                        (select-frame frame)
                                        (when (display-graphic-p)
                                          (set-face-attribute 'default nil :font pragmata-pro/font-name))))
