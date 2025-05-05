;;; post-init.el --- Post-Init -*- no-byte-compile: t; lexical-binding: t; -*-
;; ~/.config/emacs/post-init.el

;;; Frame parameters
;; Start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Start every frame in fullscreen
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))

;;; Loading user files and package configurations
;;; Source: https://stackoverflow.com/a/2079146
(defun load-user-file (file)
  (interactive "f")
  "Load a file in the minimal-emacs-user-directory"
  (load-file (expand-file-name file minimal-emacs-user-directory)))
(defun load-package-config (file)
  (interactive "f")
  "Load a file in the 'elisp/packages' subdirectory of the minimal-emacs-user-directory"
  (load-file (expand-file-name (concat "elisp/packages/" file) minimal-emacs-user-directory)))

;;; Optimizations
(load-package-config "optimizations/compile-angel-config.el")

;;; Theme
(load-package-config "themes/catppuccin-theme-config.el")

;;; Fonts
;; Set the default font
(set-face-attribute 'default nil
  :font "JetBrainsMono Nerd Font Mono" :height 160 :weight 'semi-bold)
;; Set the fixed-pitch font
(set-face-attribute 'fixed-pitch nil
  :font "JetBrainsMono Nerd Font Mono" :height 160 :weight 'semi-bold)
;; Set the variable-pitch font
(set-face-attribute 'variable-pitch nil
  :font "Iosevka Aile" :height 160 :weight 'semi-bold)

;;; Tab bars
;; Configure the `tab-bar-show` variable to 1 to display the tab bar exclusively
;; when multiple tabs are open:
(setopt tab-bar-show 1)

;;; Data files
;; Prevent Emacs from saving customization information to a custom file
(setq custom-file null-device)

;;; Package management
(load-package-config "package-management/auto-package-update-config.el")

;;; Enhanced help buffer
(load-package-config "enhanced-help-buffer/helpful-config.el")

;;; Auto-revert, recentf, savehist, and saveplace
(load-package-config "misc/autorevert-config.el")
(load-package-config "misc/recentf-config.el")
(load-package-config "misc/savehist-config.el")
(load-package-config "misc/saveplace-config.el")

;;; Autosave
;; Enable `auto-save-mode' to prevent data loss. Use `recover-file' or
;; `recover-session' to restore unsaved changes.
(setq auto-save-default t)

(setq auto-save-interval 300)
(setq auto-save-timeout 30)

;;; Session management
(load-package-config "session-management/easysession-config.el")
(load-package-config "session-management/persist-text-scale-config.el")

;;; Buffer management
(load-package-config "buffer-management/buffer-terminator-config.el")

;;; Version control
(load-package-config "version-control/undo-fu-config.el")
(load-package-config "version-control/undo-fu-session-config.el")

;;; Language Server Protocol (LSP)
(load-package-config "lsp/eglot-config.el")

;;; Code formatting
(load-package-config "code-formatting/stripspace-config.el")
(load-package-config "code-formatting/apheleia-config.el")
(load-package-config "code-formatting/aggressive-indent-config.el")
(load-package-config "code-formatting/highlight-defined-config.el")
(load-package-config "code-formatting/paredit-config.el")
(load-package-config "code-formatting/page-break-lines-config.el")
(load-package-config "code-formatting/elisp-refs-config.el")

;;; Code completion
(load-package-config "code-completion/corfu-config.el")
(load-package-config "code-completion/cape-config.el")

;;; Vertico, Orderless, Marginalia, Embark, and Consult
(load-package-config "misc/vertico-config.el")
(load-package-config "misc/orderless-config.el")
(load-package-config "misc/marginalia-config.el")
(load-package-config "misc/embark-config.el")
(load-package-config "misc/consult-config.el")

;;; Code snippets
(load-package-config "code-snippets/yasnippet-config.el")
(load-package-config "code-snippets/yasnippet-snippets-config.el")

;;; Tree-sitter integration
(load-package-config "tree-sitter/treesit-auto-config.el")

;;; Spell checker
(load-package-config "spell-checking/ispell-config.el")
(load-package-config "spell-checking/flyspell-config.el")

;; Code folding
(load-package-config "code-folding/outline-config.el")

;;; Code navigation
(load-package-config "code-navigation/avy-config.el")

;;; File management
(load-package-config "file-management/treemacs-config.el")

;;; Org mode
(load-package-config "org-mode/org-config.el")
(load-package-config "org-mode/ox-latex-config.el")

;;; Markdown mode
(load-package-config "markdown-mode/markdown-mode-config.el")
(load-package-config "markdown-mode/markdown-toc-config.el")

;;; Miscellaneous
;; Allow Emacs to upgrade built-in packages, such as Org mode
(setq package-install-upgrade-built-in t)

;; Enable visual line mode globally
(global-visual-line-mode t)

;; When Delete Selection mode is enabled, typed text replaces the selection
;; if the selection is active.
(delete-selection-mode 1)

;; Display the current line and column numbers in the mode line
(setq line-number-mode t)
(setq column-number-mode t)
(setq mode-line-position-column-line-format '("%l:%C"))

;; Display of line numbers in the buffer
(setq-default display-line-numbers-type 'relative)
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'display-line-numbers-mode))
(global-display-line-numbers-mode 1)

;; Set the maximum level of syntax highlighting for Tree-sitter modes
(setq treesit-font-lock-level 4)

;; which-key
(load-package-config "misc/which-key-config.el")

;; Display the time in the modeline
(add-hook 'after-init-hook #'display-time-mode)

;; Paren match highlighting
(add-hook 'after-init-hook #'show-paren-mode)

;; Track changes in the window configuration, allowing undoing actions such as
;; closing windows.
(add-hook 'after-init-hook #'winner-mode)

;; uniquify
(load-package-config "misc/uniquify-config.el")

;; Window dividers separate windows visually. Window dividers are bars that can
;; be dragged with the mouse, thus allowing you to easily resize adjacent
;; windows.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Dividers.html
(add-hook 'after-init-hook #'window-divider-mode)

;; Constrain vertical cursor movement to lines within the buffer
(setq dired-movement-style 'bounded-files)

;; Dired buffers: Automatically hide file details (permissions, size,
;; modification date, etc.) and all the files in the `dired-omit-files' regular
;; expression for a cleaner display.
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; Hide files from dired
(setq dired-omit-files (concat "\\`[.]\\'"
                               "\\|\\(?:\\.js\\)?\\.meta\\'"
                               "\\|\\.\\(?:elc|a\\|o\\|pyc\\|pyo\\|swp\\|class\\)\\'"
                               "\\|^\\.DS_Store\\'"
                               "\\|^\\.\\(?:svn\\|git\\)\\'"
                               "\\|^\\.ccls-cache\\'"
                               "\\|^__pycache__\\'"
                               "\\|^\\.project\\(?:ile\\)?\\'"
                               "\\|^flycheck_.*"
                               "\\|^flymake_.*"))
(add-hook 'dired-mode-hook #'dired-omit-mode)

;; dired: Group directories first
(with-eval-after-load 'dired
  (let ((args "--group-directories-first -ahlv"))
    (when (or (eq system-type 'darwin) (eq system-type 'berkeley-unix))
      (if-let* ((gls (executable-find "gls")))
          (setq insert-directory-program gls)
        (setq args nil)))
    (when args
      (setq dired-listing-switches args))))

;; Enables visual indication of minibuffer recursion depth after initialization
(add-hook 'after-init-hook #'minibuffer-depth-indicate-mode)

;; Configure Emacs to ask for confirmation before exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; Enabled backups save your changes to a file intermittently
(setq make-backup-files t)
(setq vc-make-backup-files t)
(setq kept-old-versions 10)
(setq kept-new-versions 10)

;; When tooltip-mode is enabled, certain UI elements (e.g., help text,
;; mouse-hover hints) will appear as native system tooltips (pop-up windows),
;; rather than as echo area messages. This is useful in graphical Emacs sessions
;; where tooltips can appear near the cursor.
(setq tooltip-hide-delay 20)    ; Time in seconds before a tooltip disappears (default: 10)
(setq tooltip-delay 0.4)        ; Delay before showing a tooltip after mouse hover (default: 0.7)
(setq tooltip-short-delay 0.08) ; Delay before showing a short tooltip (Default: 0.1)
(tooltip-mode 1)

;; server
(load-package-config "misc/server-config.el")

;;; Evil mode
(load-package-config "evil-mode/evil-config.el")
(load-package-config "evil-mode/evil-collection-config.el")
(load-package-config "evil-mode/evil-surround-config.el")
(load-package-config "evil-mode/enhanced-evil-paredit-config.el")
(load-package-config "evil-mode/vim-tab-bar-config.el")
