#!/usr/bin/env zsh
# ~/.zshenv
# Environment variables for XDG Base Directory specification-compliant user-directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Environment variables for miscellaneous user-directories which would be
# created if they don't already exist
## Projects
export PROJECTS="$HOME/Projects"
[ -d "$PROJECTS" ] || mkdir -p "$PROJECTS"

### Programming
export PROGRAMMING="$PROJECTS/Programming"
[ -d "$PROGRAMMING" ] || mkdir -p "$PROGRAMMING"

#### Scripts
export SCRIPTS="$PROGRAMMING/scripts" # Git-tracked
[ -d "$SCRIPTS" ] || mkdir -p "$SCRIPTS"

### Typesetting
export TYPESETTING="$PROJECTS/Typesetting"
[ -d "$TYPESETTING" ] || mkdir -p "$TYPESETTING"

## Homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
[ -d "$HOMEBREW_PREFIX" ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Executable
export BREW_EXECUTABLE="$HOMEBREW_PREFIX/bin/brew"

## Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_DATA_DIR="$XDG_DATA_HOME/zsh"
export ZSH_EXECUTABLE="$HOMEBREW_PREFIX/opt/zsh/bin/zsh"
export ZSH_SCRIPTS_DIR="$SCRIPTS/zsh"
export ZSH_SCRIPTS_DIR_PRIVATE="$SCRIPTS/.private/zsh"
export ZSH_STATE_DIR="$XDG_STATE_HOME/zsh"
[ -d "$ZDOTDIR" ] || mkdir -p "$ZDOTDIR"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -d "$ZSH_DATA_DIR" ] || mkdir -p "$ZSH_DATA_DIR"
[ -d "$ZSH_SCRIPTS_DIR" ] || mkdir -p "$ZSH_SCRIPTS_DIR"
[ -d "$ZSH_SCRIPTS_DIR_PRIVATE" ] || mkdir -p "$ZSH_SCRIPTS_DIR_PRIVATE"
[ -d "$ZSH_STATE_DIR" ] || mkdir -p "$ZSH_STATE_DIR"
[ -f "$ZSH_EXECUTABLE" ] || "$BREW_EXECUTABLE" install zsh

### Functions
export ZSH_FUNCTIONS_DIR="$ZDOTDIR/functions"
[ -d "$ZSH_FUNCTIONS_DIR" ] || mkdir -p "$ZSH_FUNCTIONS_DIR"

### History and completion cache
export HISTFILE="$ZSH_STATE_DIR/history"
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"

### Themes
export ZSH_THEMES_DIR="$ZDOTDIR/themes"
[ -d "$ZSH_THEMES_DIR" ] || mkdir -p "$ZSH_THEMES_DIR"

## Emacs
export EMACS_CONFIG_DIR="$XDG_CONFIG_HOME/emacs"
[ -d "$EMACS_CONFIG_DIR" ] || mkdir -p "$EMACS_CONFIG_DIR"

## Java
export JAVA_CONFIG_DIR="$XDG_CONFIG_HOME/java"
export JAVA_HOME="$(/usr/libexec/java_home)"
[ -d "$JAVA_CONFIG_DIR" ] || mkdir -p "$JAVA_CONFIG_DIR"
[ -d "$JAVA_HOME" ] || "$BREW_EXECUTABLE" install --cask temurin

## kitty
export KITTY_CONFIG_DIR="$XDG_CONFIG_HOME/kitty"
export KITTY_EXECUTABLE="$HOMEBREW_PREFIX/bin/kitty"
[ -d "$KITTY_CONFIG_DIR" ] || mkdir -p "$KITTY_CONFIG_DIR"
[ -f "$KITTY_EXECUTABLE" ] || "$BREW_EXECUTABLE" install --cask kitty

## less
export LESS_EXECUTABLE="$HOMEBREW_PREFIX/bin/less"
[ -f "$LESS_EXECUTABLE" ] || "$BREW_EXECUTABLE" install less

## Neovim
export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_EXECUTABLE="$HOMEBREW_PREFIX/bin/nvim"
[ -d "$NVIM_CONFIG_DIR" ] || mkdir -p "$NVIM_CONFIG_DIR"
[ -f "$NVIM_EXECUTABLE" ] || "$BREW_EXECUTABLE" install neovim

## PowerShell
export PWSH_CONFIG_DIR="$XDG_CONFIG_HOME/.windows/pwsh"
export PWSH_SCRIPTS_DIR="$SCRIPTS/.windows/pwsh"
[ -d "$PWSH_CONFIG_DIR" ] || mkdir -p "$PWSH_CONFIG_DIR"
[ -d "$PWSH_SCRIPTS_DIR" ] || mkdir -p "$PWSH_SCRIPTS_DIR"

## Python
export PYTHON_CONFIG_DIR="$XDG_CONFIG_HOME/python"
export PYTHON_SCRIPTS_DIR="$SCRIPTS/python"
[ -d "$PYTHON_CONFIG_DIR" ] || mkdir -p "$PYTHON_CONFIG_DIR"
[ -d "$PYTHON_SCRIPTS_DIR" ] || mkdir -p "$PYTHON_SCRIPTS_DIR"

### uv
export UV_EXECUTABLE="$HOMEBREW_PREFIX/bin/uv"
export UV_PACKAGES_DIR="$XDG_DATA_HOME/uv"
[ -f "$UV_EXECUTABLE" ] || "$BREW_EXECUTABLE" install uv

#### Packages
export UV_PYTHON_DIR="$UV_PACKAGES_DIR/python"
[ -d "$UV_PYTHON_DIR" ] || "$UV_EXECUTABLE" python install --default

### pyenv, pyenv-virtualenv and pyenv-virtualenvwrapper
# export PYENV_ROOT="$PYTHON_CONFIG_DIR/.pyenv"
# [ -d "$PYENV_ROOT" ] || mkdir -p "$PYENV_ROOT"

### virtualenv and virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON="$HOMEBREW_PREFIX/bin/python3"
# export VIRTUALENVWRAPPER_VIRTUALENV="$HOMEBREW_PREFIX/bin/virtualenv"
# export WORKON_HOME="$PYTHON_CONFIG_DIR/.virtualenvs"
# [ -d "$WORKON_HOME" ] || mkdir -p "$WORKON_HOME"
# [ -f "$HOMEBREW_PREFIX/bin/virtualenvwrapper.sh" ] && . "$HOMEBREW_PREFIX/bin/virtualenvwrapper.sh"

## TeX
export TEXMFHOME="$(printf $(/Library/TeX/texbin/kpsewhich -var-value TEXMFHOME))"
[ -d "$TEXMFHOME" ] || "$BREW_EXECUTABLE" install --cask mactex-no-gui

### Assets
export TEX_ASSETS="$TEXMFHOME/tex/assets" # Git-tracked
[ -d "$TEX_ASSETS" ] || mkdir -p "$TEX_ASSETS"

### LaTeX
export LATEX_DOCUMENTS="$TYPESETTING/TeX/LaTeX/Documents"
export LATEX_PACKAGES="$TEXMFHOME/tex/latex"
[ -d "$LATEX_DOCUMENTS" ] || mkdir -p "$LATEX_DOCUMENTS"
[ -d "$LATEX_PACKAGES" ] || mkdir -p "$LATEX_PACKAGES"

#### Packages
export LATEX_SCRBOOK_PRESET="$LATEX_PACKAGES/scrbook-preset" # Git-tracked
export LATEX_STANDALONE_PRESET="$LATEX_PACKAGES/standalone-preset" # Git-tracked
[ -d "$LATEX_SCRBOOK_PRESET" ] || mkdir -p "$LATEX_SCRBOOK_PRESET"
[ -d "$LATEX_STANDALONE_PRESET" ] || mkdir -p "$LATEX_STANDALONE_PRESET"

## Software
export SOFTWARE="$HOME/Software" # Git-tracked
[ -d "$SOFTWARE" ] || mkdir -p "$SOFTWARE"

## Configurations
export CONFIGURATIONS="$HOME/Configurations" # Git-tracked
[ -d "$CONFIGURATIONS" ] || mkdir -p "$CONFIGURATIONS"

## Projects (cont'd)
### Academic
export ACADEMIC="$PROJECTS/Academic"
[ -d "$ACADEMIC" ] || mkdir -p "$ACADEMIC"

#### Undergraduate
export UNDERGRADUATE="$ACADEMIC/undergraduate" # Git-tracked
[ -d "$UNDERGRADUATE" ] || mkdir -p "$UNDERGRADUATE"

### Note-taking
export NOTETAKING="$PROJECTS/Note-Taking"
[ -d "$NOTETAKING" ] || mkdir -p "$NOTETAKING"

#### Fiction
export FICTION="$NOTETAKING/Fiction"
[ -d "$FICTION" ] || mkdir -p "$FICTION"

#### Non-fiction
export NONFICTION="$NOTETAKING/Non-Fiction"
[ -d "$NONFICTION" ] || mkdir -p "$NONFICTION"

#### # Discipline-based notes
export DISCIPLINES="$NONFICTION/Disciplines"
[ -d "$DISCIPLINES" ] || mkdir -p "$DISCIPLINES"

#### ## Mathematics
export MATHEMATICS="$DISCIPLINES/mathematics" # Git-tracked
[ -d "$MATHEMATICS" ] || mkdir -p "$MATHEMATICS"

#### # Miscellaneous
export MISCELLANEOUS="$NONFICTION/Miscellaneous"
[ -d "$MISCELLANEOUS" ] || mkdir -p "$MISCELLANEOUS"

#### # Textbook exercises
export TEXTBOOK_EXERCISES="$NONFICTION/Textbooks"
[ -d "$TEXTBOOK_EXERCISES" ] || mkdir -p "$TEXTBOOK_EXERCISES"

#### ## Calculus – Stewart, Clegg, Watson
export CALCULUS_STEWART_CLEGG_WATSON="$TEXTBOOK_EXERCISES/calculus-metric-version-9e-stewart-clegg-watson" # Git-tracked
[ -d "$CALCULUS_STEWART_CLEGG_WATSON" ] || mkdir -p "$CALCULUS_STEWART_CLEGG_WATSON"

#### ## Discrete Mathematics with Applications – Epp
export DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP="$TEXTBOOK_EXERCISES/discrete-mathematics-with-applications-metric-version-5e-epp" # Git-tracked
[ -d "$DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP" ] || mkdir -p "$DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP"

# Source a secondary .zshenv file if it exists in $ZDOTDIR
[ -f "$ZDOTDIR/.zshenv_secondary" ] && . "$ZDOTDIR/.zshenv_secondary"

# References:
## Java
### "How to set JAVA_HOME environment variable on Mac OS X 10.9?". https://stackoverflow.com/a/61204433

## XDG specifications
### "Interoperability specifications". https://www.freedesktop.org/wiki/Specifications/
### "XDG Base Directory Specification". https://specifications.freedesktop.org/basedir-spec/latest/
### "XDG Base Directory". https://wiki.archlinux.org/title/XDG_Base_Directory

## Zsh
### "Detect if executable file is on user's PATH". https://stackoverflow.com/a/53798785
### "Faster and enjoyable ZSH (maybe)". https://htr3n.github.io/2018/07/faster-zsh/
### "Homebrew PATH set in .zshenv is overridden". https://apple.stackexchange.com/a/432227
### "Shell startup scripts". https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
### "Unlimited history in zsh". https://unix.stackexchange.com/a/273863
### "What is /dev/null 2>&1?". https://stackoverflow.com/a/42919998/
### "What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?". https://unix.stackexchange.com/a/71258
### "Why are interactive shells on OSX login shells by default?". https://unix.stackexchange.com/a/119675
### "zsh: command not found: {compinstall,compinit,compdef}". https://unix.stackexchange.com/a/477909
### "ZSH: .zprofile, .zshrc, .zlogin - What goes where?". https://apple.stackexchange.com/a/388623
