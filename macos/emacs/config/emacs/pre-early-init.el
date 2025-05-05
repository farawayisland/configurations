;;; pre-early-init.el --- Pre-Early Init -*- no-byte-compile: t; lexical-binding: t; -*-
;; ~/.config/emacs/pre-early-init.el

;;; PATH
;; Temporary fix: Explicitly set PATH environment variable and update exec-path to match it
;; The string here should be copied from the PATH in $(brew --cellar emacs-plus@30)/30.1/Emacs.app/Contents/Info.plist
;; Source: https://github.com/d12frosted/homebrew-emacs-plus/issues/733#issuecomment-2368746692
(setenv "PATH" "/opt/homebrew/opt/zsh/bin:/opt/homebrew/opt/zip/bin:/opt/homebrew/opt/vim/bin:/opt/homebrew/opt/unzip/bin:/opt/homebrew/opt/python/libexec/bin:/opt/homebrew/opt/perl/bin:/opt/homebrew/opt/make/libexec/gnubin:/opt/homebrew/opt/llvm/bin:/opt/homebrew/opt/gzip/bin:/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/gnu-which/libexec/gnubin:/opt/homebrew/opt/gnu-tar/libexec/gnubin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/opt/gawk/libexec/gnubin:/opt/homebrew/opt/git/bin:/opt/homebrew/opt/findutils/libexec/gnubin:/opt/homebrew/opt/curl/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/opt/binutils/bin:/opt/homebrew/opt/bash/bin:/opt/homebrew/bin:/Users/Nyx/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/TeX/texbin:/Applications/kitty.app/Contents/MacOS")
(setq exec-path (split-string (getenv "PATH") path-separator))

;;; Debugging
;; Debug on error
(setq debug-on-error t)

;;; Data files
;; Reducing clutter in ~/.config/emacs by redirecting files to ~/.config/emacs/var
(setq user-emacs-directory (expand-file-name "var/" minimal-emacs-user-directory))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;;; Package management
;; By default, minimal-emacs-package-initialize-and-refresh is set to t, which
;; makes minimal-emacs.d call the built-in package manager. Since Elpaca will
;; replace the package manager, there is no need to call it.
(setq minimal-emacs-package-initialize-and-refresh nil)
