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
### Prefix
export HOMEBREW_PREFIX="/opt/homebrew"

#### Binaries
export HOMEBREW_BINARIES_DIR="$HOMEBREW_PREFIX/bin"

#### # Executable
export HOMEBREW_EXECUTABLE="$HOMEBREW_BINARIES_DIR/brew"
[ -f "$HOMEBREW_EXECUTABLE" ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#### Optional
export HOMEBREW_OPTIONAL_DIR="$HOMEBREW_PREFIX/opt"

## Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_DATA_DIR="$XDG_DATA_HOME/zsh"
export ZSH_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/zsh/bin/zsh"
export ZSH_SCRIPTS_DIR="$SCRIPTS/zsh"
export ZSH_SCRIPTS_DIR_PRIVATE="$SCRIPTS/.private/zsh"
export ZSH_STATE_DIR="$XDG_STATE_HOME/zsh"
[ -d "$ZDOTDIR" ] || mkdir -p "$ZDOTDIR"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -d "$ZSH_DATA_DIR" ] || mkdir -p "$ZSH_DATA_DIR"
[ -d "$ZSH_SCRIPTS_DIR" ] || mkdir -p "$ZSH_SCRIPTS_DIR"
[ -d "$ZSH_SCRIPTS_DIR_PRIVATE" ] || mkdir -p "$ZSH_SCRIPTS_DIR_PRIVATE"
[ -d "$ZSH_STATE_DIR" ] || mkdir -p "$ZSH_STATE_DIR"
[ -f "$ZSH_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install zsh

### Functions
export ZSH_FUNCTIONS_DIR="$ZDOTDIR/functions"
[ -d "$ZSH_FUNCTIONS_DIR" ] || mkdir -p "$ZSH_FUNCTIONS_DIR"

#### Interactive
export ZSH_INTERACTIVE_FUNCTIONS_DIR="$ZSH_FUNCTIONS_DIR/interactive"
[ -d "$ZSH_INTERACTIVE_FUNCTIONS_DIR" ] || mkdir -p "$ZSH_INTERACTIVE_FUNCTIONS_DIR"

### History and completion cache
export HISTFILE="$ZSH_STATE_DIR/history"
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"

### Themes
export ZSH_THEMES_DIR="$ZDOTDIR/themes"
[ -d "$ZSH_THEMES_DIR" ] || mkdir -p "$ZSH_THEMES_DIR"

## C/C++
export C_CPP_CONFIG_DIR="$XDG_CONFIG_HOME/c-cpp"
[ -d "$C_CPP_CONFIG_DIR" ] || mkdir -p "$C_CPP_CONFIG_DIR"

### C
export C_CONFIG_DIR="$C_CPP_CONFIG_DIR/c"
[ -d "$C_CONFIG_DIR" ] || mkdir -p "$C_CONFIG_DIR"

#### Libraries
export C_LIBRARIES_DIR="$C_CONFIG_DIR/libraries"
[ -d "$C_LIBRARIES_DIR" ] || mkdir -p "$C_LIBRARIES_DIR"

#### # f-libs
export C_LIBRARIES_FLIBS_DIR="$C_LIBRARIES_DIR/f-libs"
[ -d "$C_LIBRARIES_FLIBS_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_DIR"

#### ## build
export C_LIBRARIES_FLIBS_BUILD_DIR="$C_LIBRARIES_FLIBS_DIR/build"
[ -d "$C_LIBRARIES_FLIBS_BUILD_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_BUILD_DIR"

#### ### lib
export C_LIBRARIES_FLIBS_LIB_DIR="$C_LIBRARIES_FLIBS_BUILD_DIR/lib"
[ -d "$C_LIBRARIES_FLIBS_LIB_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_LIB_DIR"

#### ### obj
export C_LIBRARIES_FLIBS_OBJ_DIR="$C_LIBRARIES_FLIBS_BUILD_DIR/obj"
[ -d "$C_LIBRARIES_FLIBS_OBJ_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_OBJ_DIR"

#### ## include
export C_LIBRARIES_FLIBS_INCLUDE_DIR="$C_LIBRARIES_FLIBS_DIR/include"
[ -d "$C_LIBRARIES_FLIBS_INCLUDE_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_INCLUDE_DIR"

#### ## src
export C_LIBRARIES_FLIBS_SRC_DIR="$C_LIBRARIES_FLIBS_DIR/src"
[ -d "$C_LIBRARIES_FLIBS_SRC_DIR" ] || mkdir -p "$C_LIBRARIES_FLIBS_SRC_DIR"

### GNU Compiler Collection (GCC)
export GCC_CONFIG_DIR="$C_CPP_CONFIG_DIR/gcc"
export GCC_EXECUTABLE="$HOMEBREW_BINARIES_DIR/gcc-15"
[ -d "$GCC_CONFIG_DIR" ] || mkdir -p "$GCC_CONFIG_DIR"
[ -f "$GCC_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install gcc

### LLVM
export LLVM_CONFIG_DIR="$C_CPP_CONFIG_DIR/llvm"
[ -d "$LLVM_CONFIG_DIR" ] || mkdir -p "$LLVM_CONFIG_DIR"

#### Clang
export CLANG_CONFIG_DIR="$LLVM_CONFIG_DIR/clang"
export CLANG_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/llvm/bin/clang"
[ -d "$CLANG_CONFIG_DIR" ] || mkdir -p "$CLANG_CONFIG_DIR"
[ -f "$CLANG_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install llvm

#### clangd
export CLANGD_CONFIG_DIR="$LLVM_CONFIG_DIR/clangd"
export CLANGD_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/llvm/bin/clangd"
[ -d "$CLANGD_CONFIG_DIR" ] || mkdir -p "$CLANGD_CONFIG_DIR"

## GNU Emacs
export EMACS_CONFIG_DIR="$XDG_CONFIG_HOME/emacs"
[ -d "$EMACS_CONFIG_DIR" ] || mkdir -p "$EMACS_CONFIG_DIR"

## fzf
### Theme: https://github.com/catppuccin/fzf/blob/main/themes/catppuccin-fzf-mocha.sh
export FZF_EXECUTABLE="$HOMEBREW_BINARIES_DIR/fzf"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
[ -f "$FZF_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install fzf

## Git
export GIT_CONFIG_DIR="$XDG_CONFIG_HOME/git"
[ -d "$GIT_CONFIG_DIR" ] || mkdir -p "$GIT_CONFIG_DIR"

## GNU Privacy Guard
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GPG_TTY="$(tty)"
[ -d "$GNUPGHOME" ] || (mkdir -p "$GNUPGHOME" && chown -R "$(whoami)" "$GNUPGHOME" && find "$GNUPGHOME" -type f -exec chmod 600 {} \; && find "$GNUPGHOME" -type d -exec chmod 700 {} \;)

## Java
export JAVA_CONFIG_DIR="$XDG_CONFIG_HOME/java"
export JAVA_HOME="$(/usr/libexec/java_home)"
[ -d "$JAVA_CONFIG_DIR" ] || mkdir -p "$JAVA_CONFIG_DIR"
[ -d "$JAVA_HOME" ] || "$HOMEBREW_EXECUTABLE" install --cask temurin

## Karabiner Elements
export KARABINER_ELEMENTS_CONFIG_DIR="$XDG_CONFIG_HOME/karabiner"
export KARABINER_ELEMENTS_EXECUTABLE="$HOMEBREW_BINARIES_DIR/karabiner_cli"
[ -d "$KARABINER_ELEMENTS_CONFIG_DIR" ] || mkdir -p "$KARABINER_ELEMENTS_CONFIG_DIR"
[ -f "$KARABINER_ELEMENTS_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask karabiner-elements

## kitty
export KITTY_CONFIG_DIR="$XDG_CONFIG_HOME/kitty"
export KITTY_EXECUTABLE="$HOMEBREW_BINARIES_DIR/kitty"
[ -d "$KITTY_CONFIG_DIR" ] || mkdir -p "$KITTY_CONFIG_DIR"
[ -f "$KITTY_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask kitty

## less
export LESS_EXECUTABLE="$HOMEBREW_BINARIES_DIR/less"
[ -f "$LESS_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install less

## Neovim
export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_EXECUTABLE="$HOMEBREW_BINARIES_DIR/nvim"
export NVIMS_CONFIG_DIR="$XDG_CONFIG_HOME/nvims"
[ -d "$NVIM_CONFIG_DIR" ] || mkdir -p "$NVIM_CONFIG_DIR"
[ -f "$NVIM_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install neovim
[ -d "$NVIMS_CONFIG_DIR" ] || mkdir -p "$NVIMS_CONFIG_DIR"

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
export UV_EXECUTABLE="$HOMEBREW_BINARIES_DIR/uv"
export UV_PACKAGES_DIR="$XDG_DATA_HOME/uv"
[ -f "$UV_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install uv

#### Packages
export UV_PYTHON_DIR="$UV_PACKAGES_DIR/python"
[ -d "$UV_PYTHON_DIR" ] || "$UV_EXECUTABLE" python install --default

#### venv
export VENV_HOME="$PYTHON_CONFIG_DIR/.venvs"
[ -d "$VENV_HOME" ] || mkdir -p "$VENV_HOME"

#### # Neovim
export NVIM_VENV_DIR="$VENV_HOME/neovim"
[ -d "$NVIM_VENV_DIR" ] || ("$UV_EXECUTABLE" init "$NVIM_VENV_DIR" && "$UV_EXECUTABLE" add --dev --project "$NVIM_VENV_DIR" cairosvg ipykernel ipynbname jupyter_client jupytext kagglehub kaleido latexminted marimo matplotlib numpy openpyxl pandas plotly pnglatex polars pynvim pyperclip quarto scikit-learn seaborn)

#### ## Binaries
export NVIM_VENV_BINARIES_DIR="$NVIM_VENV_DIR/.venv/bin"

## Rust
export RUST_CONFIG_DIR="$XDG_CONFIG_HOME/rust"
export RUST_SCRIPTS_DIR="$SCRIPTS/rust"
[ -d "$RUST_CONFIG_DIR" ] || mkdir -p "$RUST_CONFIG_DIR"
[ -d "$RUST_SCRIPTS_DIR" ] || mkdir -p "$RUST_SCRIPTS_DIR"

### rustup
export RUSTUP_EXECUTABLE="$HOMEBREW_BINARIES_DIR/rustup"
export RUSTUP_HOME="$RUST_CONFIG_DIR/rustup"
[ -d "$RUSTUP_HOME" ] || mkdir -p "$RUSTUP_HOME"
[ -f "$RUSTUP_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install rustup

#### cargo
export CARGO_HOME="$RUST_CONFIG_DIR/cargo"
[ -d "$CARGO_HOME" ] || mkdir -p "$CARGO_HOME"

#### # Binaries
export CARGO_BINARIES_DIR="$CARGO_HOME/bin"
[ -d "$CARGO_BINARIES_DIR" ] || mkdir -p "$CARGO_BINARIES_DIR"

#### rustc

## GNU Stow
export STOW_CONFIG_DIR="$XDG_CONFIG_HOME/stow"
export STOW_EXECUTABLE="$HOMEBREW_BINARIES_DIR/stow"
[ -d "$STOW_CONFIG_DIR" ] || mkdir -p "$STOW_CONFIG_DIR"
[ -f "$STOW_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install stow

### Home
export STOW_CONFIG_HOME="$STOW_CONFIG_DIR/home/.config"
[ -d "$STOW_CONFIG_HOME" ] || mkdir -p "$STOW_CONFIG_HOME"

#### C/C++
export STOW_CONFIG_C_CPP_DIR="$STOW_CONFIG_HOME/c-cpp"
[ -d "$STOW_CONFIG_C_CPP_DIR" ] || mkdir -p "$STOW_CONFIG_C_CPP_DIR"

#### # LLVM
export STOW_CONFIG_LLVM_DIR="$STOW_CONFIG_C_CPP_DIR/llvm"
[ -d "$STOW_CONFIG_LLVM_DIR" ] || mkdir -p "$STOW_CONFIG_LLVM_DIR"

#### ## Clang
export STOW_CONFIG_CLANG_DIR="$STOW_CONFIG_LLVM_DIR/clang"
[ -d "$STOW_CONFIG_CLANG_DIR" ] || mkdir -p "$STOW_CONFIG_CLANG_DIR"

#### ## clangd
export STOW_CONFIG_CLANGD_DIR="$STOW_CONFIG_LLVM_DIR/clangd"
[ -d "$STOW_CONFIG_CLANGD_DIR" ] || mkdir -p "$STOW_CONFIG_CLANGD_DIR"

#### Python
export STOW_CONFIG_PYTHON_DIR="$STOW_CONFIG_HOME/python"
[ -d "$STOW_CONFIG_PYTHON_DIR" ] || mkdir -p "$STOW_CONFIG_PYTHON_DIR"

#### # uv
#### ## venv
export STOW_CONFIG_VENV_HOME="$STOW_CONFIG_PYTHON_DIR/.venvs"
[ -d "$STOW_CONFIG_VENV_HOME" ] || mkdir -p "$STOW_CONFIG_VENV_HOME"

#### ### Neovim
export STOW_CONFIG_NVIM_VENV_DIR="$STOW_CONFIG_VENV_HOME/neovim"
[ -d "$STOW_CONFIG_NVIM_VENV_DIR" ] || mkdir -p "$STOW_CONFIG_NVIM_VENV_DIR"

#### #### Binaries
export STOW_CONFIG_NVIM_VENV_BINARIES_DIR="$STOW_CONFIG_NVIM_VENV_DIR/.venv/bin"

#### Visual Studio Code
export STOW_CONFIG_VSCODE_DIR="$STOW_CONFIG_HOME/visual-studio-code"
[ -d "$STOW_CONFIG_VSCODE_DIR" ] || mkdir -p "$STOW_CONFIG_VSCODE_DIR"

#### Zsh
export STOW_CONFIG_ZSH_DIR="$STOW_CONFIG_HOME/zsh"
[ -d "$STOW_CONFIG_ZSH_DIR" ] || mkdir -p "$STOW_CONFIG_ZSH_DIR"

## TeX
export TEXMFHOME="$(printf $(/Library/TeX/texbin/kpsewhich -var-value TEXMFHOME))"
[ -d "$TEXMFHOME" ] || "$HOMEBREW_EXECUTABLE" install --cask mactex-no-gui

### Assets
export TEX_ASSETS="$TEXMFHOME/tex/assets" # Git-tracked
[ -d "$TEX_ASSETS" ] || mkdir -p "$TEX_ASSETS"

### Binaries
export TEX_BINARIES_DIR="$TEXMFHOME/bin"
[ -d "$TEX_BINARIES_DIR" ] || mkdir -p "$TEX_BINARIES_DIR"

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

## Visual Studio Code
export VSCODE_CONFIG_DIR="$XDG_CONFIG_HOME/visual-studio-code"
export VSCODE_EXECUTABLE="$HOMEBREW_BINARIES_DIR/code"
[ -d "$VSCODE_CONFIG_DIR" ] || mkdir -p "$VSCODE_CONFIG_DIR"
[ -f "$VSCODE_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask visual-studio-code

## vivid
export VIVID_EXECUTABLE="$HOMEBREW_BINARIES_DIR/vivid"
[ -f "$VIVID_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install vivid

### LS_COLORS
export LS_COLORS="$($VIVID_EXECUTABLE generate catppuccin-mocha)"

## Downloads
export DOWNLOADS="$HOME/Downloads"
[ -d "$DOWNLOADS" ] || mkdir -p "$DOWNLOADS"

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

# Path-related environment variables
## C/C++
### C
typeset -T C_INCLUDE_PATH c_include_path
c_include_path+=("$C_LIBRARIES_FLIBS_INCLUDE_DIR")
c_include_path+=("$C_LIBRARIES_FLIBS_INCLUDE_DIR/f-core")

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
