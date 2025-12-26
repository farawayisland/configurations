#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# Clear screen
# printf '\e[2J\e[3J\e[1;1H'

# Restrict checking zcompdump to once a day
# autoload -Uz compinit
# compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"
# if [[ -n "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION(#qN.mh+24)" ]]
#   then
#     compinit
# else
#   compinit -C
# fi

# Colors
autoload -Uz colors
colors

# Environment variables
## EDITOR
export EDITOR="$NVIM_EXECUTABLE"

## HOMEBREW_FORCE_BREWED_CURL
export HOMEBREW_FORCE_BREWED_CURL=1

## MANPAGER, MANWIDTH
### Source: https://old.reddit.com/r/neovim/comments/1k1k9bz/use_neovim_as_the_default_man_page_viewer/mnya9kr
export MANPAGER="$NVIM_EXECUTABLE --cmd 'set laststatus=0 ' +'set statuscolumn= nowrap laststatus=0' +Man\!"
export MANWIDTH=999

## PAGER
export PAGER="$LESS_EXECUTABLE"

## PATH
. "$CARGO_HOME/env"
path=("$CARGO_BINARIES_DIR" $path)
path=("$HOMEBREW_BINARIES_DIR" $path)
path=("$HOMEBREW_OPTIONAL_DIR/bash/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/binutils/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/coreutils/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/curl/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/findutils/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gawk/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/git/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-sed/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-tar/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-which/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/grep/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gzip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/llvm/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/make/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/perl/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/unzip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/vim/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/zip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/zsh/bin" $path)
path=("$NVIM_VENV_BINARIES_DIR" $path)
path=("$JAVA_HOME/bin" $path)
path=("$UV_PYTHON_DIR/cpython-3.14.0-macos-aarch64-none/bin" $path)
path=("$ZSH_SCRIPTS_DIR/package-management/fonts/bin" $path)
path=("$ZSH_SCRIPTS_DIR/package-management/homebrew/bin" $path)
path=("$ZSH_SCRIPTS_DIR/typesetting/tex/bin" $path)
path=("$ZSH_SCRIPTS_DIR/typesetting/tex/latex/bin" $path)
path=("$ZSH_SCRIPTS_DIR/version-control/git/bin" $path)
path=("$ZSH_SCRIPTS_DIR_PRIVATE/file-archiving/bin" $path)
path=("$ZSH_SCRIPTS_DIR_PRIVATE/version-control/git/bin" $path)
path=("$ZSH_SCRIPTS_DIR_PRIVATE/web-searching/bin" $path)
export PATH

## PROMPT
### Requires a Nerd Font
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' %b '
setopt PROMPT_SUBST
PROMPT='%F{#b4befe}%*%f %F{#b4befe}%~%f %F{#b4befe} '
RPROMPT='%F{#b4befe}${vcs_info_msg_0_}'

## VISUAL
export VISUAL="$NVIM_EXECUTABLE"

# Themes and plugins
. "$ZSH_THEMES_DIR/catppuccin-mocha-zsh-syntax-highlighting.zsh"
. "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
. "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Keybindings (kitty)
bindkey '^U' backward-kill-line   # Ctrl + u
bindkey '^[[Z' complete-word      # Shift + Tab
bindkey '\t\t' autosuggest-accept # Tab + Tab

# Aliases
## anv | Activate Neovim's Python virtual environment
alias anv=". $NVIM_VENV_BINARIES_DIR/activate"

## av | Activate current project's Python virtual environment
alias av='. .venv/bin/activate'

## bcb | Create Brewfile
alias bcb="$ZSH_SCRIPTS_DIR/package-management/homebrew/bin/create_brewfile"

## blp | List Homebrew packages and Mac App Store applications
alias blp="$ZSH_SCRIPTS_DIR/package-management/homebrew/bin/list_homebrew_packages"

## bruu | Update Homebrew, Homebrew packages, and upgrade Mac App Store applications
alias bruu='brew update && brew upgrade && mas upgrade'

## c++ | Homebrew-Installed GNU Compiler Collection's c++
alias c++='c++-15'

## cat | Use 'bat --style=plain --paging=never' instead of 'cat'
alias cat='bat -pp'

## ccr | Compile C source file into an executable that would be run
alias ccr='c_compile_and_run'

## cce | Compile C source file into an executable
alias cce='c_compile_into_executable'

## ccl | Compile C object files into a shared library
alias ccl='c_compile_into_shared_library'

## cco | Compile C source file into an object file
alias cco='c_compile_into_object_file'

## clc | Copy last command
### Source: https://apple.stackexchange.com/a/110541
alias clc='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

## clo | Copy last command output
### Source: https://serverfault.com/a/364443
alias clo='echo !! | pbcopy'

## cls | Clear screen
## Sources:
## https://apple.stackexchange.com/a/318217
## https://stackoverflow.com/a/26615036
alias cls='printf "\e[2J\e[3J\e[1;1H"'

## cres | Reset terminal emulator's foreground color
alias cres='reset_color'

## cpp | Homebrew-Installed GNU Compiler Collection's cpp
alias cpp='cpp-15'

## cwd | Copy current working directory
alias cwd='printf "%s" "$PWD" | sed "s;$HOME;\$HOME;g" | pbcopy'

## dv | Deactivate currently-active Python virtual environment
alias dv='deactivate'

## dw | GNU diff with separators, green-colored additions, and red-colored removals
alias dw='diff_with_separators'

## ecxl | Show current values of $COLUMNS and $LINES
alias ecxl='echo "\$COLUMNS×\$LINES: $COLUMNS×$LINES"'

## es | Silently run Vim's or Neovim's Ex command then exit
alias es='ex_in_silent_mode'

## fdelce | Recursively find and delete '*-c-executable*' files in current directory
alias fdelce="find . -name '*-c-executable*' -print -type f -delete"

## fdelds | Recursively find and delete '.DS_Store' files in current directory
alias fdelds="find . -name '.DS_Store' -print -type f -delete"

## g++ | Homebrew-Installed GNU Compiler Collection's g++
alias g++='g++-15'

## gadd | Add file contents to current Git index
alias gadd='git add'

## gbranch | List, create, or delete Git branches
alias gbranch='git branch'

## gbsc | Show current Git branch
alias gbsc='git branch --show-current'

## gcam | Amend last Git commit's message
alias gcam='git commit --amend -m'

## gcc | Homebrew-Installed GNU Compiler Collection's gcc
alias gcc='gcc-15'

## gchp | Apply the changes introduced by some existing Git commits
alias gchp='git cherry-pick'

## gclm | Copy last Git commit message
alias gclm='printf "$(git log -1 --pretty=%B)" | pbcopy'

## gclo | Clone a Git repository into a new directory
alias gclo='git clone'

## gcom | Record changes to current Git branch
alias gcom='git commit -m'

## gcon | Get and set repository-specific or global Git options
alias gcon='git config'

## gd | Show changes between Git commits, commit and working tree, et cetera
alias gd='git_diff_with_separators'

## gdc | Show characterwise changes between Git commits, commit and working tree, et cetera (ignoring newlines)
alias gdc='git_diff_with_separators --color-words=.'

## gdchh | Show characterwise changes between last two Git commits (ignoring newlines)
alias gdchh='git_diff_with_separators --color-words=. HEAD^ HEAD'

## gdhh | Show changes between last two Git commits
alias gdhh='git_diff_with_separators HEAD^ HEAD'

## gdomh | Show changes between origin/main and HEAD commits
alias gdomh='git_diff_with_separators origin/main HEAD'

## gdoph | Show changes between origin/private and HEAD commits
alias gdoph='git_diff_with_separators origin/private HEAD'

## gds | Show changed files between Git commits
alias gds='git_diff_with_separators --stat'

## gdshh | Show changed files between last two Git commits
alias gdshh='git_diff_with_separators --stat HEAD^ HEAD'

## gdt | Show changes using common diff tools
alias gdt='git difftool'

## gfetch | Download objects and refs from another Git repository
alias gfetch='git fetch'

## gla | Show Git commit logs authored by current user with separators
alias gla='git_log_with_separators --author="$(git config user.name)"'

## glg | Show Git commit logs with separators
alias glg='git_log_with_separators'

## gls | List tracked files in current directory of current Git branch
alias gls='ls --group-directories-first --color=auto -d $(git ls-tree --name-only HEAD)'

## glsf | List tracked files in root of current Git branch
alias glsf='ls --group-directories-first --color=auto -d $(git ls-tree --full-tree --name-only HEAD)'

## glsfr | List tracked files in root of current Git branch recursively
alias glsfr='ls --color=auto -d $(git ls-tree --full-tree --name-only -rt HEAD)'

## glsr | List tracked files in current directory of current Git branch recursively
alias glsr='ls --color=auto -d $(git ls-tree --name-only -rt HEAD)'

## gplom | Pull from main branch of origin remote Git repository
alias gplom='git pull origin main'

## gmerge | Join two or more Git development histories together
alias gmerge='git merge'

## gmv | Move or rename Git-tracked files, directories, or symlinks
alias gmv='git mv'

## gpsom | Push to main Git branch of origin remote repository
alias gpsom='git push origin main'

## gpsop | Push to private Git branch of origin remote repository
alias gpsop='git push origin private'

## gpull | Fetch from and integrate with another Git repository or local Git branch
alias gpull='git pull'

## gpush | Update refs of remote Git repository along with associated objects
alias gpush='git push'

## greb | Reapply commits on top of another base tip
alias greb='git rebase'

## grem | Manage set of tracked repositories
alias grem='git remote'

## gres | Reset current Git HEAD to the specified state
alias gres='git reset'

## gresto | Restore current Git working tree files
alias gresto='git restore'

## grestos | Unstage current Git working tree files
alias grestos='git restore -S'

## grestosw | Unstage and revert current Git working tree files to HEAD
alias grestosw='git restore -S -s HEAD -W'

## grbi | Reapply Git commits on top of another base tip
alias grbi='git rebase -i'

## grfl | Manage Git reflog information
alias grfl='git reflog'

## grm | Remove files from current Git working tree and index
alias grm='git rm'

## grph | Return shortened hash of current Git commit
alias grph='git rev-parse --short HEAD'

## gsadd | Add submodule file contents to current Git index
alias gsadd='git submodule add'

## gsh | Show various types of Git-tracked objects
alias gsh='git_show_with_separators'

## gslm | Show last Git commit message
alias gslm='git_log_with_separators -1 --pretty=%B'

## gsq | Squash last N Git commits
alias gsq='git_squash'

## gsres | Reset submodules in current Git branch
alias gsres='git submodule deinit -f . && git submodule update --init'

## gst | Show status of current Git branch
alias gst='git status'

## gsub | Initialize, update, or inspect Git submodules
alias gsub='git submodule'

## gsubls | List Git submodules in current repository
alias gsubls="git config --list | grep --color=auto -oP '(?<=^submodule\.).*?\.git$'"

## gsur | Update submodules in current Git branch
alias gsur='git submodule update --remote --merge'

## gsw | Switch Git branches
alias gsw='git switch'

## gswm | Switch to main Git branch
alias gswm='git switch main'

## gswp | Switch to private Git branch
alias gswp='git switch private'

## guisw | Ignore a previously Git-tracked file from the index
alias guisw='git update-index --skip-worktree'

## help | Collection of community-maintained help pages for command-line tools
alias help='tldr'

## isodate | Return current date and time with format similar to ISO 8601 but with additional spaces
alias isodate='echo -e "\e[38;2;166;227;161m$(date +%F'\''  '\''T%H:%M:%S'\''  '\''+07:00)"'

## java8 | Homebrew-Installed Java 8 (Zulu)
alias java8='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home; java -version'

## java17 | Homebrew-Installed Java 17 (Temurin)
alias java17='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home; java -version'

## java21 | Homebrew-Installed Java 21 (Temurin)
alias java21='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home; java -version'

## jkl | List installed Jupyter kernels
alias jkl='jupyter kernelspec list'

## jku | Uninstall Jupyter kernels
alias jku='jupyter kernelspec uninstall'

## kas | Kill all Automator services
alias kas='pkill -9 com.apple.automator.runner'

## kitren | Rename current kitty tab and window
alias kitren='kitten_rename'

## la | List almost all files in current directory (except for `.` and `..`) with `lsd`
alias la='lsd -A'

## latexdelnewline | Delete newline after \begin{document} in a LaTeX file
alias latexdelnewline="sed -i -z 's;\\n\\\\begin{document}\\n\\n;\\n\\\\begin{document}\\n;'"

## less | Use 'bat --paging=always' (with $PAGER) instead of 'less'
alias less='bat --paging=always'

## lmk | Run latexmk
alias lmk='latexmk'

## lmkc | Clean up (remove) all regeneratable files generated by latex and bibtex or biber except dvi, postscript, and pdf
alias lmkc='latexmk -c'

## lmkc+ | Run 'latexmk -c' and clean up additional regeneratable files
alias lmkc+="latexmk -c && find . \( -name '*.aux' -o -name '*.cut' -o -name '*.synctex(busy)' -o -name '*.synctex.gz' \) -type f && echo \"\nfind . \( -name '*.aux' -o -name '*.cut' -o -name '*.synctex(busy)' -o -name '*.synctex.gz' \) -type f -delete\""

## lmklua | Recipe for compiling LuaLaTeX documents with latexmk
alias lmklua='latexmk -lualatex -file-line-error -interaction=nonstopmode -synctex=1'

## lmkluas | Recipe for compiling LuaLaTeX documents with latexmk
alias lmkluas='latexmk -lualatex -file-line-error -interaction=nonstopmode -shell-escape -synctex=1'

## lmkpdf | Recipe for compiling pdfLaTeX documents with latexmk
alias lmkpdf='latexmk -pdflatex -file-line-error -interaction=nonstopmode -synctex=1'

## lmkxe | Recipe for compiling XeLaTeX documents with latexmk
alias lmkxe='latexmk -xelatex -file-line-error -interaction=nonstopmode -synctex=1'

## ls | Use `lsd` instead of `ls`
alias ls='lsd'

## lt | Recurse into directories and present the result as a tree with `lsd`
alias lt='lsd --tree'

## mgcd | Crop image
alias mgcd='magick_crop_default'

## mged | Extend image
alias mged='magick_extent_default'

## mgpi | Convert PDF to image
alias mgpi='magick_pdf2image'

## mgrtlc | Return top-left pixel-color
alias mgrtlc='magick_return_top_left_color'

## nv | Run Neovim
alias nv='nvim'

## nvd | Run Neovim in diff mode
alias nvd='nvim -d'

## nvk | Run Neovim with the `nvims/kickstart` configuration
alias nvk='NVIM_APPNAME=nvims/kickstart nvim'

## nvs | Run Neovim configuration switcher
alias nvs='nvim_switch_configuration'

## nvt | Run Neovim session associated with current directory, enter terminal mode, and silently search backward for branch returned by 'git status'
alias nvt='nvim -c "lua require('\''persistence'\'').load()" -c terminal -c startinsert -c "silent! ?\v(^On branch )@<=(.{-})($)@=" -c nohlsearch'

## py | Run Python interpreter
alias py='py_interpret'

## refresh | Refresh Finder
alias refresh="osascript -e 'tell application \"Finder\" to tell front window to update every item'"

## src | Source .zshenv and .zshrc files
alias src='. $ZDOTDIR/.zshenv && . $ZDOTDIR/.zshrc'

## stlmu | Update TeX Live with tlmgr
alias stlmu='sudo tlmgr update --self && sudo tlmgr update --all'

## tdlf | Return LaTeX definition of \fmtversion
alias tdlf='texdef -t latex fmtversion'

## ua | Add Python-project dependencies
alias ua='uv add'

## ua | Add Python-project dependencies to the development dependency group
alias uad='uv add --dev'

## ui | Initialize new Python project
alias ui='uv init'

## uik | Create IPython kernel
alias uik='uv run ipython kernel install --user --env VIRTUAL_ENV $(pwd)/.venv'

## uil | List Python packages installed in current virtual environment
alias uil='uv pip list'

## uj | Run Jupyter Lab
alias uj='uv run jupyter lab'

## ur | Run command or Python script
alias ur='uv run'

## which | Homebrew-Installed GNU which
alias which='gwhich'

# Functions in interactive shells
## For more info fpath and autoload, see
## https://stackoverflow.com/a/63661686
## https://unix.stackexchange.com/a/526429
fpath=("$ZSH_INTERACTIVE_FUNCTIONS_DIR" $fpath)

## clear | Clear screen (redefinition)
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/clear"

## c_compile_and_run | Compile C source file into an executable that would be run
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_and_run"

## c_compile_into_executable | Compile C source file into an executable
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_executable"

## c_compile_into_object_file | Compile C source file into an object file
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_object_file"

## c_compile_into_shared_library | Compile C object files into a shared library
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_shared_library"

## copy_bundle_id | Copy bundle ID of macOS application
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/copy_bundle_id"

## diff_with_separators | Function combination of `diff --color -u` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/diff_with_separators"

## exiftool_show_duration | Recursively show duration of audio and video files with ExifTool
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/exiftool_show_duration"

## ex_in_silent_mode | Silently run Vim's or Neovim's Ex command then exit
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/ex_in_silent_mode"

## find_git_repositories | Find Git repositories in ~/.config, ~/Configurations, and ~/Projects
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/find_git_repositories"

## find_stow_local_ignores | Find local ignore lists for GNU stow in ~/.config, ~/Configurations, and ~/Projects
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/find_stow_local_ignores"

## get_bundle_id | Get bundle ID of macOS application
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/get_bundle_id"

## git_diff_with_separators | Function combination of `git diff` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_diff_with_separators"

## git_log_with_separators | Function combination of `git log` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_log_with_separators"

## git_show_with_separators | Function combination of `git show` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_show_with_separators"

## git_squash | Squash last N Git commits
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_squash"

## kitten_rename | Rename current kitty tab and window
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/kitten_rename"

## magick_crop_default | My default ImageMagick crop command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_crop_default"

## magick_extent_default | My default ImageMagick extent command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_extent_default"

## magick_pdf2image | My default ImageMagick PDF to image conversion command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_pdf2image"

## magick_return_top_left_color | Return top-left pixel-color
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_return_top_left_color"

## mkcd | Function combination of `mkdir` and `cd`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/mkcd"

## nvim_switch_configuration | Switch Neovim configurations
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/nvim_switch_configuration"

## pause | Pause and wait for user input
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/pause"

## pause_and_print_separator | Function combination of `pause` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/pause_and_print_separator"

## print_green | Print green-colored string
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/print_green"

## print_separator | Print line separator
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/print_separator"

## py_interpret | Run Python interpreter
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/py_interpret"

## reset_color | Reset terminal emulator's foreground color
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/reset_color"

# Export environment to GNU Parallel
. "$HOMEBREW_BINARIES_DIR/env_parallel.zsh"
