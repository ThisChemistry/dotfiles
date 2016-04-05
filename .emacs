;; Emacs configuration lisp on wapsi Rev. 2012-11-20
;; Emacs configuration lisp on wapsi Rev. 2015-04-15
;;; Diaspora hack that accomplishes little
(add-to-list 'auto-mode-alist
             '("\\.dias\\'" . (lambda ()
                               ;; add major mode setting here, if
                               ;; needed, for example: (text-mode)
                               (diaspora-mode))))

;;; Org-mode settings
;; Org-mode for Emacs provides text-only tools for keeping organized.
;; I keep one journal file, journal.org and one notes file, notes.org
;; See http://www.orgmode.org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(setq org-default-notes-file "/home/derek/content/notes/notes.org")
(setq org-todo-keywords
      '((sequence "TODO(t)" "OPEN(o)" "PEND(p)" "|" "DONE(d)" "SMDY(s)")))
(setq org-agenda-files (quote ("~/content/notes/journal.org"
			       "~/content/notes/notes.org")))
(setq org-log-done 'time)

(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline
	  "/home/derek/content/notes/journal.org"
	  "Unsorted Tasks")
	 "** TODO %?\n %i\n %a")
	("n" "Notes" entry
	 (file+datatree
	  "/home/derek/content/notes/notes.org")
	 "* %?\nEntered on %U\n %i\n %a")))

;;; External programs
(add-to-list 'load-path "~/.emacs.d/w3m")
(require 'w3m)

;;; Programming languages
;; (require 'ido)
;; (ido-mode t)
;; (load "~/.emacs.d/fill-column-indicator.el")
;; (define-globalized-minor-mode global-fci-mode 
;;   fci-mode 
;;   (lambda () 
;;     (fci-mode 1)))
;; (global-fci-mode t)
;; (add-to-list 'load-path "~/.emacs.d/popup-el")
;; (add-to-list 'load-path "~/.emacs.d/auto-complete")
;; (require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (global-auto-complete-mode t)
;; ; python-mode
;; (setq py-install-directory "~/.emacs.d/python-mode")
;; (add-to-list 'load-path py-install-directory)
;; (require 'python-mode)
;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)
;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)
;; ; pymacs
;; (add-to-list 'load-path "~/.emacs.d/Pymacs")
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;; ; ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")


(require 'ess-site)
(add-to-list 'load-path "~/.emacs.d/haskell-mode")
(require 'haskell-mode)

(add-to-list 'load-path "~/.emacs.d/bgex")
(require 'bgex)

(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)
(add-hook 'twittering-edit-mode-hook 'flyspell-mode)
;; (add-hook 'twittering-mode-hook (lambda ()
;; 				  (twittering-other-user-timeline "jbarro")
;; 				  ))

(load-file "~/.emacs.d/graphviz-dot-mode.el")

(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
	  'flyspell-mode)

;; (add-to-list 'load-path "~/.emacs.d/slime/")  ; your SLIME directory
;; (setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
;; (require 'slime)
;; (slime-setup)

;;; Writing in LaTeX
(add-hook 'tex-mode-hook 'turn-on-auto-fill)
(add-hook 'bibtex-mode-hook 'turn-on-auto-fill)
(add-hook 'tex-mode-hook 'flyspell-mode)

;(setq outline-minor-mode t)

;;; Posting to diaspora via diaspora.el
(add-to-list 'load-path "~/.emacs.d/diaspora.el")
(add-to-list 'load-path "~/.emacs.d/diaspora.el/libraries")
(require 'diaspora)

;; ;;; Writing with Muse
;; (add-to-list 'load-path "~/.emacs.d/muse/lisp")
;; (add-to-list 'load-path "~/.emacs.d/planner")
;; (add-to-list 'load-path "~/.emacs.d/remember")

;; (setq planner-project "WikiPlanner")
;; (setq muse-project-alist
;;       '(("WikiPlanner"
;; 	 ("/home/derek/.emacs.d/plans"
;; 	  :default "index"
;; 	  :major-mode planner-mode
;; 	  :visit-link planner-visit-link))
;; 	("website"
;; 	 ("/home/derek/.emacs.d/website"
;; 	  :default "index"
;; 	  (:base "html" :path "/home/derek/public_html/")
;; 	  (:base "pdf" :path "/home/derek/public_html/pdf/"))
;; 	 )))


;; (require 'planner)

;;; Appearance
(setq w3m-coding-system 'utf-8)		;; or 'utf-8

(require 'ansi-color)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 116 :width normal :foundry "bitstream" :family "Courier 10 Pitch")))))

;;; Custom key bindings
(global-set-key [(super e)] 'eval-buffer)
(global-set-key [(super x)] '(insert-file-contents))
(global-set-key [(super b)] '(insert-file-contents "/home/derek/labbook/template-subexperiment.tex" (other-window)))

(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-left] 'windmove-left)

(global-set-key [S-up] 'backward-sentence)
(global-set-key [S-down] 'forward-sentence)
(global-set-key [S-right] 'forward-word)
(global-set-key [S-left] 'backward-word)

(global-set-key [(super k)] 'previous-line)
(global-set-key [(super j)] 'next-line)
(global-set-key [(super h)] 'backward-char)
(global-set-key [(super l)] 'forward-char)

(global-set-key [(hyper k)] 'move-end-of-line)
(global-set-key [(hyper j)] 'move-beginning-of-line)
(global-set-key [(hyper h)] 'backward-word)
(global-set-key [(hyper l)] 'forward-word)

(global-set-key [H-backspace] 'backward-kill-word)
(global-set-key [(hyper d)] 'kill-word)
(global-set-key [(hyper p)] 'previous-line)
(global-set-key [(hyper n)] 'next-line)

(global-set-key [(hyper m)] 'call-last-kbd-macro)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-for-comint-mode t)
 '(browse-url-browser-function (quote w3m))
 '(browse-url-temp-dir "/home/derek/.w3m")
 '(diaspora-get-always-authenticity-token nil)
 '(diaspora-password "8shitdotCOM")
 '(diaspora-secure-pod t)
 '(diaspora-sign-in-url "users/sign_in/")
 '(diaspora-single-message-url "posts/")
 '(diaspora-status-messages-url "status_messages/")
 '(diaspora-username "ThisChemistry")
 '(g-curl-debug t)
 '(g-user-email "f.stop.fitzgerald@gmail.com")
 '(g-xslt-debug t)
 '(g-xslt-program "/home/00/derekb/bin/xsltproc")
 '(gblogger-user-email "f.stop.fitzgerald@gmail.com")
 '(html-mode-hook (quote (turn-on-font-lock)))
 '(inhibit-startup-screen t)
 '(mail-host-address "sccs.swarthmore.edu")
 '(mail-user-agent (quote gnus-user-agent))
 '(markdown-command "markdown_py")
 '(muse-project-alist
   (quote
    (("WikiPlanner"
      ("~/.emacs.d/plans" "index"))
     ("website"
      ("~/.emacs.d/website" "index")))))
 '(newsticker-url-list nil)
 '(smtpmail-default-smtp-server "smtp.sccs.swarthmore.edu" t)
 '(temporary-file-directory "/home/derek/tmp")
 '(text-mode-hook
   (quote
    (turn-on-auto-fill text-mode-hook-identify turn-on-font-lock)))
 '(user-full-name "Derek Andrew Bruzewicz")
 '(user-mail-address "derekb@.sccs.swarthmore.edu")
 '(w3m-cookie-accept-bad-cookies t)
 '(w3m-enable-google-feeling-lucky nil)
 '(w3m-home-page
   "https://s2-us2.ixquick.com/do/mypage.pl?prf=0a2e5409128e4c7e5d271492096f99c3")
 '(w3m-search-default-engine "ixquick")
 '(w3m-search-engine-alist
   (quote
    (("yahoo" "http://search.yahoo.com/bin/search?p=%s" nil)
     ("yahoo-ja" "http://search.yahoo.co.jp/bin/search?p=%s" euc-japan)
     ("google" "http://www.google.com/search?q=%s" nil)
     ("google-ja" "http://www.google.com/search?q=%s&hl=ja&lr=lang_ja&ie=Shift_JIS" shift_jis)
     ("google groups" "http://groups.google.com/groups?q=%s" nil)
     ("All the Web" "http://www.alltheweb.com/search?web&_sb_lang=en&q=%s" nil)
     ("All the Web-ja" "http://www.alltheweb.com/search?web&_sb_lang=ja&cs=euc-jp&q=%s" euc-japan)
     ("goo-ja" "http://www.goo.ne.jp/default.asp?MT=%s" euc-japan)
     ("excite-ja" "http://www.excite.co.jp/search.gw?target=combined&look=excite_jp&lang=jp&tsug=-1&csug=-1&search=%s" shift_jis)
     ("lycos-ja" "http://www.lycos.co.jp/cgi-bin/pursuit?query=\"%s\"&cat=jp&encoding=shift-jis" shift_jis)
     ("altavista" "http://altavista.com/sites/search/web?q=\"%s\"&kl=ja&search=Search" nil)
     ("rpmfind" "http://rpmfind.net/linux/rpm2html/search.php?query=%s" nil)
     ("debian-pkg" "http://packages.debian.org/cgi-bin/search_contents.pl?directories=yes&arch=i386&version=unstable&case=insensitive&word=%s" nil)
     ("debian-bts" "http://bugs.debian.org/cgi-bin/pkgreport.cgi?archive=yes&pkg=%s" nil)
     ("freebsd-users-jp" "http://home.jp.FreeBSD.org/cgi-bin/namazu.cgi?key=\"%s\"&whence=0&max=50&format=long&sort=score&dbname=FreeBSD-users-jp" euc-japan)
     ("iij-archie" "http://www.iij.ad.jp/cgi-bin/archieplexform?query=%s&type=Case+Insensitive+Substring+Match&order=host&server=archie1.iij.ad.jp&hits=95&nice=Nice" nil)
     ("waei" "http://dictionary.goo.ne.jp/cgi-bin/dict_search.cgi?MT=%s&sw=1" euc-japan)
     ("eiwa" "http://dictionary.goo.ne.jp/cgi-bin/dict_search.cgi?MT=%s&sw=0" nil)
     ("kokugo" "http://dictionary.goo.ne.jp/cgi-bin/dict_search.cgi?MT=%s&sw=2" euc-japan)
     ("eiei" "http://www.dictionary.com/cgi-bin/dict.pl?term=%s&r=67" nil)
     ("amazon" "http://www.amazon.com/exec/obidos/search-handle-form/250-7496892-7797857" nil "url=index=blended&field-keywords=%s")
     ("amazon-ja" "http://www.amazon.co.jp/exec/obidos/search-handle-form/250-7496892-7797857" shift_jis "url=index=blended&search-type=quick-search&field-keywords=%s")
     ("clusty" "http://clusty.com/search?query=%s" nil)
     ("ixquick" "http://ixquick.com/do/metasearch.pl?query=%s" nil))))
 '(w3m-toggle-inline-images-permanently nil)
 '(w3m-use-cookies t)
 '(weblogger-config-alist
   (quote
    (("default"
      ("user" . "derekb")
      ("server-url" . "http://www.sccs.swarthmore.edu/users/00/derekb/xparent/xmlrpc.php")
      ("pass" . "OCIL8172")
      ("weblog" . "1")))))
 '(weblogger-ping-urls nil)
 '(weblogger-save-password t)
 '(weblogger-server-url
   "http://www.sccs.swarthmore.edu/users/00/derekb/xparent/xmlrpc.php"))


;; ;; Make a new blog entry for the raos blog
;; (defun gblogger-new-entry-raos ()
;;   (interactive)
;;   (gblogger-new-entry "http://www.blogger.com/feeds/23142240/posts/default"))

;; (global-set-key "\M-n\M-r" 'gblogger-new-entry-raos)

;; (defun gblogger-atom-display-raos ()
;;   (interactive)
;;   (gblogger-atom-display "http://www.blogger.com/feeds/23142240/posts/default"))

;; (defun gblogger-edit-entry-num (num)
;;   "Retrieve entry and prepare it for editting.
;; The retrieved entry is placed in a buffer ready for editing.
;; `num' is the URL of the entry."
;;   (interactive
;;    (list
;;     (read-from-minibuffer "Entry Num:")))
;;   (declare (special gblogger-auth-handle
;;                     g-curl-program g-curl-common-options))
;;   (let ((buffer (gblogger-get-entry (concat "http://www.blogger.com/feeds/23142240/posts/default/" num))))
;;     (save-excursion
;;       (set-buffer buffer)
;;       (setq gblogger-publish-action 'gblogger-put-entry)
;;       (g-xsl-transform-region (point-min) (point-max)
;;                               g-atom-edit-filter))
;;     (switch-to-buffer buffer)
;;     (goto-char (point-min))
;;     (flush-lines "^ *$")
;;     (goto-char (point-min))
;;     (search-forward "<content" nil t)
;;     (forward-line 1)
;;     (message
;;      (substitute-command-keys "Use \\[gblogger-publish] to publish your edits ."))))

;; (global-set-key "\M-n\M-p" 'weblogger-start-entry)
(global-set-key [(hyper e)] 'bibtex-Article)

(fset 'tex-new-choice-question
   [?\\ ?i ?t ?e ?m return tab ?\\ ?b ?e ?g ?i ?n ?\{ ?e ?n ?u ?m ?e ?r ?a ?t ?e ?\} return tab ?\\ ?b ?e ?g ?i ?n ?\{ ?m ?u ?l ?t ?i ?c ?o ?l ?s ?\} ?\{ ?3 ?\} return tab ?\\ ?i ?t ?e ?m return ?\\ ?e ?n ?d ?\{ ?m ?u ?l ?t ?i ?c ?o ?l ?s ?\} tab return ?\\ ?e ?n ?d ?\{ ?e ?n ?u ?m ?e ?r ?a ?t ?e ?\} ?\C-p ?\C-p ?\C-p ?\C-p ?\C-p ? ])

(fset 'tex-new-frame
   [?\\ ?b ?e ?g ?i ?n ?\{ ?f ?r ?a ?m ?e ?\} return tab ?\\ ?f ?r ?a ?m ?e ?t ?i ?t ?l ?e ?\{ ?\} return return ?\\ ?e ?n ?d ?\{ ?f ?r ?a ?m ?e ?\} ?\C-p ?\C-p ?\C-f ?\C-f ?\C-f])

(fset 'tex-new-figure
   [tab ?\\ ?i ?n ?c ?l ?u ?d ?e ?g ?r ?a ?p ?h ?i ?c ?s ?\[ ?w ?i ?d ?t ?h ?= ?\\ ?t ?e ?x ?t ?w ?i ?d ?t ?h ?\] ?\{ ?f ?i ?g ?u ?r ?e ?s ?/ ?\} ?\C-b])

;; (fset 'tex-new-problem
;;    [?\M-x ?t ?e ?x ?- ?n ?e ?w ?- ?f ?r ?a ?m backspace ?m ?e return ?P ?r ?o ?b ?l ?e ?m ?  ?\\ ?s ?t ?e ?p ?c ?o ?u ?n ?t ?e ?r ?\{ ?p ?r ?o ?b ?l ?e ?m ?\} ?\\ ?a ?r ?a ?b ?i ?c ?\{ ?p ?r ?o ?b ?l ?e ?m ?\} ?\C-e ?\C-j ?\C-c ?\C-o ?b ?l ?o ?c ?k return ?\C-p ?\C-e ?\{ ?\} ?\C-b])

(fset 'tex-new-problem
   [?\\ ?s ?t ?e ?p ?c ?o ?u ?n ?t ?e ?r ?\{ ?p ?r ?o ?b ?l ?e ?m ?\} return ?\M-x ?t ?e ?x ?- ?n ?e ?w ?- ?f ?r ?a ?m ?e return ?P ?r ?o ?b ?l ?e ?m ?  ?\\ ?a ?r ?a ?b ?i ?c ?\{ ?p ?r ?o ?b ?l ?e ?m ?\} ?\C-e ?\C-j ?\C-c ?\C-o ?b ?l ?o ?c ?k return ?\C-p ?\C-e ?\{ ?\} ?\C-b])

;;; Start-up
;;(plan)
;;(delete-other-windows)
(find-file "/home/derek/content/notes/journal.org")
(org-agenda "/home/derek/content/notes/journal.org" "L")
