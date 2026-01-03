#!/usr/bin/env zsh
# ~/.zshenv

# Environment variables and aliases for profiling
if [ "${ZSH_DEBUG:=false}" = true ]; then
  zmodload zsh/zprof
fi

export ZSHENV_ONLY=false

alias zp='kitten @ set-tab-title "zsh (profiling)"\
  && kitten @ set-window-title "kitty | zsh (profiling)"\
  && printf "\e[2J\e[3J\e[1;1H"\
  && print -P "%F{green}"\
  && time ZSH_DEBUG=true /opt/homebrew/opt/zsh/bin/zsh -cil exit;\
  print -P "%F{reset}"'

alias zs='kitten @ set-tab-title "zsh (profiling)"\
  && kitten @ set-window-title "kitty | zsh (profiling)"\
  && printf "\e[2J\e[3J\e[1;1H"\
  && print -P "%F{green}"\
  && /opt/homebrew/opt/zsh/bin/zsh -il --sourcetrace -c exit;\
  print -P "%F{reset}"'

alias zt='kitten @ set-tab-title "zsh (profiling)"\
  && kitten @ set-window-title "kitty | zsh (profiling)"\
  && printf "\e[2J\e[3J\e[1;1H"\
  && print -P "%F{green}"\
  && for i in $(seq 1 20);\
       do /usr/bin/time /opt/homebrew/opt/zsh/bin/zsh -cil exit;\
    done;\
  print -P "%F{reset}"'

# Environment variables for XDG Base Directory specification-compliant user-directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Environment variables for miscellaneous user-directories which would be
# created if they don't already exist and for miscellaneous executables
# which would be installed if they don't already exist
## Homebrew
### Prefix
export HOMEBREW_PREFIX="/opt/homebrew"

#### Binaries
export HOMEBREW_BINARIES_DIR="$HOMEBREW_PREFIX/bin"

#### # Executable
export HOMEBREW_EXECUTABLE="$HOMEBREW_BINARIES_DIR/brew"
[ -f "$HOMEBREW_EXECUTABLE" ] || /bin/bash -c "$(\
  curl -fsSL\
    https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#### Data
export HOMEBREW_DATA_DIR="$HOMEBREW_PREFIX/share"

#### Optional
export HOMEBREW_OPTIONAL_DIR="$HOMEBREW_PREFIX/opt"

## GNU awk
export AWK_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/gawk/libexec/gnubin/awk"
[ -f "$AWK_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install gawk

## GNU Binutils
export BINUTILS_BINARIES_DIR="$HOMEBREW_OPTIONAL_DIR/binutils/bin"
[ -d "$BINUTILS_BINARIES_DIR" ] || "$HOMEBREW_EXECUTABLE" install binutils

## GNU Coreutils
export COREUTILS_BINARIES_DIR="$HOMEBREW_OPTIONAL_DIR/coreutils/libexec/gnubin"
[ -d "$COREUTILS_BINARIES_DIR" ] || "$HOMEBREW_EXECUTABLE" install coreutils

### cat
export CAT_EXECUTABLE="$COREUTILS_BINARIES_DIR/cat"

### head
export HEAD_EXECUTABLE="$COREUTILS_BINARIES_DIR/head"

### mkdir
export MKDIR_EXECUTABLE="$COREUTILS_BINARIES_DIR/mkdir"

### tail
export TAIL_EXECUTABLE="$COREUTILS_BINARIES_DIR/tail"

### tee
export TEE_EXECUTABLE="$COREUTILS_BINARIES_DIR/tee"

### tr
export TR_EXECUTABLE="$COREUTILS_BINARIES_DIR/tr"

## GNU Diffutils
export DIFFUTILS_BINARIES_DIR="$HOMEBREW_OPTIONAL_DIR/diffutils/bin"
[ -d "$DIFFUTILS_BINARIES_DIR" ] || "$HOMEBREW_EXECUTABLE" install diffutils

## GNU Findutils
export FINDUTILS_BINARIES_DIR="$HOMEBREW_OPTIONAL_DIR/findutils/libexec/gnubin"
[ -d "$FINDUTILS_BINARIES_DIR" ] || "$HOMEBREW_EXECUTABLE" install findutils

### find
export FIND_EXECUTABLE="$FINDUTILS_BINARIES_DIR/find"

### xargs
export XARGS_EXECUTABLE="$FINDUTILS_BINARIES_DIR/xargs"

## GNU parallel
export PARALLEL_EXECUTABLE="$HOMEBREW_BINARIES_DIR/parallel"
[ -f "$PARALLEL_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install parallel

### env_parallel
if [ "$ZSHENV_ONLY" = true ]; then
  . "$HOMEBREW_BINARIES_DIR/env_parallel.zsh"
fi

## GNU sed
export SED_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/gnu-sed/libexec/gnubin/sed"
[ -f "$SED_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install gnu-sed

## fd
export FD_EXECUTABLE="$HOMEBREW_BINARIES_DIR/fd"
[ -f "$FD_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install fd

## sd
export SD_EXECUTABLE="$HOMEBREW_BINARIES_DIR/sd"
[ -f "$SD_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install sd

## Projects
export PROJECTS="$HOME/Projects"
[ -d "$PROJECTS" ] || "$MKDIR_EXECUTABLE" -p "$PROJECTS"

### Programming
export PROGRAMMING="$PROJECTS/Programming"
[ -d "$PROGRAMMING" ] || "$MKDIR_EXECUTABLE" -p "$PROGRAMMING"

#### Scripts
export SCRIPTS="$PROGRAMMING/scripts" # Git-tracked
[ -d "$SCRIPTS" ] || "$MKDIR_EXECUTABLE" -p "$SCRIPTS"

### Typesetting
export TYPESETTING="$PROJECTS/Typesetting"
[ -d "$TYPESETTING" ] || "$MKDIR_EXECUTABLE" -p "$TYPESETTING"

# ## Zsh
if [ "$ZSHENV_ONLY" = false ]; then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  [ -d "$ZDOTDIR" ] || "$MKDIR_EXECUTABLE" -p "$ZDOTDIR"
fi

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_DATA_DIR="$XDG_DATA_HOME/zsh"
export ZSH_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/zsh/bin/zsh"
export ZSH_SCRIPTS_DIR="$SCRIPTS/zsh"
export ZSH_SCRIPTS_DIR_PRIVATE="$SCRIPTS/.private/zsh"
export ZSH_STATE_DIR="$XDG_STATE_HOME/zsh"
[ -d "$ZSH_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_CACHE_DIR"
[ -d "$ZSH_DATA_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_DATA_DIR"
[ -d "$ZSH_SCRIPTS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_SCRIPTS_DIR"
[ -d "$ZSH_SCRIPTS_DIR_PRIVATE" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_SCRIPTS_DIR_PRIVATE"
[ -d "$ZSH_STATE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_STATE_DIR"
[ -f "$ZSH_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install zsh

### Cache subdirectories
export ZLOGIN_CACHE_DIR="$ZSH_CACHE_DIR/zlogin"
export ZLOGOUT_CACHE_DIR="$ZSH_CACHE_DIR/zlogout"
export ZPROFILE_CACHE_DIR="$ZSH_CACHE_DIR/zprofile"
export ZSHENV_CACHE_DIR="$ZSH_CACHE_DIR/zshenv"
export ZSHRC_CACHE_DIR="$ZSH_CACHE_DIR/zshrc"
[ -d "$ZLOGIN_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZLOGIN_CACHE_DIR"
[ -d "$ZLOGOUT_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZLOGOUT_CACHE_DIR"
[ -d "$ZPROFILE_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZPROFILE_CACHE_DIR"
[ -d "$ZSHENV_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSHENV_CACHE_DIR"
[ -d "$ZSHRC_CACHE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSHRC_CACHE_DIR"

### Functions
if [ "$ZSHENV_ONLY" = false ]; then
  export ZSH_FUNCTIONS_DIR="$ZDOTDIR/functions"
  [ -d "$ZSH_FUNCTIONS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_FUNCTIONS_DIR"
fi

#### Interactive
if [ "$ZSHENV_ONLY" = false ]; then
  export ZSH_INTERACTIVE_FUNCTIONS_DIR="$ZSH_FUNCTIONS_DIR/interactive"
  [ -d "$ZSH_INTERACTIVE_FUNCTIONS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_INTERACTIVE_FUNCTIONS_DIR"
fi

### History and completion cache
if [ "$ZSHENV_ONLY" = false ]; then
  export ZCOMPDUMP="$ZDOTDIR/.zcompdump-$ZSH_VERSION"
fi

export HISTFILE="$ZSH_STATE_DIR/history"
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"

### Themes and plugins
if [ "$ZSHENV_ONLY" = false ]; then
  export ZSH_THEMES_DIR="$ZDOTDIR/themes"
  [ -d "$ZSH_THEMES_DIR" ] || "$MKDIR_EXECUTABLE" -p "$ZSH_THEMES_DIR"
fi

export ZSH_AUTOCOMPLETE_DIR="$HOMEBREW_DATA_DIR/zsh-autocomplete"
export ZSH_AUTOSUGGESTIONS_DIR="$HOMEBREW_DATA_DIR/zsh-autosuggestions"
export ZSH_SYNTAX_HIGHLIGHTING_DIR="$HOMEBREW_DATA_DIR/zsh-syntax-highlighting"
[ -d "$ZSH_AUTOCOMPLETE_DIR" ] || "$HOMEBREW_EXECUTABLE" install zsh-autocomplete
[ -d "$ZSH_AUTOSUGGESTIONS_DIR" ] || "$HOMEBREW_EXECUTABLE" install zsh-autosuggestions
[ -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ] || "$HOMEBREW_EXECUTABLE" install zsh-syntax-highlighting

## C/C++
export C_CPP_CONFIG_DIR="$XDG_CONFIG_HOME/c-cpp"
[ -d "$C_CPP_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_CPP_CONFIG_DIR"

### C
export C_CONFIG_DIR="$C_CPP_CONFIG_DIR/c"
[ -d "$C_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_CONFIG_DIR"

#### Libraries
export C_LIBRARIES_DIR="$C_CONFIG_DIR/libraries"
[ -d "$C_LIBRARIES_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_DIR"

#### # f-libs
export C_LIBRARIES_FLIBS_DIR="$C_LIBRARIES_DIR/f-libs"
[ -d "$C_LIBRARIES_FLIBS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_DIR"

#### ## build
export C_LIBRARIES_FLIBS_BUILD_DIR="$C_LIBRARIES_FLIBS_DIR/build"
[ -d "$C_LIBRARIES_FLIBS_BUILD_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_BUILD_DIR"

#### ### lib
export C_LIBRARIES_FLIBS_LIB_DIR="$C_LIBRARIES_FLIBS_BUILD_DIR/lib"
[ -d "$C_LIBRARIES_FLIBS_LIB_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_LIB_DIR"

#### ### obj
export C_LIBRARIES_FLIBS_OBJ_DIR="$C_LIBRARIES_FLIBS_BUILD_DIR/obj"
[ -d "$C_LIBRARIES_FLIBS_OBJ_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_OBJ_DIR"

#### ## include
export C_LIBRARIES_FLIBS_INCLUDE_DIR="$C_LIBRARIES_FLIBS_DIR/include"
[ -d "$C_LIBRARIES_FLIBS_INCLUDE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_INCLUDE_DIR"

#### ## src
export C_LIBRARIES_FLIBS_SRC_DIR="$C_LIBRARIES_FLIBS_DIR/src"
[ -d "$C_LIBRARIES_FLIBS_SRC_DIR" ] || "$MKDIR_EXECUTABLE" -p "$C_LIBRARIES_FLIBS_SRC_DIR"

### GNU Compiler Collection (GCC)
export GCC_CONFIG_DIR="$C_CPP_CONFIG_DIR/gcc"
export GCC_EXECUTABLE="$HOMEBREW_BINARIES_DIR/gcc-15"
[ -d "$GCC_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$GCC_CONFIG_DIR"
[ -f "$GCC_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install gcc

#### C
export GCC_CONFIG_C_DIR="$GCC_CONFIG_DIR/c"

#### # Compiler-option files
export GCC_OPTS_C_FILE="$GCC_CONFIG_C_DIR/options"
export GCC_OPTS_C_CACHE_FILE="$ZSHENV_CACHE_DIR/GCC_OPTS_C_STRING"

#### ## Compiler-option strings
if [ ! -s "$GCC_OPTS_C_FILE" ]; then
  export GCC_OPTS_C_STRING="\
    # ~/.config/c-cpp/gcc/c/options\n\
    \"-I\$C_LIBRARIES_FLIBS_INCLUDE_DIR\"\n\
    \"-I\$C_LIBRARIES_FLIBS_INCLUDE_DIR/f-core\"\n\
    -Wall\n\
    -Werror\n\
    -Wextra\n\
    -Wpedantic\n\
    -g\n\
    -std=c23\n"

  printf "$GCC_OPTS_C_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$GCC_OPTS_C_FILE"
fi

if [ ! -s "$GCC_OPTS_C_CACHE_FILE" ]; then
  export GCC_OPTS_C_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/GCC_OPTS_C_STRING\n\
    export GCC_OPTS_C_STRING=\"$(\
      $TAIL_EXECUTABLE -n +2 $GCC_OPTS_C_FILE\
      | $TR_EXECUTABLE -d '\"'\
      | $TR_EXECUTABLE '\n' ' '\
      | $SD_EXECUTABLE ' $' ''\
      | $SD_EXECUTABLE '\$C_LIBRARIES_FLIBS_INCLUDE_DIR'\
        $C_LIBRARIES_FLIBS_INCLUDE_DIR)\""

  printf "$GCC_OPTS_C_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$GCC_OPTS_C_CACHE_FILE"
fi

. "$GCC_OPTS_C_CACHE_FILE"

#### ### Compiler-option array
export GCC_OPTS_C=(${(@s: :)GCC_OPTS_C_STRING})

### LLVM
export LLVM_CONFIG_DIR="$C_CPP_CONFIG_DIR/llvm"
[ -d "$LLVM_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$LLVM_CONFIG_DIR"

#### Clang
export CLANG_CONFIG_DIR="$LLVM_CONFIG_DIR/clang"
export CLANG_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/llvm/bin/clang"
[ -d "$CLANG_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$CLANG_CONFIG_DIR"
[ -f "$CLANG_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install llvm

#### clangd
export CLANGD_CONFIG_DIR="$LLVM_CONFIG_DIR/clangd"
export CLANGD_EXECUTABLE="$HOMEBREW_OPTIONAL_DIR/llvm/bin/clangd"
[ -d "$CLANGD_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$CLANGD_CONFIG_DIR"

#### # Language-server-option files
export CLANGD_CONFIG_FILE="$CLANGD_CONFIG_DIR/config.yaml"
export CLANGD_CONFIG_CACHE_FILE="$ZSHENV_CACHE_DIR/CLANGD_CONFIG_STRING"

#### ## Language-server-option strings
if [ ! -s "$CLANGD_CONFIG_FILE" ]; then
  export CLANGD_CONFIG_STRING="\
    # ~/Library/Preferences/clangd/config.yaml\n\
    If:\n\
      PathMatch: [.*\.c, .*\.h]\n\
    CompileFlags:\n\
      Compiler: gcc-15\n\
      Add:\n""$(\
      $TAIL_EXECUTABLE -n +2 $GCC_OPTS_C_FILE\
      | $HEAD_EXECUTABLE -n -1 -\
      | $TR_EXECUTABLE -d '"'\
      | $SD_EXECUTABLE -- '^(-)' '      - $1'\
      | $SD_EXECUTABLE '\$C_LIBRARIES_FLIBS_INCLUDE_DIR'\
        $C_LIBRARIES_FLIBS_INCLUDE_DIR)\n""\
    \n\
    If:\n\
      PathMatch: [.*\.c]\n\
    CompileFlags:\n\
      Compiler: gcc-15\n\
      Add:\n""$(\
      $TAIL_EXECUTABLE -n 1 $GCC_OPTS_C_FILE\
      | $TR_EXECUTABLE -d '"'\
      | $SD_EXECUTABLE -- '^(-)' '      - $1'\
      | $SD_EXECUTABLE '\$C_LIBRARIES_FLIBS_INCLUDE_DIR'\
        $C_LIBRARIES_FLIBS_INCLUDE_DIR)\n"

  printf "$CLANGD_CONFIG_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$CLANGD_CONFIG_FILE"
fi

if [ ! -s "$CLANGD_CONFIG_CACHE_FILE" ]; then
  export CLANGD_CONFIG_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/CLANGD_CONFIG_STRING\n\
    export CLANGD_CONFIG_STRING=\"$(\
      $HEAD_EXECUTABLE -n -1 $CLANGD_CONFIG_FILE\
      | $SD_EXECUTABLE '$' '\\\\n\\'\
      | $HEAD_EXECUTABLE -n -1 -)\\\\n$(\
      $TAIL_EXECUTABLE -n 1 $CLANGD_CONFIG_FILE)\\\\n\""

  printf "$CLANGD_CONFIG_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$CLANGD_CONFIG_CACHE_FILE"
fi

. "$CLANGD_CONFIG_CACHE_FILE"

## GNU Emacs
export EMACS_CONFIG_DIR="$XDG_CONFIG_HOME/emacs"
[ -d "$EMACS_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$EMACS_CONFIG_DIR"

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
[ -d "$GIT_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$GIT_CONFIG_DIR"

## GNU Privacy Guard
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GPG_TTY="$(tty)"
[ -d "$GNUPGHOME" ] || ("$MKDIR_EXECUTABLE" -p "$GNUPGHOME" && chown -R "$(whoami)" "$GNUPGHOME" && "$FIND_EXECUTABLE" "$GNUPGHOME" -type f -exec chmod 600 {} \; && "$FIND_EXECUTABLE" "$GNUPGHOME" -type d -exec chmod 700 {} \;)

## Java
export JAVA_CONFIG_DIR="$XDG_CONFIG_HOME/java"
[ -d "$JAVA_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$JAVA_CONFIG_DIR"

### JAVA_HOME file
export JAVA_HOME_CACHE_FILE="$ZSHENV_CACHE_DIR/JAVA_HOME"

#### JAVA_HOME strings
if [ ! -s "$JAVA_HOME_CACHE_FILE" ]; then
  export JAVA_HOME_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/JAVA_HOME\n\
    export JAVA_HOME=\"$(/usr/libexec/java_home)\"\n"

  printf "$JAVA_HOME_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$JAVA_HOME_CACHE_FILE"
fi

. "$JAVA_HOME_CACHE_FILE"
[ -d "$JAVA_HOME" ] || "$HOMEBREW_EXECUTABLE" install --cask temurin

### Binaries
export JAVA_BINARIES_DIR="$JAVA_HOME/bin"

## Karabiner Elements
export KARABINER_ELEMENTS_CONFIG_DIR="$XDG_CONFIG_HOME/karabiner"
export KARABINER_ELEMENTS_EXECUTABLE="$HOMEBREW_BINARIES_DIR/karabiner_cli"
[ -d "$KARABINER_ELEMENTS_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$KARABINER_ELEMENTS_CONFIG_DIR"
[ -f "$KARABINER_ELEMENTS_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask karabiner-elements

## kitty
export KITTY_CONFIG_DIR="$XDG_CONFIG_HOME/kitty"
export KITTY_EXECUTABLE="$HOMEBREW_BINARIES_DIR/kitty"
[ -d "$KITTY_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$KITTY_CONFIG_DIR"
[ -f "$KITTY_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask kitty

## less
export LESS_EXECUTABLE="$HOMEBREW_BINARIES_DIR/less"
[ -f "$LESS_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install less

## Neovim
export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
export NVIM_EXECUTABLE="$HOMEBREW_BINARIES_DIR/nvim"
export NVIMS_CONFIG_DIR="$XDG_CONFIG_HOME/nvims"
[ -d "$NVIM_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$NVIM_CONFIG_DIR"
[ -f "$NVIM_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install neovim
[ -d "$NVIMS_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$NVIMS_CONFIG_DIR"

## PowerShell
export PWSH_CONFIG_DIR="$XDG_CONFIG_HOME/.windows/pwsh"
export PWSH_SCRIPTS_DIR="$SCRIPTS/.windows/pwsh"
[ -d "$PWSH_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$PWSH_CONFIG_DIR"
[ -d "$PWSH_SCRIPTS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$PWSH_SCRIPTS_DIR"

## Python
export PYTHON_CONFIG_DIR="$XDG_CONFIG_HOME/python"
export PYTHON_SCRIPTS_DIR="$SCRIPTS/python"
[ -d "$PYTHON_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$PYTHON_CONFIG_DIR"
[ -d "$PYTHON_SCRIPTS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$PYTHON_SCRIPTS_DIR"

### uv
export UV_EXECUTABLE="$HOMEBREW_BINARIES_DIR/uv"
export UV_PACKAGES_DIR="$XDG_DATA_HOME/uv"
[ -f "$UV_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install uv

#### Packages
export UV_PYTHON_DIR="$UV_PACKAGES_DIR/python"
[ -d "$UV_PYTHON_DIR" ] || "$UV_EXECUTABLE" python install --default

#### venv
export VENV_HOME="$PYTHON_CONFIG_DIR/.venvs"
[ -d "$VENV_HOME" ] || "$MKDIR_EXECUTABLE" -p "$VENV_HOME"

#### # Neovim
export NVIM_VENV_DIR="$VENV_HOME/neovim"
[ -d "$NVIM_VENV_DIR" ] || ("$UV_EXECUTABLE" init "$NVIM_VENV_DIR" && "$UV_EXECUTABLE" add --dev --project "$NVIM_VENV_DIR" cairosvg ipykernel ipynbname jupyter_client jupytext kagglehub kaleido latexminted marimo matplotlib numpy openpyxl pandas plotly pnglatex polars pynvim pyperclip quarto scikit-learn seaborn)

#### ## Binaries
export NVIM_VENV_BINARIES_DIR="$NVIM_VENV_DIR/.venv/bin"

## Rust
export RUST_CONFIG_DIR="$XDG_CONFIG_HOME/rust"
export RUST_SCRIPTS_DIR="$SCRIPTS/rust"
[ -d "$RUST_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$RUST_CONFIG_DIR"
[ -d "$RUST_SCRIPTS_DIR" ] || "$MKDIR_EXECUTABLE" -p "$RUST_SCRIPTS_DIR"

### rustup
export RUSTUP_EXECUTABLE="$HOMEBREW_BINARIES_DIR/rustup"
export RUSTUP_HOME="$RUST_CONFIG_DIR/rustup"
[ -d "$RUSTUP_HOME" ] || "$MKDIR_EXECUTABLE" -p "$RUSTUP_HOME"
[ -f "$RUSTUP_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install rustup

#### cargo
export CARGO_HOME="$RUST_CONFIG_DIR/cargo"
[ -d "$CARGO_HOME" ] || "$MKDIR_EXECUTABLE" -p "$CARGO_HOME"

#### # Binaries
export CARGO_BINARIES_DIR="$CARGO_HOME/bin"
[ -d "$CARGO_BINARIES_DIR" ] || "$MKDIR_EXECUTABLE" -p "$CARGO_BINARIES_DIR"

#### rustc

## GNU Stow
export STOW_CONFIG_DIR="$XDG_CONFIG_HOME/stow"
export STOW_EXECUTABLE="$HOMEBREW_BINARIES_DIR/stow"
[ -d "$STOW_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_DIR"
[ -f "$STOW_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install stow

### Home
export STOW_CONFIG_HOME="$STOW_CONFIG_DIR/home/.config"
[ -d "$STOW_CONFIG_HOME" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_HOME"

#### C/C++
export STOW_CONFIG_C_CPP_DIR="$STOW_CONFIG_HOME/c-cpp"
[ -d "$STOW_CONFIG_C_CPP_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_C_CPP_DIR"

#### # LLVM
export STOW_CONFIG_LLVM_DIR="$STOW_CONFIG_C_CPP_DIR/llvm"
[ -d "$STOW_CONFIG_LLVM_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_LLVM_DIR"

#### ## Clang
export STOW_CONFIG_CLANG_DIR="$STOW_CONFIG_LLVM_DIR/clang"
[ -d "$STOW_CONFIG_CLANG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_CLANG_DIR"

#### ## clangd
export STOW_CONFIG_CLANGD_DIR="$STOW_CONFIG_LLVM_DIR/clangd"
[ -d "$STOW_CONFIG_CLANGD_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_CLANGD_DIR"

#### Python
export STOW_CONFIG_PYTHON_DIR="$STOW_CONFIG_HOME/python"
[ -d "$STOW_CONFIG_PYTHON_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_PYTHON_DIR"

#### # uv
#### ## venv
export STOW_CONFIG_VENV_HOME="$STOW_CONFIG_PYTHON_DIR/.venvs"
[ -d "$STOW_CONFIG_VENV_HOME" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_VENV_HOME"

#### ### Neovim
export STOW_CONFIG_NVIM_VENV_DIR="$STOW_CONFIG_VENV_HOME/neovim"
[ -d "$STOW_CONFIG_NVIM_VENV_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_NVIM_VENV_DIR"

#### #### Binaries
export STOW_CONFIG_NVIM_VENV_BINARIES_DIR="$STOW_CONFIG_NVIM_VENV_DIR/.venv/bin"

#### Visual Studio Code
export STOW_CONFIG_VSCODE_DIR="$STOW_CONFIG_HOME/visual-studio-code"
[ -d "$STOW_CONFIG_VSCODE_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_VSCODE_DIR"

#### Zsh
export STOW_CONFIG_ZSH_DIR="$STOW_CONFIG_HOME/zsh"
[ -d "$STOW_CONFIG_ZSH_DIR" ] || "$MKDIR_EXECUTABLE" -p "$STOW_CONFIG_ZSH_DIR"

## TeX
export KPSEWHICH_EXECUTABLE="/Library/TeX/texbin/kpsewhich"

### texmf-tree-variable files
export TEXMFHOME_CACHE_FILE="$ZSHENV_CACHE_DIR/TEXMFHOME"
export TEXMFLOCAL_CACHE_FILE="$ZSHENV_CACHE_DIR/TEXMFLOCAL"

#### texmf-tree-variable strings
if [ ! -s "$TEXMFHOME_CACHE_FILE" ]; then
  export TEXMFHOME_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/TEXMFHOME\n\
    export TEXMFHOME=\"$($KPSEWHICH_EXECUTABLE -var-value TEXMFHOME)\"\n"

  printf "$TEXMFHOME_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$TEXMFHOME_CACHE_FILE"
fi

if [ ! -s "$TEXMFLOCAL_CACHE_FILE" ]; then
  export TEXMFLOCAL_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/TEXMFLOCAL\n\
    export TEXMFLOCAL=\"$($KPSEWHICH_EXECUTABLE -var-value TEXMFLOCAL)\"\n"

  printf "$TEXMFLOCAL_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$TEXMFLOCAL_CACHE_FILE"
fi

. "$TEXMFHOME_CACHE_FILE"
. "$TEXMFLOCAL_CACHE_FILE"
[ -d "$TEXMFHOME" ] || "$HOMEBREW_EXECUTABLE" install --cask mactex-no-gui

### Assets
export TEX_ASSETS="$TEXMFHOME/tex/assets" # Git-tracked
[ -d "$TEX_ASSETS" ] || "$MKDIR_EXECUTABLE" -p "$TEX_ASSETS"

### Binaries
export TEX_BINARIES_DIR="$TEXMFHOME/bin"
[ -d "$TEX_BINARIES_DIR" ] || "$MKDIR_EXECUTABLE" -p "$TEX_BINARIES_DIR"

### LaTeX
export LATEX_DOCUMENTS="$TYPESETTING/TeX/LaTeX/Documents"
export LATEX_PACKAGES="$TEXMFHOME/tex/latex"
[ -d "$LATEX_DOCUMENTS" ] || "$MKDIR_EXECUTABLE" -p "$LATEX_DOCUMENTS"
[ -d "$LATEX_PACKAGES" ] || "$MKDIR_EXECUTABLE" -p "$LATEX_PACKAGES"

#### Packages
export LATEX_SCRBOOK_PRESET="$LATEX_PACKAGES/scrbook-preset" # Git-tracked
export LATEX_STANDALONE_PRESET="$LATEX_PACKAGES/standalone-preset" # Git-tracked
[ -d "$LATEX_SCRBOOK_PRESET" ] || "$MKDIR_EXECUTABLE" -p "$LATEX_SCRBOOK_PRESET"
[ -d "$LATEX_STANDALONE_PRESET" ] || "$MKDIR_EXECUTABLE" -p "$LATEX_STANDALONE_PRESET"

## Visual Studio Code
export VSCODE_CONFIG_DIR="$XDG_CONFIG_HOME/visual-studio-code"
export VSCODE_EXECUTABLE="$HOMEBREW_BINARIES_DIR/code"
[ -d "$VSCODE_CONFIG_DIR" ] || "$MKDIR_EXECUTABLE" -p "$VSCODE_CONFIG_DIR"
[ -f "$VSCODE_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install --cask visual-studio-code

## vivid
export VIVID_EXECUTABLE="$HOMEBREW_BINARIES_DIR/vivid"
[ -f "$VIVID_EXECUTABLE" ] || "$HOMEBREW_EXECUTABLE" install vivid

### LS_COLORS file
export LS_COLORS_CACHE_FILE="$ZSHENV_CACHE_DIR/LS_COLORS"

#### LS_COLORS strings
if [ ! -s "$LS_COLORS_CACHE_FILE" ]; then
  export LS_COLORS_CACHE_STRING="\
    # ~/.cache/zsh/zshenv/LS_COLORS\n\
    export LS_COLORS=\"$($VIVID_EXECUTABLE generate catppuccin-mocha)\"\n"

  printf "$LS_COLORS_CACHE_STRING"\
    | "$SD_EXECUTABLE" '^    ' '' > "$LS_COLORS_CACHE_FILE"
fi

. "$LS_COLORS_CACHE_FILE"

## Downloads
export DOWNLOADS="$HOME/Downloads"
[ -d "$DOWNLOADS" ] || "$MKDIR_EXECUTABLE" -p "$DOWNLOADS"

## Software
export SOFTWARE="$HOME/Software" # Git-tracked
[ -d "$SOFTWARE" ] || "$MKDIR_EXECUTABLE" -p "$SOFTWARE"

## Configurations
export CONFIGURATIONS="$HOME/Configurations" # Git-tracked
[ -d "$CONFIGURATIONS" ] || "$MKDIR_EXECUTABLE" -p "$CONFIGURATIONS"

## Projects (cont'd)
### Academic
export ACADEMIC="$PROJECTS/Academic"
[ -d "$ACADEMIC" ] || "$MKDIR_EXECUTABLE" -p "$ACADEMIC"

#### Undergraduate
export UNDERGRADUATE="$ACADEMIC/undergraduate" # Git-tracked
[ -d "$UNDERGRADUATE" ] || "$MKDIR_EXECUTABLE" -p "$UNDERGRADUATE"

### Note-taking
export NOTETAKING="$PROJECTS/Note-Taking"
[ -d "$NOTETAKING" ] || "$MKDIR_EXECUTABLE" -p "$NOTETAKING"

#### Fiction
export FICTION="$NOTETAKING/Fiction"
[ -d "$FICTION" ] || "$MKDIR_EXECUTABLE" -p "$FICTION"

#### Non-fiction
export NONFICTION="$NOTETAKING/Non-Fiction"
[ -d "$NONFICTION" ] || "$MKDIR_EXECUTABLE" -p "$NONFICTION"

#### # Discipline-based notes
export DISCIPLINES="$NONFICTION/Disciplines"
[ -d "$DISCIPLINES" ] || "$MKDIR_EXECUTABLE" -p "$DISCIPLINES"

#### ## Mathematics
export MATHEMATICS="$DISCIPLINES/mathematics" # Git-tracked
[ -d "$MATHEMATICS" ] || "$MKDIR_EXECUTABLE" -p "$MATHEMATICS"

#### # Miscellaneous
export MISCELLANEOUS="$NONFICTION/Miscellaneous"
[ -d "$MISCELLANEOUS" ] || "$MKDIR_EXECUTABLE" -p "$MISCELLANEOUS"

#### # Textbook exercises
export TEXTBOOK_EXERCISES="$NONFICTION/Textbooks"
[ -d "$TEXTBOOK_EXERCISES" ] || "$MKDIR_EXECUTABLE" -p "$TEXTBOOK_EXERCISES"

#### ## Calculus – Stewart, Clegg, Watson
export CALCULUS_STEWART_CLEGG_WATSON="$TEXTBOOK_EXERCISES/calculus-metric-version-9e-stewart-clegg-watson" # Git-tracked
[ -d "$CALCULUS_STEWART_CLEGG_WATSON" ] || "$MKDIR_EXECUTABLE" -p "$CALCULUS_STEWART_CLEGG_WATSON"

#### ## Discrete Mathematics with Applications – Epp
export DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP="$TEXTBOOK_EXERCISES/discrete-mathematics-with-applications-metric-version-5e-epp" # Git-tracked
[ -d "$DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP" ] || "$MKDIR_EXECUTABLE" -p "$DISCRETE_MATHEMATICS_WITH_APPLICATIONS_EPP"

# Default-executable-related environment variables
## EDITOR
export EDITOR="$NVIM_EXECUTABLE"

## HOMEBREW_FORCE_BREWED_CURL
export HOMEBREW_FORCE_BREWED_CURL=1

## MANPAGER
### Source: https://old.reddit.com/r/neovim/comments/1k1k9bz/use_neovim_as_the_default_man_page_viewer/mnya9kr
export MANPAGER="$NVIM_EXECUTABLE --cmd 'set laststatus=0' -c 'set laststatus=0 nowrap statuscolumn=' -c 'Man!'"

## MANWIDTH
export MANWIDTH=999

## PAGER
export PAGER="$LESS_EXECUTABLE"

## VISUAL
export VISUAL="$NVIM_EXECUTABLE"

# Path-related environment variables
## C/C++
### C
typeset -T C_INCLUDE_PATH c_include_path
c_include_path+=("$C_LIBRARIES_FLIBS_INCLUDE_DIR")
c_include_path+=("$C_LIBRARIES_FLIBS_INCLUDE_DIR/f-core")

# Source a secondary .zshenv file if it exists in $ZDOTDIR
if [ "$ZSHENV_ONLY" = false ] && [ -f "$ZDOTDIR/.zshenv_secondary" ]; then
  . "$ZDOTDIR/.zshenv_secondary"
fi

# Aliases for rebuilding cache
alias zr='print -P "%F{red}"\
  && /usr/bin/trash "$ZSH_CACHE_DIR"\
  && printf "trash \"%s\"\n" "$ZSH_CACHE_DIR"\
  && "$FD_EXECUTABLE" -H --regex "^.*((\.zwc(\.old)?)|(\.zcompdump.*))$" -p "$ZDOTDIR"\
  | "$PARALLEL_EXECUTABLE" "\
   printf \"trash \\\"%s\\\"\n\" \"{}\";\
   /usr/bin/trash \"{}\""\
  && print -P "%F{reset}"'

# Profiling
if [ "$ZSH_DEBUG" = true ] && [ "$ZSHENV_ONLY" = true ]; then
  zprof
fi

# References
## Bash
### "Bash Features, § 6.2: Bash Startup Files". https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files

## GnuPG
### "What are the correct permissions for the .gnupg enclosing folder?". https://superuser.com/a/954536

## Java
### "How to set JAVA_HOME environment variable on Mac OS X 10.9?". https://stackoverflow.com/a/61204433

## TeX
### "The TeX Live Guide—2025, § 2.3: Overview of the predefined texmf trees". https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-110002.3

## XDG specifications
### "Interoperability specifications". https://www.freedesktop.org/wiki/Specifications/
### "XDG Base Directory Specification". https://specifications.freedesktop.org/basedir-spec/latest/
### "XDG Base Directory". https://wiki.archlinux.org/title/XDG_Base_Directory

## Zsh
### "An Introduction to the Z Shell, § 3: Startup Files". https://zsh.sourceforge.io/Intro/intro_3.html
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
