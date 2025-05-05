#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# Clear screen
# printf '\33c\e[3J'

# Restrict checking zcompdump to once a day
# autoload -Uz compinit
# compinit -d "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"
# if [[ -n "$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION(#qN.mh+24)" ]]
#   then
#     compinit
# else
#   compinit -C
# fi

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
path=("$HOMEBREW_PREFIX/bin" $path)
path=("$HOMEBREW_PREFIX/opt/bash/bin" $path)
path=("$HOMEBREW_PREFIX/opt/binutils/bin" $path)
path=("$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/curl/bin" $path)
path=("$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/git/bin" $path)
path=("$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/gnu-which/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/grep/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/gzip/bin" $path)
path=("$HOMEBREW_PREFIX/opt/llvm/bin" $path)
path=("$HOMEBREW_PREFIX/opt/make/libexec/gnubin" $path)
path=("$HOMEBREW_PREFIX/opt/perl/bin" $path)
path=("$HOMEBREW_PREFIX/opt/unzip/bin" $path)
path=("$HOMEBREW_PREFIX/opt/vim/bin" $path)
path=("$HOMEBREW_PREFIX/opt/zip/bin" $path)
path=("$HOMEBREW_PREFIX/opt/zsh/bin" $path)
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
zstyle ':vcs_info:git:*' formats $'\ue725 %b '
setopt PROMPT_SUBST
PROMPT=$'%F{#b4befe}%*%f %F{#b4befe}%~%f %F{#b4befe}\uedfb '
RPROMPT='%F{#b4befe}${vcs_info_msg_0_}'

## VISUAL
export VISUAL="$NVIM_EXECUTABLE"

# Themes and plugins
source "$ZSH_THEMES_DIR/catppuccin-mocha-zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Keybindings (kitty)
bindkey '^U' backward-kill-line   # Ctrl + u
bindkey '^[[Z' complete-word      # Shift + Tab
bindkey '\t\t' autosuggest-accept # Tab + Tab

# Aliases
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

## ccae | Compile C source file and execute
alias ccae='c_compile_and_execute'

## clc | Copy last command
### Source: https://apple.stackexchange.com/a/110541
alias clc='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

## cls | Clear screen
### Source: https://stackoverflow.com/a/29876027
alias cls='printf "\33c\e[3J"'

## cpp | Homebrew-Installed GNU Compiler Collection's cpp
alias cpp='cpp-15'

## diffcu | GNU diff with additions colored green and removals colored red
alias diffcu='diff --color -u'

## ecxl | Show current values of $COLUMNS and $LINES
alias ecxl='echo "\$COLUMNS×\$LINES: $COLUMNS×$LINES"'

## fdeldsstore | Recursively find and delete '.DS_Store' files in current directory
alias fdeldsstore="find . -name '.DS_Store' -print -type f -delete"

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

## gclo | Clone a Git repository into a new directory
alias gclo='git clone'

## gcom | Record changes to current Git branch
alias gcom='git commit -m'

## gdchh | Show characterwise changes between last two Git commits (ignoring newlines)
alias gdchh='printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'' && git diff --color-words=. HEAD^ HEAD && printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'''

## gdhh | Show changes between last two Git commits
alias gdhh='printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'' && git diff HEAD^ HEAD && printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'''

## gdiff | Show changes between Git commits, commit and working tree, et cetera
alias gdiff='git diff'

## gdiffc | Show characterwise changes between Git commits, commit and working tree, et cetera (ignoring newlines)
alias gdiffc='git diff --color-words=.'

## gdifft | Show changes using common diff tools
alias gdifft='git difftool'

## gdomh | Show changes between origin/main and HEAD commits
alias gdomh='printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'' && git diff origin/main HEAD && printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'''

## gdoph | Show changes between origin/private and HEAD commits
alias gdoph='printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'' && git diff origin/private HEAD && printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'''

## gdshh | Show changed files between last two Git commits
alias gdshh='printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'' && git diff --stat HEAD^ HEAD && printf '\''─%.0s'\'' $(seq 1 $(tput cols)) && printf '\''\n'\'''

## gfetch | Download objects and refs from another Git repository
alias gfetch='git fetch'

## glg | Show Git commit logs
alias glg='git log'

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

## isodate | Return current date and time with format similar to ISO 8601 but with additional spaces
alias isodate='echo -e "\e[38;2;166;227;161m$(date +%F'\''  '\''T%H:%M:%S'\''  '\''+07:00)"'

## java8 | Homebrew-Installed Java 8 (Zulu)
alias java8='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home; java -version'

## java17 | Homebrew-Installed Java 17 (Temurin)
alias java17='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home; java -version'

## java21 | Homebrew-Installed Java 21 (Temurin)
alias java21='unset JAVA_HOME; export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home; java -version'

## kas | Kill all Automator services
alias kas='pkill -9 com.apple.automator.runner'

## kitren | Rename current kitty tab and window
alias kitren='kitten_rename'

## latexdelnewline | Delete newline after \begin{document} in a LaTeX file
alias latexdelnewline="sed -i -z 's;\\n\\\\begin{document}\\n\\n;\\n\\\\begin{document}\\n;'"

## less | Use 'bat --paging=always' (with $PAGER) instead of 'less'
alias less='bat --paging=always'

## lmkc | Clean up (remove) all regeneratable files generated by latex and bibtex or biber except dvi, postscript, and pdf
alias lmkc='latexmk -c'

## lmkc+ | Run 'latexmk -c' and clean up additional regeneratable files
alias lmkc+="latexmk -c && find . \( -name '*.aux' -o -name '*.cut' -o -name '*.synctex(busy)' -o -name '*.synctex.gz' \) -type f && echo \"\nfind . \( -name '*.aux' -o -name '*.cut' -o -name '*.synctex(busy)' -o -name '*.synctex.gz' \) -type f -delete\""

## lmklua | Recipe for compiling LuaLaTeX documents with latexmk
alias lmklua='latexmk -lualatex -file-line-error -interaction=nonstopmode -synctex=1'

## lmkpdf | Recipe for compiling pdfLaTeX documents with latexmk
alias lmkpdf='latexmk -pdflatex -file-line-error -interaction=nonstopmode -synctex=1'

## lmkxe | Recipe for compiling XeLaTeX documents with latexmk
alias lmkxe='latexmk -xelatex -file-line-error -interaction=nonstopmode -synctex=1'

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

## nvimdiff | Run Neovim in diff mode
alias nvimdiff='nvim -d'

## nvti | Run Neovim session associated with current directory, enter terminal mode, and silently search backward for branch returned by 'git status'
alias nvti='nvim -c "lua require('\''persistence'\'').load()" -c terminal -c startinsert -c "silent! ?\v(^On branch )@<=(.{-})($)@=" -c nohlsearch'

## refresh | Refresh Finder
alias refresh="osascript -e 'tell application \"Finder\" to tell front window to update every item'"

## stlmu | Update TeX Live with tlmgr
alias stlmu='sudo tlmgr update --self && sudo tlmgr update --all'

## tdlf | Return LaTeX definition of \fmtversion
alias tdlf='texdef -t latex fmtversion'

## which | Homebrew-Installed GNU which
alias which='gwhich'

# Functions in Interactive Shells
## For more info fpath and autoload, see
## https://stackoverflow.com/a/63661686
## https://unix.stackexchange.com/a/526429
fpath=("$ZSH_FUNCTIONS_DIR/interactive" $fpath)

## clear | Clear screen (redefinition)
### Source: https://stackoverflow.com/a/26615036
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/clear"

## c_compile_and_execute | Compile C source files then run its executable
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/c_compile_and_execute"

## copy_bundle_id | Copy bundle ID of macOS application
### Source: https://stackoverflow.com/a/39464824
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/copy_bundle_id"

## exiftool_show_duration | Recursively show duration of audio and video files with ExifTool
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/exiftool_show_duration"

## find_git_repositories | Find Git repositories in ~/.config, ~/Configurations, and ~/Projects
## Source: https://stackoverflow.com/a/4319315
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/find_git_repositories"

## find_stow_local_ignores | Find local ignore lists for GNU stow in ~/.config, ~/Configurations, and ~/Projects
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/find_stow_local_ignores"

## get_bundle_id | Get bundle ID of macOS application
### Source: https://stackoverflow.com/a/39464824
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/get_bundle_id"

## git_squash | Squash last N Git commits
### Source: https://stackoverflow.com/a/5201642
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/git_squash"

## kitten_rename | Rename current kitty tab and window
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/kitten_rename"

## magick_crop_default | My default ImageMagick crop command
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/magick_crop_default"

## magick_extent_default | My default ImageMagick extent command
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/magick_extent_default"

## magick_pdf2image | My default ImageMagick PDF to image conversion command
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/magick_pdf2image"

## magick_return_top_left_color | Return top-left pixel-color
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/magick_return_top_left_color"

## mkcd | Combined mkdir and cd function
### Source: https://unix.stackexchange.com/a/9124
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/mkcd"

## pause | Pause and wait for user input
### Source: https://stackoverflow.com/a/51075278
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/pause"

## pause_and_print_separator | Combined pause and print_separator function
### Source: https://stackoverflow.com/a/51075278
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/pause_and_print_separator"

## print_separator | Print line separator
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/print_separator"

## sevenzip_default | My default 7-Zip command
autoload -Uz "$ZSH_FUNCTIONS_DIR/interactive/sevenzip_default"
