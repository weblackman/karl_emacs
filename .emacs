(require 'cl) ; a rare necessary use of REQUIRE
(defvar *emacs-load-start* (current-time))
(add-to-list 'load-path "d:/elisp/")
(add-to-list 'load-path "d:/elisp/php-mode-1.5.0/")
(add-to-list 'load-path "d:/elisp/efs-1.24/")
(add-to-list 'load-path "d:/elisp/color-theme-6.6.0/")
(add-to-list 'load-path "d:/elisp/geben-0.24/")
(add-to-list 'load-path "d:/elisp/delicious-el/")
(add-to-list 'load-path "d:/elisp/rest/")
(add-to-list 'load-path "d:/elisp/emacs-cake/")
(add-to-list 'load-path "d:/elisp/slime/")
(add-to-list 'load-path "d:/elisp/mmm-mode-0.4.8/")
(add-to-list 'load-path "d:/elisp/twit/")
(add-to-list 'load-path "d:/elisp/emhack/")
(add-to-list 'load-path "d:/elisp/emacs-httpd.git/")
(add-to-list 'load-path "d:/elisp/cedet-1.0pre6/")
(add-to-list 'load-path "d:/elisp/cedet-1.0pre6/semantic/")
(add-to-list 'load-path "d:/elisp/cedet-1.0pre6/semantic/wisent/")
(add-to-list 'load-path "d:/elisp/cedet-1.0pre6/common/")
(add-to-list 'load-path "d:/elisp/egg/")



(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)
(setenv "PATH" (concat "d:/cygwin/bin;" (getenv "PATH")))
(setq exec-path (cons "d:/cygwin/bin/" exec-path))
(setq woman-manpath '("d:/cygwin/usr/man"
                       "d:/cygwin/usr/share/man"
                      )
       woman-path '("d:/cygwin/usr/man"
                    "d:/Emacs/EmacsW32/gnuwin32/man"
                    "d:/cygwin/usr/share/man/"
		    ))
(set-register ?E '(file . "~/.emacs"))

(require 'color-theme)
(color-theme-initialize)
;;(load-file "d:/elisp/color-theme-twilight.el")
;;(color-theme-twilight)
(load-file "d:/elisp/color-theme-railscasts.el")
(color-theme-railscasts)
;;(require 'color-theme-subdued)
;;(color-theme-subdued)
;;
;; Set various behaviors...
;;--------------------------------------------------------------------
;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
;; always end a file with a newline
(setq require-final-newline t)
(setq column-number-mode t)
;; stop at the end of the file, not just add lines
(setq next-line-add-newlines t)
(set-default-coding-systems 'utf-8)
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq undo-limit 1000)

;; deleteing files goes to OS's trash folder
(setq delete-by-moving-to-trash t)
;;to display time
(display-time)
(setq c-default-style "bsd"
      c-basic-offset 4)
(defun pear/php-mode-init()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close '0)
  )
(add-hook 'php-mode-hook 'pear/php-mode-init)


;;to manage the geometric size of initial window.
(setq initial-frame-alist '((width . 82) (height . 40)))
(setq default-frame-alist '((width . 81) (height . 40)))

(setq indent-tabs-mode nil)
(setq tab-width 4)
(mouse-avoidance-mode 'jump)                   ; Mouse avoids cursor
(setq default-major-mode 'text-mode)       ; Text-mode is default mode          


                                        ;
                                        ; Set various keybindings...
                                        ;--------------------------------------------------------------------
;;set the keybinding so that you can use f4 for goto line
;;(global-set-key [f4] 'moccur-grep)
(global-set-key "\C-xg" 'goto-line)

(global-set-key "\M-?" 'help-command)

;;set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)
;;set the keybinding so that f5 will start query replace

(global-set-key [f6] 'switch-to-buffer)
;;(global-set-key [f7] 'hippie-expand)
(global-set-key [f8] 'ispell)

                                        ;
                                        ; Set window properties...
                                        ;--------------------------------------------------------------------
;;(set-frame-height (selected-frame) 57) 
;;(set-frame-position (selected-frame) 415 1) 

;; display the full path to the current file.
(setq frame-title-format '("%b    (%f)"))
(setq icon-title-format '("Emacs: %b"))
(set-message-beep 'ok)



(tool-bar-mode 0)
(menu-bar-mode t)
(scroll-bar-mode nil) 
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))
(setq resize-mini-windows t)

(keyboard-translate ?\C-h ?\C-?)

;(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "C-c r") 'query-replace-regexp)
(defalias 'qrr 'query-replace-regexp)
(global-set-key (kbd "C-c %") 'replace-regexp)



;(global-set-key "\C-x\C-m" 'execute-extended-command)
(require 'smex)
;; Run this after all your other Emacs packages have been loaded:
(add-hook 'after-init-hook 'smex-initialize)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)

(global-unset-key (kbd "C-x m"))
;;(global-set-key "\C-c\C-m" 'execute-extended-command)
;; get rid of prompt that forces you to type full ¡°yes¡± or ¡°no¡±.
;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

;; shortening of often used commands
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'sh 'shell)

(defalias 'qrr 'query-replace-regexp)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'rof 'recentf-open-files)

(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ee 'eval-expression)
;;; WINDOW SPLITING
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was center-line
(global-set-key (kbd "M-3") 'delete-window)

(defalias 'list-buffers 'ibuffer)

(global-set-key (kbd "<f5>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f6>") 'ibuffer) ; list buffers

(global-set-key (kbd "<f7>") 'previous-user-buffer)
(global-set-key (kbd "<f8>") 'next-user-buffer)
(global-set-key (kbd "S-<f7>") 'previous-emacs-buffer) ; Shift+f7
(global-set-key (kbd "S-<f8>") 'next-emacs-buffer) ; Shift+f8

(global-set-key (kbd "<f9>") 'kill-this-buffer) ; Close file 
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;; shift the meaning of C-s and C-M-s
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control meta s)] 'isearch-forward)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control meta r)] 'isearch-backward)

(show-paren-mode 1)                            ; Highlight parenthesis pairs
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis
                                        ;(setq show-paren-style 'expression)            ; Highlight text between parens
(global-hl-line-mode 1)                        ; Highlight cursor line
(blink-cursor-mode 1)                          ; No blinking cursor
                                        ;(setq-default indicate-empty-lines t)          ; Show empty lines

(icomplete-mode t)
(iswitchb-mode t)
(setq ido-enable-tramp-completion nil)
(ido-mode t)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)
(setq ido-use-filename-at-point t)
;;---------------------------------
;; rest of your .emacs goes here

(message "My .emacs 1 loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))


(require 'highlight-parentheses)
(highlight-parentheses-mode t)
(require 'showtip)
(require 'flymake-extension)

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(require 'hideshow-fringe) 
(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                                        ;		     'php-mode-hook
                    ))
  (add-hook hook 'hideshowvis-enable))

(require 'uniquify)

;; flymake
(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)
(require 'wuxch-fringe-bookmark)
(require 'fringe-helper)
(require 'flymake)

(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay (after add-to-fringe first
                                       (beg end tooltip-text face mouse-face)
                                       activate compile)
  (push (fringe-helper-insert-region
         beg end
         (fringe-lib-load (if (eq face 'flymake-errline)
                              fringe-lib-exclamation-mark
                            fringe-lib-question-mark))
         'left-fringe 'font-lock-warning-face)
        flymake-fringe-overlays))

(defadvice flymake-delete-own-overlays (after remove-from-fringe activate
                                              compile)
  (mapc 'fringe-helper-remove flymake-fringe-overlays)
  (setq flymake-fringe-overlays nil))

(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'js-comint)
(setq inferior-js-program-command "java org.mozilla.javascript.tools.shell.Main")
(add-hook 'js2-mode-hook '(lambda () 
                            (local-set-key "\C-x\C-e" 'js-send-last-sexp)
                            (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
                            (local-set-key "\C-cb" 'js-send-buffer)
                            (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
                            (local-set-key "\C-cl" 'js-load-file-and-go)
                            ))

;;(require 'flymake-jslint)
(require 'php-mode)
;;(load "d:/Emacs/EmacsW32/nxhtml/autostart.el")

;;
;; Toggle between PHP & HTML Helper mode.  Useful when working on
;; php files, that can been intertwined with HTML code


;;(speedbar-add-supported-extension ".php") ; 
;;(speedbar-add-supported-extension ".ctp") ; 
;;(speedbar-add-supported-extension ".js")
;;(add-to-list 'speedbar-fetch-etags-parse-list
;;             '("\\.js" . speedbar-parse-c-or-c++tag))
(add-to-list 'auto-mode-alist '("\\.ctp$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(require 'flymake-php)

(defun toggle-php-html-mode ()
  (interactive)
  "Toggle mode between PHP & HTML Helper modes"
  (cond ((string= mode-name "nXML")
         (php-mode))
        ((string= mode-name "PHP")
         (nxml-mode))))

(global-set-key [f2] 'toggle-php-html-mode)




(defvar javascript-identifier-regexp "[a-zA-Z0-9.$_]+")

(defun my-js-setup-flymake ()
  (flymake-mode 1)
  (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
  (local-set-key (kbd "C-c p") 'flymake-goto-prev-error)
  (local-set-key (kbd "C-c t") 'flymake-js-toggle-method))

(add-hook 'js2-mode-hook 'my-js-setup-flymake)


(add-to-list 'load-path
             "d:/elisp/yasnippet-0.6.1c")

(require 'yasnippet-bundle)
(setq yas/prompt-functions '(yas/dropdown-prompt))


;;(setq yas/root-directory "d:/elisp/mysnippet/")
;;(yas/load-directory yas/root-directory)
(add-hook 'php-mode-hook
          #'(lambda ()
              (setq yas/mode-symbol 'html-mode)))
(add-hook 'nxml-mode-hook
          #'(lambda ()
              (local-unset-key (kbd "M-h"))
              (setq yas/mode-symbol 'html-mode)))

(require 'auto-complete)
                                        ;(require 'auto-complete-extension)

(require 'auto-complete+)
(require 'auto-complete-config)
                                        ;(require 'google-c-style)
(require 'auto-complete-yasnippet)
;;(require 'php-completion)

;;(global-auto-complete-mode t)
(set-default 'ac-sources
             '(
                                        ;ac-source-semantic
               ac-source-yasnippet
               ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-all-buffer
               ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename))




(define-key ac-complete-mode-map (kbd "") 'ac-complete)
;;(define-key ac-complete-mode-map (kbd "C-j")      'ac-complete)
(define-key ac-complete-mode-map (kbd "C-n")      'ac-next)
(define-key ac-complete-mode-map (kbd "C-p")      'ac-previous)
;;(setq max-lisp-eval-depth 2048)         ; trying to fix max list eval depth 

;;(require 'anything-config)
;;(require 'cake)
;;(global-cake t)
;;(require 'anything-c-cake)
;;(setq anything-sources (list anything-c-source-cake))
;;(defalias 'cc 'cake-complete)

;; Cooperation with auto-complete.el:
;;
;; add these lines to your .emacs file:
;;(add-hook  'php-mode-hook
;;           (lambda ()
;;             (when (require 'auto-complete nil t)
;;               (make-variable-buffer-local 'ac-sources)
;;               (add-to-list 'ac-sources 'ac-source-php-completion)
;;               ;; if you like patial match,
;;               ;; use `ac-source-php-completion-patial' instead of `ac-source-php-completion'.
;;               ;; (add-to-list 'ac-sources 'ac-source-php-completion-patial)
;;               (auto-complete-mode t))))


;;(require 'anything-grep)

;;(require 'completion-ui)




;;---------------------------------
;; rest of your .emacs goes here



;;(require 'scroll-mode-line-mode)
;;(scroll-mode-line-mode  1)
;;(when (fboundp 'windmove-default-keybindings)
;;  (windmove-default-keybindings))
;;(require 'xray)

;;(require 'moccur-edit)

;;(require 'ange-ftp)
(setq tramp-default-method "ftp")

(setq ange-ftp-ftp-program-name "D:/Emacs/EmacsW32/gnuwin32/bin/ftp.exe")
;;(setq tramp-default-method "plink")
;;(setq tramp-chunksize 328)

;;(setq ange-ftp-default-user "lss247devteam")
;;(ange-ftp-set-passwd "FTP.livesalesstaff.com" "lss247devteam" "Devteam4728")
;;(setq ange-ftp-default-user "dev@orientationsys.com")
;;(ange-ftp-set-passwd "ftp.orientationsys.com" "dev@orientationsys.com" "Rz)r(H1E1Jti")
;;(setq ange-ftp-default-user "livesalesstaff")
;;(ange-ftp-set-passwd "FTP.livesalesstaff.com" "livesalesstaff" "FOXTROT")



(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))
(require 'google-define)
(defalias 'ge 'google-define)

;;(require 'sr-speedbar)
;;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)


                                        ;(add-to-list 'load-path "d:/elisp/emacs-w3m-1.4.3")

                                        ;(if (= emacs-major-version 23)
                                        ;   (progn
                                        ;    (add-to-list 'load-path "C:/Program Files/Emacs/site-lisp/w3m/")
                                        ;   (require 'w3m-load))
                                        ;  (require 'w3m))
                                        ;(require 'w3m-e21)
                                        ;(provide 'w3m-e23)


                                        ;(require 'w3m-load)
                                        ;(setq w3m-use-favicon nil)
                                        ;(setq w3m-command-arguments '("-cookie" "-F"))
                                        ;(setq w3m-use-form t)
                                        ;(setq w3m-tab-width 8)
                                        ;(setq w3m-use-cookies t)
                                        ;(setq w3m-use-toolbar t)
                                        ;(setq w3m-use-mule-ucs t)
                                        ;(setq w3m-fill-column 120)
                                        ;(setq w3m-default-display-inline-image t)
                                        ;(setq w3m-default-toggle-inline-images t)
                                        ;(setq w3m-home-page "http://www.google.com")

                                        ;(setq browse-url-browser-function 'w3m-browse-url)



(require 'irfc)
;;
;; Setup your storage directory for RFC documents.
;;
(setq irfc-directory "d:/rfc/")
;;
;; If you want make RFC document load `irfc-mode' automatically,
;; setup like below:
;;
;;(setq irfc-assoc-mode t)
;;

;;(require 'anything-irfc)
;;(setq anything-sources
;;      (list
;;       anything-c-source-irfc-table-jump
;;       ))
;;(require 'xml-rpc)

;;(require 'delicious)
                                        ;(setq delicious-api-user "mcwolf"
                                        ;     delicious-api-password "D974082"
                                        ;    delicious-api-from "wwzhang@gmail.com") 
(setq delicious-api-user        "karl_wang")
(setq delicious-api-password    "31415926")
(setq delicious-api-from        "qUAb7j5g")
;;(require 'backpack)
                                        ;(require 'snipplr)
                                        ;(setq backpack-user        "michael")
                                        ;(setq delicious-api-password    "31415926")

(setq load-path (cons "d:/elisp/w3/lisp" load-path))

(require 'w3-auto)
(setq w3-default-stylesheet "~/.w3/default.css")
;;(require 'swimmers)
;;(require 'fortune)
(require 'banner)
;;(setq zone-programs [zone-pgm-five-oclock-swan-dive])
;;(add-to-list 'load-path "d:/elisp/company-0.4.3/")
;;(autoload 'company-mode "company" nil t)

;;(defun complete-or-indent ()
;;  (interactive)
;;  (if (company-manual-begin)
;;      (company-complete-common)
;;    (indent-according-to-mode)))

;;(defun indent-or-complete ()
;;  (interactive)
;;  (if (looking-at "\\_>")
;;      (company-complete-common)
;;    (indent-according-to-mode)))


(keyboard-translate ?\( ?\[)
(keyboard-translate ?\[ ?\()
(keyboard-translate ?\) ?\])
(keyboard-translate ?\] ?\))

;;(require 'smarttabs)
(setq-default indent-tabs-mode nil)
(put 'narrow-to-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t) 

;;(setq org-agenda-files (list "d:/org/work.org"))






;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html
(set-face-background 'modeline          "#4466aa")
(set-face-background 'modeline-inactive "#99aaff")
(set-face-background 'fringe "#809088")

(require 'mysql)

(require 'w32-browser)
(require 'dired-details)
(dired-details-install)
(require 'dired-details+)
(require 'dired+)

;;(let ((width (/ (frame-width) 3)))
;; (split-window-horizontally (- width))
;; (split-window-horizontally (- width)))
(require 'cursor-chg)  ; Load this library
(change-cursor-mode 1) ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle
;;(require 'cursor-change)
;;(load "d:/elisp/mode-line-settings.el")
(require 'setup-cygwin)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(autoload 'inferior-moz-mode "moz" "MozRepl Inferior Mode" t)
(autoload 'moz-minor-mode "moz" "MozRepl Minor Mode" t)
(add-hook 'js2-mode-hook 'javascript-moz-setup)
(defun javascript-moz-setup () (moz-minor-mode 1))

(require 'moz)
(require 'json)

(defun moz-update (&rest ignored)
  "Update the remote mozrepl instance"
  (interactive)
  (comint-send-string (inferior-moz-process)
                      (concat "content.document.body.innerHTML="
                              (json-encode (buffer-string)) ";")))

(defun moz-enable-auto-update ()
  "Automatically the remote mozrepl when this buffer changes"
  (interactive)
  (add-hook 'after-change-functions 'moz-update t t))

(defun moz-disable-auto-update ()
  "Disable automatic mozrepl updates"
  (interactive)
  (remove-hook 'after-change-functions 'moz-update t))
(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
    (goto-char (point-min))
    (while (search-forward (string ?\C-m) nil t)
      (replace-match (string ?\C-j) nil t))))

(defun auto-reload-firefox-on-after-save-hook ()         
  (add-hook 'after-save-hook
            '(lambda ()
               (interactive)
               (comint-send-string (inferior-moz-process)
                                   "setTimeout(BrowserReload(), \"1000\");"))
            'append 'local)) ; buffer-local

;; Example - you may want to add hooks for your own modes.
;; I also add this to python-mode when doing django development.
;;(add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
;;(add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook)
;;(add-hook 'nxml-mode-hook 'auto-reload-firefox-on-after-save-hook)
(require 'zencoding-trie)
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;;(require 'nxml-where)

;;(require 'two-mode-mode)
(autoload 'camelCase-mode "camelCase-mode" nil t)


(setq inferior-lisp-program "d:/clisp/clisp")
(require 'slime-autoloads)
(slime-setup)

;;(require 'xpath)
(autoload 'rnc-mode "rnc-mode")
(setq auto-mode-alist       
      (cons '("\\.rnc\\'" . rnc-mode) auto-mode-alist))
(require 'html-script)
;;(require 'mmm-mode)
;;(setq mmm-global-mode 'maybe)
;;(mmm-add-mode-ext-class nil "\\.php3?\\'" 'html-php)
;;(mmm-add-classes
;; '((html-php
;;    :submode php-mode
;;    :front "<\\?\\(php\\)?"
;;    :back "\\?>")))
;;(autoload 'php-mode "php-mode" "PHP editing mode" t)
;;(add-to-list 'auto-mode-alist '("\\.php3?\\'" . nxml-mode))

;; Define M-x commands

(autoload 'twit-show-recent-tweets	"twit" "" t) ; most recent direct tweets (!)
(autoload 'twit-show-at-tweets		"twit" "" t) ; directed to you
(autoload 'twit-show-friends 		"twit" "" t) ; your friends
(autoload 'twit-show-followers 		"twit" "" t) ; your followers

(autoload 'twit-follow-recent-tweets	"twit" "" t) ; at idle, check at background

(autoload 'twit-post			"twit" "" t)
(autoload 'twit-post-region		"twit" "" t)
(autoload 'twit-post-buffer		"twit" "" t)
(autoload 'twit-direct			"twit" "" t) ; tweet to person

(autoload 'twit-add-favorite		"twit" "" t) ; Add to favourite: (*) star
(autoload 'twit-remove-favorite 	"twit" "" t)

(autoload 'twit-add-friend  		"twit" "" t) ; follow a friend
(autoload 'twit-remove-friend 		"twit" "" t) ; emove a frienda

;; Customize twit-multi-accounts in order to use these: ((user . pass) ...)
(autoload 'twit-switch-account 		"twit" "" t)
(autoload 'twit-direct-with-account  	"twit" "" t)
(autoload 'twit-post-with-account 	"twit" "" t)

(autoload 'twit-show-direct-tweets-with-account "twit" "" t)
(autoload 'twit-show-at-tweets-with-account 	"twit" "" t)


;;Customizations

(setq twit-user "k_cake")
(setq twit-pass "#31415926")

;; Key bindings examples
;; Requires that autoloads above have been added to ~/.emacs

(global-set-key "\C-cTT"  'twit-follow-recent-tweets) ; (s)how (T)weets
(global-set-key "\C-cTst" 'twit-follow-recent-tweets) ; (s)how (t)weets
(global-set-key "\C-cTsa" 'twit-show-at-tweets)       ; (s)how (a)t
(global-set-key "\C-cTsf" 'twit-show-at-tweets)       ; (s)how (f)riends
(global-set-key "\C-cTsl" 'twit-show-at-tweets)       ; (s)how fo(l)lowers

(global-set-key "\C-cTpp" 'twit-post)		      ; (p)ost
(global-set-key "\C-cTpr" 'twit-post-region)	      ; (p)post (r)egion
(global-set-key "\C-cTpb" 'twit-post-buffer)	      ; (p)post (b)uffer
(global-set-key "\C-cTpr" 'twit-direct)		      ; (p)post (d)irect
(global-set-key "\C-cTfa" 'twit-add-favorite)	      ; (f)avorite (a)dd
(global-set-key "\C-cTfr" 'twit-remove-favorite)      ; (f)avorite (r)emove



(defun get-ip-address () 
  "Win32: get the IP-address of the first network interface"
  (let ((ipconfig (shell-command-to-string "ipconfig | findstr Address"))) 
    (string-match "\\(\\([0-9]+.\\)+[0-9]+\\)" ipconfig)
    (match-string 0 ipconfig)))

(autoload 'chinese-chess "chinese-chess" "Play chinese chess game." t)
(require 'chinese-chess-pvc)

(add-hook 'before-save-hook
          '(lambda ()
             (or (file-exists-p (file-name-directory buffer-file-name))
                 (make-directory (file-name-directory buffer-file-name) t))))

;;(require 'mumamo-fun)
;;(require 'anything-etags)

(require 'tree-widget)
(require 'dir-tree)
(require 'swbuff)
;;(require 'recentf)
;;(recentf-mode 1)
(require 'swbuff-x)
(setq swbuff-display-intermediate-buffers t)

(require 'iflipb)
(global-set-key (kbd "M-h") 'iflipb-next-buffer)
(global-set-key (kbd "M-H") 'iflipb-previous-buffer)

(require 'pabbrev)

(defun pabbrevx-ac-on-pre-command ()
  (if (or (eq this-command 'self-insert-command)
          (and (not (ac-trigger-command-p))
               (or (not (symbolp this-command))
                   (not (string-match "^ac-" (symbol-name this-command))))))
      (progn
        (remove-hook 'post-command-hook 'pabbrevx-ac-on-post-command t)
        (remove-hook 'pre-command-hook 'pabbrevx-ac-on-pre-command t)
        (ac-abort))))

(defun pabbrevx-ac-on-post-command ()
  (if (and (not isearch-mode)
           (ac-trigger-command-p))
      (pabbrevx-ac-start)))

(defun pabbrevx-ac-start ()
  (let ((candidates (mapcar 'car pabbrev-expansion-suggestions)))
    (add-hook 'pre-command-hook 'pabbrevx-ac-on-pre-command nil t)
    (add-hook 'post-command-hook 'pabbrevx-ac-on-post-command nil t)
    ;; ripped straight from ac-start
    (let* ((point (save-excursion (funcall ac-prefix-function)))
           (reposition (or (not (equal ac-point point))
                           ;; If menu direction is positive and next visual line belongs
                           ;; to same buffer line, then need reposition
                           (and (> ac-menu-direction 0)
                                (ac-menu-at-wrapped-line)))))
      (if (null point)
          (progn
            ;; need to nil this so pabbrev-expand-maybe-full we won't try
            ;; pabbrev expansion if user hits another TAB after ac aborts
            (setq pabbrev-last-expansion-suggestions nil)
            (ac-abort))          
        (setq ac-buffer (current-buffer))
        (setq ac-point point)
        (when (not (equal ac-point ac-old-point))
          (setq ac-old-point point))
        (setq ac-prefix (buffer-substring-no-properties point (point)))
        (setq ac-limit ac-candidate-max)
        (if (or reposition (null ac-menu))
            (save-excursion
              (funcall ac-init-function)))
        (let (;;candidates
              width
              (current-width (if ac-menu (ac-menu-width ac-menu) 0)))
          ;; (setq candidates (if (or ac-completing
          ;;                          (not (integerp ac-auto-start))
          ;;                          (>= (length ac-prefix) ac-auto-start))
          ;;                      (save-excursion
          ;;                        (funcall ac-candidate-function))))
          ;;(if ac-candidate-filter-function
          ;;    (setq candidates (funcall ac-candidate-filter-function candidates)))
          (setq width (let ((w '(0)) s)
                        (dotimes (i ac-candidate-menu-height)
                          (setq s (nth i candidates))
                          (if (stringp s) (push (string-width s) w)))
                        (apply 'max w)))
          (if (or reposition
                  (null ac-menu)
                  (> width current-width)
                  (< width (- current-width 10)))
              (ac-setup-menu point (* (ceiling (/ width 10.0)) 10)))
          (ac-update-candidates candidates))))))

(defun pabbrevx-suggestions-goto-buffer (suggestions)
  (pabbrevx-ac-start))

(fset 'pabbrev-suggestions-goto-buffer 'pabbrevx-suggestions-goto-buffer)

(require 'motion-and-kill-dwim)

(global-set-key "\M-w" 'copy-region-as-kill-dwim)
(global-set-key "\C-w" 'backward-kill-dwim)
(require 'regex-tool)

(require 'traverselisp)
(setq traverse-use-avfs t)
;(global-set-key (kbd "<f5> f") 'traverse-deep-rfind)
(global-set-key (kbd "C-c o") 'traverse-incremental-occur)

(defmacro define-buffer-visitor (visitor-name buffer-name command)
  `(defun ,visitor-name ()
     (interactive)
     (if (get-buffer ,buffer-name)
  (switch-to-buffer (if (equal ,buffer-name (buffer-name))
          nil
          ,buffer-name))
         (call-interactively ,command))))

;;(define-buffer-visitor visit-bitlbee "&bitlbee" #'erc)
;;(define-buffer-visitor visit-gnus "*Group*" #'gnus)
;;(define-buffer-visitor visit-sql "*SQL*" #'sql-mysql)
(define-buffer-visitor visit-scratch "*scratch*" #'scratch)
(define-buffer-visitor visit-shell "shell*" #'shell)
(global-set-key (kbd "F") 'visit-scratch)
(global-set-key (kbd "S") 'visit-shell)

;;(define-buffer-visitor visit-repl "*slime-repl sbcl*" #'slime)

(defalias 'perl-mode 'cperl-mode)
;;(require 'ack)
(require 'full-ack)
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
;;(load "d:/elisp/emacs-httpd.git/httpd.el")
;;(load "d:/elisp/emacs-httpd.git/httpd-buffers.el")

 (define-key isearch-mode-map "\C-o" 
          '(lambda ()(interactive)(isearch-process-search-char ?\n)))

(global-set-key "\M-1" 'isearch-complete)
  (defun kill-isearch-match ()
    "Kill the current isearch match string and continue searching."
    (interactive)
    (kill-region isearch-other-end (point)))

  (define-key isearch-mode-map [(control k)] 'kill-isearch-match)
  (define-key isearch-mode-map (kbd "C-c")
    (lambda ()
      (interactive)
      (save-excursion
        (comment-region (point-at-bol) (point-at-eol)))
      (if isearch-forward
          (isearch-repeat-forward)
          (isearch-repeat-backward))))
;;(require 'minibuf-isearch)
 (add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
      (when (and isearch-forward (not isearch-mode-end-hook-quit))
        (goto-char isearch-other-end)))

(defadvice isearch-exit (after my-goto-match-beginning activate)
      "Go to beginning of match."
      (when isearch-forward (goto-char isearch-other-end)))



  (defun zap-to-isearch (rbeg rend)
    "Kill the region between the mark and the closest portion of
  the isearch match string. The behaviour is meant to be analogous
  to zap-to-char; let's call it zap-to-isearch. The deleted region
  does not include the isearch word. This is meant to be bound only
  in isearch mode.

  The point of this function is that oftentimes you want to delete
  some portion of text, one end of which happens to be an active
  isearch word. The observation to make is that if you use isearch
  a lot to move the cursor around (as you should, it is much more
  efficient than using the arrows), it happens a lot that you could
  just delete the active region between the mark and the point, not
  include the isearch word."
    (interactive "r")
    (when (not mark-active)
      (error "Mark is not active"))
    (let* ((isearch-bounds (list isearch-other-end (point)))
           (ismin (apply 'min isearch-bounds))
           (ismax (apply 'max isearch-bounds))
           )
      (if (< (mark) ismin)
          (kill-region (mark) ismin)
        (if (> (mark) ismax)
            (kill-region ismax (mark))
          (error "Internal error in isearch kill function.")))
      (isearch-exit)
      ))

  (define-key isearch-mode-map [(meta z)] 'zap-to-isearch)
;; I-search with initial contents
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(defun nxml-custom-keybindings ()
    (define-key nxml-mode-map "\C-c\C-c" 'nxml-complete))

(add-hook 'nxml-mode-hook 'nxml-custom-keybindings)
(require 'multi-mode)
;;(require 'html-php)
;;multi-mode


(require 'fx-misc)

(add-hook 'nxml-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'which-func-functions)
		  '(nxml-which-function))))


;;---------------------------------
;; rest of your .emacs goes here

(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))



(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)



(defun mumamo-alt-php-write-contents ()
  "For `write-contents-functions' when `mumamo-chunk-alt-php' is used."
  (let ((here (point)))
    (save-match-data
      (save-restriction
        (widen)
;;        (condition-case nil
            (atomic-change-group
              (progn
                (while (re-search-forward "<\\(\"[^\"]*\"\\|'[^']*'\\|[^'\">?]\\)*>" nil t)
                 (setq phpstr (replace-regexp-in-string "(\\?" "<?" (match-string 0)))

                 (setq phpstr (replace-regexp-in-string "\\?)" "?>" phpstr))
                 (replace-match phpstr))
                (basic-save-buffer-1)
                ))
;;          )
)
      (set-buffer-modified-p nil))
    (goto-char here))
  ;; saved, return t
  t)

(put 'mumamo-alt-php-tags-mode 'permanent-local t)
(define-minor-mode mumamo-alt-php-tags-mode
  "Minor mode for using '(?php' instead of '<?php' in buffer.
When turning on this mode <?php is replace with (?php in the buffer.
If you write the buffer to file (?php is however written as <?php.

When turning off this mode (?php is replace with <?php in the buffer.

The purpose of this minor mode is to work around problems with
using the `nxml-mode' parser in php files.  `nxml-mode' knows
damned well that you can not have the character < in strings and
I can't make it forget that.  For PHP programmers it is however
very convient to use <?php ... ?> in strings.

There is no reason to use this minor mode unless you want XML
validation and/or completion in your php file.  If you do not
want that then you can simply use a multi major mode based on
`html-mode' instead of `nxml-mode'/`nxhtml-mode'.  Or, of course,
just `php-mode' if there is no html code in the file."
  :lighter "<?php "
  (if mumamo-alt-php-tags-mode
      (progn
        ;;(unless mumamo-multi-major-mode (error "Only for mumamo multi major modes"))
;;        (unless (let ((major-mode (mumamo-main-major-mode)))
;;                  (derived-mode-p 'nxml-mode))
          ;;(error "Mumamo multi major mode must be based on nxml-mode")
;;          )
;;        (unless (memq 'mumamo-chunk-alt-php (caddr mumamo-current-chunk-family))
;;          (error "Mumamo multi major must have chunk function mumamo-chunk-alt-php"))

        ;; Be paranoid about the file/content write hooks
        (when local-write-file-hooks ;; obsolete, but check!
          (error "Will not do this because local-write-file-hooks is non-nil"))
        (remove-hook 'write-contents-functions 'mumamo-alt-php-write-contents t)
        (when write-contents-functions
          (error "Will not do this because write-contents-functions is non-nil"))
        (when (delq 'recentf-track-opened-file (copy-sequence write-file-functions))
          (error "Will not do this because write-file-functions is non-nil"))

        (add-hook 'write-contents-functions 'mumamo-alt-php-write-contents t t)
        (put 'write-contents-functions 'permanent-local t)
        (save-restriction
          (let ((here (point)))
            (widen)
            (goto-char (point-min))
                (while (re-search-forward "<\\(\"[^\"]*\"\\|'[^']*'\\|[^'\">?]\\)*>" nil t)
                 (setq phpstr (replace-regexp-in-string "<\\?" "(?" (match-string 0)))
                 (setq phpstr (replace-regexp-in-string "\\?>" "?)" phpstr))
                 (replace-match phpstr))
                  )))
    (save-restriction
      (let ((here (point)))
        (widen)
        (goto-char (point-min))
                (while (re-search-forward "<\\(\"[^\"]*\"\\|'[^']*'\\|[^'\">?]\\)*>" nil t)
                 (setq phpstr (replace-regexp-in-string "(\\?" "<?" (match-string 0)))
                 (setq phpstr (replace-regexp-in-string "\\?)" "?>" phpstr))
                 (replace-match phpstr))          
                 ))
    (remove-hook 'write-contents-functions 'mumamo-alt-php-write-contents t)))



(require 'xmlgen)
(require 'dom)
(require 'xpath)
(require 'xpath-parser)

(require 'egg)



