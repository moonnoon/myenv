;;start package.el with emacs
(require 'package)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(dired-listing-switches "-alh")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(lsp-clients-clangd-args (quote ("-background-index")))
 '(lsp-gopls-server-args nil)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (helm-tramp rjsx-mode google-translate youdao-dictionary helm-chrome-control org helm-lsp goto-chg minions doom-modeline color-identifiers-mode treemacs-magit vterm treemacs vimish-fold go-mode company-lsp company irony flycheck-irony company-irony helm-xref ggtags ccls lsp-mode lsp-ui exec-path-from-shell ace-window anzu auctex avy cnfonts company-c-headers company-jedi company-quickhelp elpy flycheck google-c-style helm helm-ag helm-projectile helm-swoop iedit imenu-list ivy magit move-text multiple-cursors pyenv swiper switch-window undo-tree use-package virtualenvwrapper volatile-highlights which-key yasnippet yasnippet-snippets ztree zzz-to-char)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(vterm-keymap-exceptions (quote ("C-c" "C-x" "C-g" "M-x" "M-o" "C-y" "M-y")))
 '(which-key-idle-delay 2.0))


;; about-emacs
(setq inhibit-startup-message t)

;; font
(add-to-list 'default-frame-alist '(font . "SF Mono-14"))
;; C-x C-0, C-x C--, C-x C-+/= to change font size
;; cnfonts
;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :name "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 11.0))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    charset
;;    (font-spec :name "-MS  -Microsoft YaHei-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;;               :weight 'normal
;;               :slant 'normal
;;               :size 11.5)))
;; 
;; (setq gc-cons-threshold 20000000)
;; (setq garbage-collection-messages t)
(setq scroll-conservatively most-positive-fixnum) ;; scroll one line

;; chinese 
;; (setq default-input-method "quanpin")
;; C-\ to switch

;; show parentheses match
;; (show-paren-mode t)
(add-hook 'prog-mode-hook 'show-paren-mode)
;; M-( insert-parentheses

;; C-k kill whole line
(setq kill-whole-line t)

;; replace selection
(delete-selection-mode t)

;; (global-hl-line-mode t)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; linum
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; whitespace-mode

;; (setq debug-on-error t) toggle-debug-on-error

(server-start)

;; initialize package.el
(package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (package-install-selected-packages)

;; display what changed
(volatile-highlights-mode t)

(minions-mode)

;; goto last change
;; (require 'goto-chg)

;; smart parentheses
;; (smartparens-global-mode t)

;; cedet
;; (load-file (concat user-emacs-directory "cedet/cedet-devel-load.el"))
;; (load-file (concat user-emacs-directory "cedet/contrib/cedet-contrib-load.el"))

(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode t)
(global-semantic-idle-scheduler-mode t)
;; (setq semantic-idle-scheduler-idle-time 5)
;; M-x semantic-idle-summary-mode
;; (semantic-mode t)
;; (semantic-add-system-include "/usr/local/include")
;; (semantic-add-system-include "/usr/include/x86_64-linux-gnu/")
;; (define-key c-mode-base-map (kbd "M-RET") 'semantic-ia-fast-jump)
;; (define-key c-mode-base-map (kbd "C-c C-s") 'semantic-ia-show-summary)

;; start company with emacs
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key (kbd "<C-return>") 'company-complete)
(setq company-idle-delay 0.01)
(setq company-minimum-prefix-length 1)
(setq company-require-match nil)
;; case sensitive in plain text mode
(setq company-dabbrev-downcase nil)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (setq company-backends (delete 'company-clang company-backends))
;; (define-key company-active-map (kbd "<return>") nil)
;; (define-key company-active-map (kbd "<SPC>") nil)
;; (setq company-auto-complete nil)
(add-hook 'gud-mode-hook (lambda() (company-mode -1)))

;; don't use it in init
;; (add-to-list 'company-c-headers-path-system "")

;; python company
(add-hook 'inferior-python-mode-hook (lambda() (company-mode -1)))
;; elpy
;; (require 'elpy)
;; (elpy-enable)
;; (setq elpy-rpc-python-command "python3")
;; (setq elpy-rpc-backend "jedi")
(setq eldoc-idle-delay 2)
;; C-c C-d to show doc
;; (company-quickhelp-mode)
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
;; use ipython, 
;; (setq python-shell-interpreter "ipython3"
;;       python-shell-interpreter-args " -i --simple-prompt --pprint")
;; C-c C-c to eval current buffer, C-c C-z to switch shell, C-RET to eval current line


;; start yasnippet with emacs
(require 'yasnippet)
(yas-reload-all)
;; (yas-global-mode t)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; iedit
(require 'iedit)
;; see C-h f iedit-mode
;; C-u C-' to specify how many line before/after occurrences

;; anzu
(global-anzu-mode)
;; anzu-query-replace etc...

;; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (setq c-default-style "linux"
;;       c-basic-offset 4)

;;ggtags
;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (when (derived-mode-p 'c-mode 'c++-mode 'asm-mode)
;; 	      (ggtags-mode t))))

;;helm
(require 'helm-config)
;; (helm-mode t)
;; helm-mini M-a to mark all, M-m toggle mark all, C-c d to kill marked buffer(M-D kill marked and quit), C-a to show hidden buffer, C-] to show full name
;; pattern: *[!,exclude]mode buffername @search , C-s to list search result (search content in filtered buffer)
;; C-c _ toggle full frame, C-c C-u recalc and redisplay
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c C-f") 'helm-find) ;;find file, C-u to change dir, suspend/resume update with C-!
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
;; prefix l helm-locate 
;; prefix i helm-semantic-or-imenu
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
;; helm-command-prefix b to helm-resume
;; make <tab> work normally, like C-j in helm.
;; (define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
;; add <tab> helm-execute-persistent-action in helm-map helm-core/helm.el
;; C-i to select actions
;; save buffer [f4] in actions
(with-eval-after-load "helm"
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))
(with-eval-after-load "helm-regexp"
  (define-key helm-command-map (kbd "o") 'helm-occur))
;; <tab> is a single key, TAB is C-i
(setq helm-split-window-in-side-p t
      helm-echo-input-in-header-line nil)
(setq helm-imenu-execute-action-at-once-if-one nil)
;; helm case sensitive
;; (setq helm-case-fold-search nil)

;; C-c h p helm-list-emacs-process

;; \b match boundary, \< begin of word, \> end of word
;; \bword\b or \<word\> to match whole word

;;helm-ag
(global-set-key (kbd "C-c r") 'helm-do-ag) ;; C-u to specify file type
(global-set-key (kbd "C-c b") 'helm-do-ag-buffers)
;; (global-set-key (kbd "C-c f") 'helm-do-ag-this-file)
(global-set-key (kbd "C-c s") 'helm-swoop) ;; swiper is alternative
;; helm-multi-swoop
;; M-i during isearch to invok swoop ;; M-i during swoop to swoop all buffer
;; C-u 'num' helm-swoop to search multiline
;; M-n to put current content to mini-buffer
;; (follow-mode t)
;; (setq-default helm-follow-mode-persistent t)
;; helm-follow-mode C-c C-f

;; projectile
(projectile-mode)
(setq helm-projectile-fuzzy-match nil)
(helm-projectile-on)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; C-c p p helm-projectile-switch-project, C-d open dired, M-D delete
;; C-c p f helm-projectile-find-file
;; C-c p F helm-projectile-find-file-in-known-projects
;; C-c p d helm-projectile-find-dir
;; C-c p e helm-projectile-recentf
;; C-c p a helm-projectile-find-other-file, same name different extensions
;; e.g. (add-to-list 'projectile-other-file-alist '("html", "js"))
;; C-c p l projectile-find-file-in-directory
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)
(setq projectile-completion-system 'helm)
(setq projectile-track-known-projects-automatically nil) ;; use projectile-add-known-project
;; C-c p i projectile-invalidate-cache, use it after add a new file
;; (add-to-list 'projectile-globally-ignored-files "*.pyc")
(add-to-list 'projectile-globally-ignored-file-suffixes "pyc")
;; (add-to-list 'projectile-globally-ignored-directories "app")
(with-eval-after-load "helm-projectile"
  (define-key projectile-mode-map (kbd "C-c p s") 'helm-projectile-ag))
;; C-c p s s helm-projectile-ag

;; avy
(global-set-key (kbd "s-g") 'avy-goto-word-1)
;; (global-set-key (kbd "s-g") 'avy-goto-char-timer)
(with-eval-after-load "avy"
  (setq avy-timeout-seconds 0.3))
;; (global-set-key (kbd "s-g") 'avy-goto-word-0)
;; zzz-to-char substitute of zap-to-char
(global-set-key (kbd "M-z") #'zzz-up-to-char)
(setq zzz-to-char-reach 800)

;; M-SPC to run just-one-space

;; switch window
;; (setq switch-window-shortcut-style 'qwerty)
;; (global-set-key (kbd "C-x o") 'switch-window)
;; (setq switch-window--auto-resize-window t)
;; (switch-window-mouse-mode)

;; use ace-window now
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-scope 'frame)
;; C-u M-o or M-o m to swap window
;; C-u C-u M-o or M-o x to delete window

(winner-mode t)
;; C-c <left>	winner-undo
;; C-c <right>	winner-redo
;; follow-mode to read doc

;; undo tree
;; C-x u
(global-undo-tree-mode t)

;; complete file name
(fset 'my-complete-file-name
      (make-hippie-expand-function '(try-complete-file-name-partially
				     try-complete-file-name)))
(global-set-key (kbd "M-/") 'my-complete-file-name)

;; fold code
;; (add-hook 'c-mode-common-hook 'hs-minor-mode)
;; (global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)

;; shell
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; M-x ansi-term
;; M-x become C-x M-x in ansi-term, C-x is the prefix
;; use C-c C-j to switch to term-char-mode, C-c C-k to switch to term-line-mode
;; or use ctrl/shift-insert to copy/paste

(add-hook 'eshell-mode-hook (lambda() (company-mode -1)))

;; (setq explicit-shell-file-name "/bin/zsh")
;; ;; (setq term-ansi-default-program "/bin/bash")
;; ;; (setq term-buffer-maximum-size 4096) ;; default 2048
;; ;; (term-pager-enable)

;; (defun term-send-mark  () (interactive) (term-send-raw-string "\000"))
;; (defun term-send-Cleft () (interactive) (term-send-raw-string "\e[1;5D"))
;; (defun term-send-Cright() (interactive) (term-send-raw-string "\e[1;5C"))
;; (defun term-send-Mleft () (interactive) (term-send-raw-string "\e[1;3D"))
;; (defun term-send-Mright() (interactive) (term-send-raw-string "\e[1;3C"))
;; (with-eval-after-load "term"
;;   (define-key term-raw-map (kbd "C-SPC") 'term-send-mark)
;;   (define-key term-raw-map (kbd "C-<left>") 'term-send-Cleft)
;;   (define-key term-raw-map (kbd "C-<right>") 'term-send-Cright)
;;   (define-key term-raw-map (kbd "M-<left>") 'term-send-Mleft)
;;   (define-key term-raw-map (kbd "M-<right>") 'term-send-Mright)
;;   (define-key term-raw-map (kbd "M-x") nil)
;;   (define-key term-raw-map (kbd "M-:") nil))

;; vterm
;; C-c C-t to copy mode
;; (add-hook 'vterm-mode-hook (lambda () (global-hl-line-mode -1)))

;; multi-term
;; (defun term-send-f ()
;;   "Send ESC in term mode."
;;   (interactive)
;;   (term-send-raw-string "^[O1;2P"))
;; (setq term-bind-key-alist
;;       (list (cons "<f2>" 'term-send-f)
;; 	    (cons "<f3>" 'term-send-raw-meta)
;; 	    (cons "C-;" 'term-send-raw-meta)
;; 	    (cons "<escape>" 'term-send-raw-meta)
;; 	    (cons "M-p" 'term-send-raw-meta)
;; 	    (cons "M-n" 'term-send-raw-meta)))


;; tab bar
;; (global-set-key [M-left] 'tabbar-backward-tab)
;; (global-set-key [M-right] 'tabbar-forward-tab)

;; window size
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
;; C-x 0 to combine window


;; M-x revert-buffer

;; Compilation
;; (global-set-key (kbd "<f5>") (lambda ()
;;                                (interactive)
;;                                (setq-local compilation-read-command nil)
;;                                (call-interactively 'compile)))
(add-hook 'c-mode-common-hook
          (lambda ()
	    (set (make-local-variable 'compile-command)
		 (concat "g++ -g -Wall -std=c++11 " buffer-file-name))))
(define-key c++-mode-map [f5] 'recompile)

;; gdb
(setq gdb-many-windows t
      gdb-show-main t)
;; gdb-display-gdb-buffer : other GDb buffers are also killed when kill this buffer
;; gdb-display-locals-buffer
;; gdb-display-io-buffer ;; use it to input and output
;; gdb-display-stack-buffer
;; gdb-display-breakpoints-buffer ...
;; replace display by frame to get frame

(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
	 (bury-buffer "*compilation*")
	 (winner-undo)
	 (message "Build successful."))
	(t                                                                    
	 (message "Compilation exited abnormally: %s" string))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "light cyan"))))
 '(iedit-occurrence ((t (:inherit highlight :background "Green"))))
 '(lsp-ui-sideline-code-action ((t (:foreground "dark gray")))))

;; irony-mode
;; see C-h v company-backends
;; (add-to-list 'company-backends '(company-irony :with company-dabbrev-code))
;; (add-to-list 'company-backends 'company-irony)
;; (add-hook 'c-mode-common-hook 'irony-mode)
;; (add-to-list 'company-backends 'company-c-headers)
;; (with-eval-after-load "company-c-headers"
;;   (add-to-list 'company-c-headers-path-system "/Library/Developer/CommandLineTools/usr/include/c++/v1"))
;; (add-hook 'c++-mode-hook
;; 	  (lambda ()
;; 	    (setq irony-additional-clang-options '("-std=c++11"))
;; 	    (flycheck-mode t)))
	    ;; (setq flycheck-idle-change-delay 6
	    ;; 	  flycheck-check-syntax-automatically
	    ;; 	  '(idle-change))))

;; M-x irony-server-kill to kill irony-server
;; (with-eval-after-load "flycheck"
;; ;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(with-eval-after-load "flycheck"
  (setq flycheck-idle-change-delay 5
	flycheck-idle-buffer-switch-delay 5
	flycheck-display-errors-delay 2
	flycheck-check-syntax-automatically '(save idle-change mode-enabled)))
  


;; change window orientation, rotate
(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))
(global-set-key (kbd "C-c t") 'window-toggle-split-direction)


;; move-text. M-up, M-down to move line or region
(move-text-default-bindings)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; C-' to hidden all lines without cursor, C-' again to unhidden. (mc-hide-unmatched-lines-mode)
;; set-rectangular-region-anchor, mc/insert-numbers ...
;; C-x spc (rectangle-mark-mode)

;; shell path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; magit
;; magit-find-file to open rev:file (can open current rev in magit-log-buffer-file)
(global-set-key (kbd "C-x g") 'magit-status)
(with-eval-after-load "magit"
  (define-key magit-mode-map [C-tab] nil)
  (define-key magit-file-mode-map
    (kbd "C-c g") 'magit-file-dispatch))

(global-set-key (kbd "C-<tab>") 'mode-line-other-buffer)

(defun delete-word (arg)
  "delete word instead of kill"
  (interactive "p")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-region (point) (progn (forward-word arg) (point)))))
(defun backward-delete-word (arg)
  "delete instead of kill"
  (interactive "p")
  (delete-word (- arg)))
(defun backward-delete-line (arg)
  "delete instead of kill"
  (interactive "p")
  (delete-region (point)
		 (beginning-of-visual-line (- 2 arg))))
(global-set-key (kbd "M-d") 'delete-word)
(global-set-key (kbd "M-DEL") 'backward-delete-word)
(global-set-key (kbd "<s-backspace>") 'backward-delete-line)

(defun copy-file-name ()
  "copy current file name"
  (interactive)
  (kill-new buffer-file-name)
  (message "copyed"))
(global-set-key (kbd "C-,") 'copy-file-name)

;; tramp
;; (with-eval-after-load "tramp"
;;   (setq tramp-verbose 2)
;;   (add-to-list 'tramp-remote-process-environment "GOPATH="))
;; (add-to-list 'tramp-remote-path "~/bin")
;; use tramp to sudo
;; C-x C-f /su::/etc/hostname or use C-c r in helm-find-files

;; imenu
;; (imenu-list-minor-mode)
;; (global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
;; (setq imenu-list-auto-resize t)

;; which-key
;; (which-key-mode)

;; ztree
;; ztree-dir ztree-diff

;; treemacs
;; oaa to use ace-window to decide which window to open.
(with-eval-after-load "ace-window"
  (setq aw-ignored-buffers (delete 'treemacs-mode aw-ignored-buffers)))

;; C-j eval-print-last-sexp, lisp-interaction-mode


;; M-x list-processes to see processes

;; C-x C-r to open read only
;; C-x C-q toggle read only
;; dired: C-c C-c to finish edit

;; C-x C-+/-/0... 


;; f3 start macro f4 to end or call, insert f3 after f3 to insert a counter 0 1 2 3 4...

;; M-x profiler-start RET RET
;; M-x profiler-report


;; ediff ?
;; a, b, ra, rb
;; ediff-buffers

;; narrow-to-region (C-x n n) and widen (C-x n w)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; downcase-word (M-l) upcase-word (M-u)

;; youdao
(global-set-key (kbd "C-c d") #'youdao-dictionary-search-at-point)
;; youdao-dictionary-search-from-input

;; google translate
(with-eval-after-load "google-translate"
  ;; C-n C-p to switch between [Chinese => English] and [English => Chinese]
  (setq google-translate-translation-directions-alist '(("zh-CN" . "en") ("en" . "zh-CN"))))

;; lsp
(require 'lsp)
;; (add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-common-hook #'lsp-deferred)
(setq lsp-prefer-flymake nil)
(setq lsp-imenu-sort-methods '(position))
(setq lsp-keep-workspace-alive nil)
(define-key lsp-mode-map [remap xref-find-apropos] #'lsp-find-references)
(setq lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
;; lsp-workspace-folder-remove

;; (require 'ccls)
;; (setq ccls-executable "~/tools/ccls")
;; (unload-feature 'ccls)
;; (defun ccls/callee ()
;;   (interactive)
;;   (lsp-ui-peek-find-custom "$ccls/call" '(:callee t)))
;; (defun ccls/caller ()
;;   (interactive)
;;   (lsp-ui-peek-find-custom "$ccls/call"))

;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
(defun my-lsp-ui-doc-frame-hook (frame window)
  (message "hello, this is frame hook")
  (set-frame-parameter frame 'alpha '(100 . 100)))
(with-eval-after-load "lsp-ui"
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-delay 0.2)
  (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-doc-use-childframe t)
  (setq lsp-ui-doc-alignment 'window)
  ;; (add-hook 'lsp-ui-doc-frame-hook 'my-lsp-ui-doc-frame-hook)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-delay 1)
  (setq lsp-ui-sideline-ignore-duplicate t)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))


(require 'helm-xref)
(if (< emacs-major-version 27)
    (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
  (setq xref-show-xrefs-function 'helm-xref-show-xrefs-27))

;; (which-function-mode)
(add-hook 'prog-mode-hook 'which-function-mode)

;; color-identifiers-mode
(add-hook 'after-init-hook 'global-color-identifiers-mode)
;; (setq color-identifiers-coloring-method 'hash)


;; golang
(add-hook 'go-mode-hook #'lsp-deferred)
;; (setenv "GOPATH" "")
(add-to-list 'projectile-globally-ignored-directories "vendor")


(add-hook 'python-mode-hook #'lsp-deferred)
(setq eldoc-idle-delay 1)

;; js
(add-hook 'js-mode-hook #'lsp-deferred)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

;; org mode

(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-<tab>") nil))

(global-set-key (kbd "C-c c") 'helm-chrome-control)
