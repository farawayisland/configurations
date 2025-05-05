#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# Clear screen
# printf '\e[2J\e[3J\e[1;1H'

# Colors
# autoload -Uz colors
# colors

# Environment variables
## PATH
[ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"
path=("$BINUTILS_BINARIES_DIR" $path)
path=("$CARGO_BINARIES_DIR" $path)
path=("$COREUTILS_BINARIES_DIR" $path)
path=("$FINDUTILS_BINARIES_DIR" $path)
path=("$HOMEBREW_BINARIES_DIR" $path)
path=("$HOMEBREW_OPTIONAL_DIR/bash/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/curl/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gawk/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/git/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-sed/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-tar/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-time/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gnu-which/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/grep/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/gzip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/llvm/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/make/libexec/gnubin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/man-db/libexec/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/perl/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/unzip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/vim/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/zip/bin" $path)
path=("$HOMEBREW_OPTIONAL_DIR/zsh/bin" $path)
path=("$JAVA_BINARIES_DIR" $path)
path=("$NVIM_VENV_BINARIES_DIR" $path)
path=("$RUSTUP_BINARIES_DIR" $path)
path=("$UV_PYTHON_DIR/cpython-3.14.0-macos-aarch64-none/bin" $path)
path=("$ZSH_SCRIPTS_DIR/package-management/fonts/bin" $path)
path=("$ZSH_SCRIPTS_DIR/package-management/homebrew/bin" $path)
path=("$ZSH_SCRIPTS_DIR/project-management/c/bin" $path)
path=("$ZSH_SCRIPTS_DIR/system-settings/bin" $path)
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

# Themes and plugins
. "$ZSH_THEMES_DIR/catppuccin-mocha-zsh-syntax-highlighting.zsh"
. "$ZSH_AUTOCOMPLETE_DIR/zsh-autocomplete.plugin.zsh"
. "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh"
. "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh"

# Keybindings (kitty)
bindkey '^U' backward-kill-line   # Ctrl + u
bindkey '^[[Z' complete-word      # Shift + Tab
bindkey '\t\t' autosuggest-accept # Tab + Tab

# Aliases
## anv | Activate Neovim's Python virtual environment
alias anv=". $NVIM_VENV_BINARIES_DIR/activate"

## av | Activate current project's Python virtual environment
alias av='. .venv/bin/activate'

## b | Run `brew`
alias b='brew'

## bcl | Clean Homebrew cache
alias bcl='brew cleanup -s && rm -fr "$HOMEBREW_CACHE"'

## bcr | Create Brewfile
alias bcr="$ZSH_SCRIPTS_DIR/package-management/homebrew/bin/create_brewfile"

## blp | List Homebrew packages and Mac App Store applications
alias blp="\
  $ZSH_SCRIPTS_DIR/package-management/homebrew/bin/list_homebrew_packages"

## bu | Update Homebrew, Homebrew packages,
## and upgrade Mac App Store applications
alias bu='brew update && brew upgrade && mas upgrade'

## c++ | Homebrew-Installed GNU Compiler Collection's c++
alias c++='c++-15'

## cat | Use `bat --style=plain --paging=never` instead of `cat`
alias cat='bat -pp'

## cca | Compile C object files into a static library
alias cca='c_compile_into_static_library'

## cce | Compile C source file into an executable
alias cce='c_compile_into_executable'

## cco | Compile C source file into an object file
alias cco='c_compile_into_object_file'

## ccr | Compile C source file into an executable that would be run
alias ccr='c_compile_and_run'

## ccs | Compile C object files into a shared library
alias ccs='c_compile_into_shared_library'

## cdc | Run `cdecl explain`
alias cdc='cdecl explain'

## cdh | Run `cdecl`
alias cdh='cdecl'

## ci | Initialize C-project directory
alias ci='c_init'

## cl | Copy last command
### Source: https://apple.stackexchange.com/a/110541
alias cl='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

## clo | Copy last command output
### Source: https://serverfault.com/a/364443
alias clo='printf "$(!!)" | pbcopy'

## cls | Clear screen
## Sources:
## https://apple.stackexchange.com/a/318217
## https://stackoverflow.com/a/26615036
alias cls='printf "\e[2J\e[3J\e[1;1H"'

## cres | Reset terminal emulator's foreground color
alias crs='reset_color'

## cpp | Homebrew-Installed GNU Compiler Collection's cpp
alias cpp='cpp-15'

## cwd | Copy current working directory
alias cwd='printf "%s" "$PWD" | sed "s;$HOME;\$HOME;g" | pbcopy'

## d | GNU diff with separators, green-colored additions,
## and red-colored removals
alias d='diff_with_separators'

## delce | Recursively find and delete '*-c-executable*' files
## in current directory
alias delce="find . -name '*-c-executable*' -print -type f -delete"

## delds | Recursively find and delete '.DS_Store' files in current directory
alias delds="find . -name '.DS_Store' -print -type f -delete"

## deldsym | Recursively find and delete '*.dSYM' dirs in current directory
alias deldsym="find . -path '*/*.dSYM*' -print -delete"

## dv | Deactivate currently-active Python virtual environment
alias dv='deactivate'

## es | Silently run Vim's or Neovim's Ex command then exit
alias es='ex_in_silent_mode'

## g | Run `git`
alias g='git'

## g++ | Homebrew-Installed GNU Compiler Collection's g++
alias g++='g++-15'

## ga | Add file contents to current Git index
alias ga='git add'

## gaclm | Add file contents in current directory to current Git index,
##         copy last Git commit message, and
##         record changes to current Git branch
alias gaclm='git add .\
  && printf "$(git log -1 --pretty=%B)" | pbcopy\
  && git commit -m "$(pbpaste)"'

## gb | List, create, or delete Git branches
alias gb='git branch'

## gbc | Show current Git branch
alias gbc='git branch --show-current'

## gc | Record changes to current Git branch
alias gc='git commit -m'

## gca | Amend last Git commit's message
alias gca='git commit --amend -m'

## gcc | Homebrew-Installed GNU Compiler Collection's gcc
alias gcc='gcc-16'

## gchp | Apply the changes introduced by some existing Git commits
alias gchp='git cherry-pick'

## gcl | Copy last Git commit message
alias gcl='printf "$(git log -1 --pretty=%B)" | pbcopy'

## gclm | Record changes to current Git branch with last commit message
alias gclm='printf "$(git log -1 --pretty=%B)" | pbcopy\
  && git commit -m "$(pbpaste)"'

## gcln | Clone a Git repository into a new directory
alias gcln='git clone'

## gcn | Get and set repository-specific or global Git options
alias gcn='git config'

## gd | Show changes between Git commits, commit and working tree, et cetera
alias gd='git_diff_with_separators'

## gdc | Show characterwise changes between Git commits,
# commit and working tree, et cetera (ignoring newlines)
alias gdc='git_diff_with_separators --color-words=.'

## gdcn | Show changes between Git commit-parent pairs counting from HEAD
alias gdcn='git_diff_with_separators_counting_from_head --color-words=.'

## gdchh | Show characterwise changes between
## last two Git commits (ignoring newlines)
alias gdchh='git_diff_with_separators --color-words=. HEAD^ HEAD'

## gdhh | Show changes between last two Git commits
alias gdhh='git_diff_with_separators HEAD^ HEAD'

## gdn | Show changes between Git commit-parent pairs counting from HEAD
alias gdn='git_diff_with_separators_counting_from_head'

## gdomh | Show changes between origin/main and HEAD commits
alias gdomh='git_diff_with_separators origin/main HEAD'

## gdoph | Show changes between origin/private and HEAD commits
alias gdoph='git_diff_with_separators origin/private HEAD'

## gds | Show changed files between Git commits
alias gds='git_diff_with_separators --stat'

## gdshh | Show changed files between last two Git commits
alias gdshh='git_diff_with_separators --stat HEAD^ HEAD'

## gdsn | Show changed files between Git commit-parent pairs counting from HEAD
alias gdsn='git_diff_with_separators_counting_from_head --stat'

## gdt | Show changes using common diff tools
alias gdt='git difftool'

## gf | Download objects and refs from another Git repository
alias gf='git fetch'

## gl | Show Git commit logs with separators
alias gl='git_log_with_separators'

## gla | Show Git commit logs authored by current user with separators
alias gla='git_log_with_separators --author="$(git config user.name)"'

## gls | List tracked files in current directory of current Git branch
alias gls="ls --group-directories-first --color=auto -d\
  \$(git ls-tree --name-only HEAD)"

## glsf | List tracked files in root of current Git branch
alias glsf="ls --group-directories-first --color=auto -d\
  \$(git ls-tree --full-tree --name-only HEAD)"

## glsfr | List tracked files in root of current Git branch recursively
alias glsfr='ls --color=auto -d $(git ls-tree --full-tree --name-only -rt HEAD)'

## glsr | List tracked files in current directory
## of current Git branch recursively
alias glsr='ls --color=auto -d $(git ls-tree --name-only -rt HEAD)'

## gplom | Pull from main branch of origin remote Git repository
alias gplom='git pull origin main'

## gm | Join two or more Git development histories together
alias gm='git merge'

## gmv | Move or rename Git-tracked files, directories, or symlinks
alias gmv='git mv'

## gpsom | Push to main Git branch of origin remote repository
alias gpsom='git push origin main'

## gpsop | Push to private Git branch of origin remote repository
alias gpsop='git push origin private'

## gpl | Fetch from and integrate with another Git repository
## or local Git branch
alias gpl='git pull'

## gps | Update refs of remote Git repository along with associated objects
alias gps='git push'

## gr | Run `git_review`
alias gr='git_review'

## grb | Reapply commits on top of another base tip
alias grb='git rebase'

## grbi | Interactively reapply Git commits on top of another base tip
alias grbi='git rebase -i'

## grc | Run `git_review` with option `--color-words=.`
alias grc='git_review --color-words=.'

## grchh | Run `git_review` with option `--color-words=.` for last two commits
alias grchh='git_review --color-words=. HEAD^ HEAD'

## grcn | Run `git_review_counting_from_head` with option `--color-words=.`
alias grcn='git_review_counting_from_head --color-words=.'

## grhh | Run `git_review` for last two commits
alias grhh='git_review HEAD^ HEAD'

## grn | Run `git_review_counting_from_head`
alias grn='git_review_counting_from_head'

## grs | Reset current Git HEAD to the specified state
alias grs='git reset'

## grslm | Rename last Git commit message with second-to-last commit message
alias grslm='git reset --soft HEAD^\
  && printf "$(git log -1 --pretty=%B)" | pbcopy\
  && git commit -m "$(pbpaste)"'

## grst | Restore current Git working tree files
alias grst='git restore'

## grsts | Unstage current Git working tree files
alias grsts='git restore -S'

## grstsw | Unstage and revert current Git working tree files to HEAD
alias grstsw='git restore -S -s HEAD -W'

## grfl | Manage Git reflog information
alias grfl='git reflog'

## grm | Remove files from current Git working tree and index
alias grm='git rm'

## grmt | Manage set of tracked repositories
alias grmt='git remote'

## gsa | Add submodule file contents to current Git index
alias gsa='git submodule add'

## gsan | Sanitize files with no newlines at end-of-file
alias gsan='git_sanitize'

## gsb | Initialize, update, or inspect Git submodules
alias gsb='git submodule'

## gsbls | List Git submodules in current repository
alias gsbls="git config --list | grep --color=auto -oP\
  '(?<=^sbmodule\.).*?\.git$'"

## gsbu | Update sbmodules in current Git branch
alias gsbu='git sbmodule update --remote --merge'

## gsh | Show various types of Git-tracked objects
alias gsh='git_show_with_separators'

## gsha | Return shortened hash of current Git commit
alias gsha='git rev-parse --short HEAD'

## gshc | Show various types of Git-tracked objects with characterwise option
alias gshc='git_show_with_separators --color-words=.'

## gsl | Show last Git commit message
alias gsl='print_separator\
  && print_green -n\
  && git log -1 --pretty=%B | head -n -1\
  && reset_color\
  && print_separator'

## gsq | Squash last N Git commits
alias gsq='git_squash'

## gsrs | Reset submodules in current Git branch
alias gsrs='git submodule deinit -f . && git submodule update --init'

## gsw | Switch Git branches
alias gsw='git switch'

## gswm | Switch to main Git branch
alias gswm='git switch main'

## gswp | Switch to private Git branch
alias gswp='git switch private'

## gu | Show status of current Git branch
alias gu='git status'

## guisw | Ignore a previously Git-tracked file from the index
alias guisw='git update-index --skip-worktree'

## h | Collection of community-maintained help pages for command-line tools
alias h='tldr'

## isc | My Inkscape format-conversion command
alias isc='inkscape_conv'

## isodate | Return current date and time with format similar to ISO 8601
## but with additional spaces
alias isodate='printf "%s\n" "$(date +%F'\''  '\''T%H:%M:%S'\''  '\''+07:00)"'

## java8 | Homebrew-Installed Java 8 (Zulu)
alias java8="unset JAVA_HOME;\
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home;\
  java -version"

## java17 | Homebrew-Installed Java 17 (Temurin)
alias java17="unset JAVA_HOME;\
  export\
    JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home;\
  java -version"

## java21 | Homebrew-Installed Java 21 (Temurin)
alias java21="unset JAVA_HOME;\
  export\
    JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home;
  java -version"

## jkl | List installed Jupyter kernels
alias jkl='jupyter kernelspec list'

## jku | Uninstall Jupyter kernels
alias jku='jupyter kernelspec uninstall'

## kas | Kill all Automator services
alias kas='pkill -9 com.apple.automator.runner'

## kf | Set font size in kitty
alias kf='kitten_set_font_size'

## ko | Open a project directory in kitty
## and run Neovim session associated with said directory in terminal mode
alias ko='kitten_open_project'

## kr | Rename current kitty tab and window
alias kr='kitten_rename'

## kw | Run `kpsewhich`
alias kw='kpsewhich'

## kwv | Run `kpsewhich -var-value`
alias kwv='kpsewhich -var-value'

## la | List almost all files in current directory (except for `.` and `..`) with `lsd`
alias la='lsd -A'

## latexdelnewline | Delete newline after \begin{document} in a LaTeX file
alias latexdelnewline="sed -i -z\
  's;\\n\\\\begin{document}\\n\\n;\\n\\\\begin{document}\\n;'"

## less | Use `bat --paging=always` (with $PAGER) instead of `less`
alias less='bat --paging=always'

## lm | Recipe for compiling LuaLaTeX documents with `latexmk`
alias lm='latexmk -lualatex -file-line-error -interaction=nonstopmode\
  -synctex=1'

## lmc | Run `latexmk -c`
alias lmc='latexmk -c'

## lmca | Run `latexmk -c` and clean up additional regeneratable files
alias lmca="latexmk -c\
  && find . \( -name '*.aux' -o -name '*.cut' -o -name '*.synctex(busy)'\
    -o -name '*.synctex.gz' \) -type f\
  && printf \"\nfind . \( -name '*.aux' -o -name '*.cut'\
    -o -name '*.synctex(busy)' -o -name '*.synctex.gz' \) -type f -delete\n\""

## lmk | Run `latexmk`
alias lmk='latexmk'

## lmp | Recipe for compiling pdfLaTeX documents with `latexmk`
alias lmp='latexmk -pdflatex -file-line-error -interaction=nonstopmode\
  -synctex=1'

## lms | Recipe for compiling LuaLaTeX documents with `latexmk` and
## option `-shell-escape`
alias lms='latexmk -lualatex -file-line-error -interaction=nonstopmode\
  -shell-escape -synctex=1'

## lmx | Recipe for compiling XeLaTeX documents with `latexmk`
alias lmx='latexmk -xelatex -file-line-error -interaction=nonstopmode\
  -synctex=1'

## ls | Use `lsd` instead of `ls`
alias ls='lsd'

## lt | Recurse into directories and present the result as a tree with `lsd`
alias lt='lsd --tree'

## m | Run `make`
alias m='make'

## ma | Run `make all`
alias ma='make all'

## mc | Run `make clean`
alias mc='make clean'

## md | Run `make with-doc`
alias md='make with-doc'

## mgc | My ImageMagick format-conversion command
alias mgc='magick_conv'

## mgco | Return top-left pixel-color
alias mgco='magick_top_left_color'

## mgcr | Crop image
alias mgcr='magick_crop'

## mgd | Diff images
alias mgd='magick_diff'

## mgdp | Diff image-converted PDFs
alias mgdp='magick_diff_pdf'

## mge | Extend image
alias mge='magick_extent'

## mi | Run `make install`
alias mi='make install'

## mn | Run `make -n`
alias mn='make -n'

## ms | Open man page in Neovim and search for option
alias ms='man_search_option'

## nv | Run Neovim
alias nv='nvim'

## nvd | Run Neovim in diff mode
alias nvd='nvim -d'

## nvk | Run Neovim with the `nvims/kickstart` configuration
alias nvk='NVIM_APPNAME=nvims/kickstart nvim'

## nvn | Run Neovim with the `nvims/none` configuration
alias nvn='NVIM_APPNAME=nvims/none nvim'

## nvr | Run Neovim after rebuilding symlinks to the `nvims/kickstart` configuration
alias nvr='trash $NVIM_CONFIG_DIR\
  && mkdir -p $NVIM_CONFIG_DIR\
  && stow -d $NVIM_KICKSTART_CONFIG_DIR -t $NVIM_CONFIG_DIR .\
  && nvim'

## nvs | Run Neovim configuration switcher
alias nvs='nvim_switch_configuration'

## nvt | Run Neovim session associated with current directory,
## enter terminal mode,
## and silently search backward for branch returned by 'git status'
alias nvt='nvim_in_terminal_mode'

## op | My oxipng command
alias op='oxipng_optimize'

## pc | Run `pbcopy`
alias pc='pbcopy'

## pdim | Show current values of $COLUMNS and $LINES
alias pdim='printf "%s\n" "\$COLUMNS×\$LINES: $COLUMNS×$LINES"'

## pg | Run `print_green`
alias pg='print_green'

## png | Run `print_green -n`
alias png='print_green -n'

## pnr | Run `print_red -n`
alias pnr='print_red -n'

## pr | Run `print_red`
alias pr='print_red'

## pst | Run `pbpaste`
alias pst='pbpaste'

## py | Run Python interpreter
alias py='py_interpret'

## refresh | Refresh Finder
alias refresh="osascript -e 'tell application \"Finder\" to tell front window\
 to update every item'"

## src | Source .zshenv and .zshrc files
alias src='. $ZDOTDIR/.zshenv && . $ZDOTDIR/.zshrc'

## sz | My 7-Zip command
alias sz='sevenzip'

## t | Run `tex`
alias t='tex'

## td | Run `texdef`
alias td='texdef'

## tdl | Run `texdef -t latex`
alias tdl='texdef -t latex'

## tdlf | Return LaTeX definition of `\fmtversion`
alias tdlf='texdef -t latex fmtversion'

## tdo | Run `texdoc`
alias tdo='texdoc'

## tdol | Run `texdoc -Il`
alias tdol='texdoc -Il'

## tl | Run `tlmgr`
alias tl='tlmgr'

## tlu | Update TeX Live with tlmgr
alias tlu='sudo tlmgr update --self && sudo tlmgr update --all'

## ua | Add Python-project dependencies
alias ua='uv add'

## ua | Add Python-project dependencies to the development dependency group
alias uad='uv add --dev'

## ui | Initialize new Python project (application by default, i.e., `--app`)
alias ui='uv init'

## uik | Create IPython kernel
alias uik='uv run ipython kernel install --user --env VIRTUAL_ENV $(pwd)/.venv'

## uil | Initialize new Python library project
alias uil='uv init --lib'

## uip | Initialize new Python packaged-application project
alias uip='uv init --package'

## uj | Run Jupyter Lab
alias uj='uv run jupyter lab'

## upl | List Python packages installed in current virtual environment
alias upl='uv pip list'

## ur | Run command or Python script
alias ur='uv run'

## v | Run Vim
alias v="\
  export VIMINIT='\
    let \$MYVIMRC=\"\$VIM_CONFIG_DIR/init.vim\"\
    | source \$MYVIMRC'\
  && vim"

## vd | Run Vim in diff mode
alias vd="\
  export VIMINIT='\
    let \$MYVIMRC=\"\$VIM_CONFIG_DIR/init.vim\"\
    | source \$MYVIMRC'\
  && vim -d"

## which | Homebrew-Installed GNU which
alias which='gwhich'

# Functions in interactive shells
## For more info fpath and autoload, see
## https://stackoverflow.com/a/63661686
## https://unix.stackexchange.com/a/526429
fpath=("$ZSH_INTERACTIVE_FUNCTIONS_DIR" $fpath)

## brew | Function which evaluates Homebrew's shellenv (at most once)
#         and runs the Homebrew executable (redefinition)
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/brew"

## clear | Clear screen (redefinition)
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/clear"

## c_compile_and_run | Compile C source file into
## an executable that would be run
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_and_run"

## c_compile_into_executable | Compile C source file into an executable
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_executable"

## c_compile_into_object_file | Compile C source file into an object file
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_object_file"

## c_compile_into_shared_library | Compile C object files into a shared library
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_shared_library"

## c_compile_into_static_library | Compile C object files into a static library
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_compile_into_static_library"

## c_init | Initialize C-project directory
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/c_init"

## copy_bundle_id | Copy bundle ID of macOS application
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/copy_bundle_id"

## diff_with_separators | Function combination of `diff --color -u`
## and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/diff_with_separators"

## exiftool_show_duration | Recursively show duration of audio
## and video files with ExifTool
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/exiftool_show_duration"

## ex_in_silent_mode | Silently run Vim's or Neovim's Ex command then exit
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/ex_in_silent_mode"

## find_git_repositories | Find Git repositories in ~/.config, ~/Configurations,
## and ~/Projects
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/find_git_repositories"

## find_stow_local_ignores | Find local ignore lists for GNU stow in ~/.config,
## ~/Configurations, and ~/Projects
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/find_stow_local_ignores"

## get_bundle_id | Get bundle ID of macOS application
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/get_bundle_id"

## git_diff_with_separators | Function combination of `git diff` and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_diff_with_separators"

## git_diff_with_separators_counting_from_head | Function combination of
## `git diff` and `print_separator` counting from HEAD
autoload -Uz\
  "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_diff_with_separators_counting_from_head"

## git_log_with_separators | Function combination of `git log`
## and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_log_with_separators"

## git_review | My Git review command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_review"

## git_review_counting_from_head | My Git review command counting from HEAD
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_review_counting_from_head"

## git_sanitize | Sanitize files with no newlines at end-of-file
## and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_sanitize"

## git_show_with_separators | Function combination of `git show`
## and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_show_with_separators"

## git_squash | Squash last N Git commits
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/git_squash"

## inkscape_conv | My Inkscape format-conversion command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/inkscape_conv"

## kitten_open_project | Open a project directory in kitty
## and run Neovim session associated with said directory in terminal mode
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/kitten_open_project"

## kitten_rename | Rename current kitty tab and window
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/kitten_rename"

## kitten_set_font_size | Set font size in kitty
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/kitten_set_font_size"

## magick_crop | My ImageMagick crop command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_crop"

## magick_diff | Diff images
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_diff"

## magick_diff_pdf | Diff image-converted PDFs
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_diff_pdf"

## magick_conv | My ImageMagick format-conversion command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_conv"

## magick_extent | My ImageMagick extent command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_extent"

## magick_top_left_color | Return top-left pixel-color
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/magick_top_left_color"

## man_search_option | Open man page in Neovim and search for option
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/man_search_option"

## mkcd | Function combination of `mkdir` and `cd`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/mkcd"

## nvim_in_terminal_mode | Run Neovim session associated with current directory,
## enter terminal mode,
## and silently search backward for branch returned by 'git status'
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/nvim_in_terminal_mode"

## nvim_switch_configuration | Switch Neovim configurations
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/nvim_switch_configuration"

## oxipng | My oxipng command
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/oxipng_optimize"

## pause | Pause and wait for user input
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/pause"

## pause_and_print_separator | Function combination of `pause`
## and `print_separator`
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/pause_and_print_separator"

## print_green | Print green-colored string
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/print_green"

## print_red | Print red-colored string
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/print_red"

## print_separator | Print line separator
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/print_separator"

## py_interpret | Run Python interpreter
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/py_interpret"

## reset_color | Reset terminal emulator's foreground color
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/reset_color"

## sevenzip | My 7-Zip command.
autoload -Uz "$ZSH_INTERACTIVE_FUNCTIONS_DIR/sevenzip"

## env_parallel | Shell function that exports the current environment
## to GNU parallel
. "$HOMEBREW_BINARIES_DIR/env_parallel.zsh"

# Restrict initialization of completion cache to once a day
autoload -Uz compinit
for dump in "$ZCOMPDUMP"(N.mh+24); do
  compinit -d "$ZCOMPDUMP"
done
compinit -C -d "$ZCOMPDUMP"

# References
## XDG specifications
### "XDG Base Directory, § 2.3: Partial". https://wiki.archlinux.org/title/XDG_Base_Directory#Partial

## Zsh
### "An Introduction to the Z Shell, § 3: Startup Files". https://zsh.sourceforge.io/Intro/intro_3.html
### "Speed up zsh compinit by only checking cache once a day." https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=3994613#gistcomment-3994613
### "The Z Shell Manual, § 20.2.1: Use of compinit". https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit
### "Zsh". https://wiki.archlinux.org/title/Zsh
### "zsh: command not found: {compinstall,compinit,compdef}". https://unix.stackexchange.com/a/477909
### "ZSH: .zprofile, .zshrc, .zlogin - What goes where?". https://apple.stackexchange.com/a/388623
