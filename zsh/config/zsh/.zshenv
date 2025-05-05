#!/usr/bin/env zsh
# ~/.zshenv
# Environment variables for XDG Base Directory specification-compliant user-directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Environment variables for Zsh user-directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_DATA_DIR="$XDG_DATA_HOME/zsh"
export ZSH_STATE_DIR="$XDG_STATE_HOME/zsh"
export ZSH_FUNCTIONS_DIR="$ZDOTDIR/functions"
export ZSH_SCRIPTS_DIR="$HOME/Projects/Programming/scripts/zsh"
export ZSH_THEMES_DIR="$ZDOTDIR/themes"

# Create Zsh user-directories if they don't already exist
[ -d "$ZDOTDIR" ] || mkdir -p "$ZDOTDIR"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -d "$ZSH_DATA_DIR" ] || mkdir -p "$ZSH_DATA_DIR"
[ -d "$ZSH_STATE_DIR" ] || mkdir -p "$ZSH_STATE_DIR"
[ -d "$ZSH_FUNCTIONS_DIR" ] || mkdir -p "$ZSH_FUNCTIONS_DIR"
[ -d "$ZSH_SCRIPTS_DIR" ] || mkdir -p "$ZSH_SCRIPTS_DIR"
[ -d "$ZSH_THEMES_DIR" ] || mkdir -p "$ZSH_THEMES_DIR"

# Set paths for histfile, zcompcache, and zcompdump
export HISTFILE="$ZSH_STATE_DIR/history"
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"

# Source a secondary .zshenv file if it exists in $ZDOTDIR
[ -f "$ZDOTDIR/.zshenv_secondary" ] && . "$ZDOTDIR/.zshenv_secondary"

# References:
## XDG specifications
### "Interoperability specifications". https://www.freedesktop.org/wiki/Specifications/
### "XDG Base Directory Specification". https://specifications.freedesktop.org/basedir-spec/latest/
### "XDG Base Directory". https://wiki.archlinux.org/title/XDG_Base_Directory

## Zsh
### "Unlimited history in zsh". https://unix.stackexchange.com/a/273863
### "Shell startup scripts". https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
### "What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?". https://unix.stackexchange.com/a/71258
### "ZSH: .zprofile, .zshrc, .zlogin - What goes where?". https://apple.stackexchange.com/a/388623
### "Homebrew PATH set in .zshenv is overridden". https://apple.stackexchange.com/a/432227
### "Why are interactive shells on OSX login shells by default?". https://unix.stackexchange.com/a/119675
### "Faster and enjoyable ZSH (maybe)". https://htr3n.github.io/2018/07/faster-zsh/
### "zsh: command not found: {compinstall,compinit,compdef}". https://unix.stackexchange.com/a/477909
