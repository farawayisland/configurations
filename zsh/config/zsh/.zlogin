#!/usr/bin/env zsh
# ~/.config/zsh/.zlogin
# Execute code in the background to not affect the current session
(
  # Set path for and recompile zcompdump, if modified, to increase startup speed
  autoload -Uz zrecompile
  zcompdump="$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]
    then
      zrecompile -pq "$zcompdump"
  fi
  # Recompile .zshenv, .zshenv_secondary, .zprofile, and .zshrc
  zrecompile -pq "$HOME/.zshenv"
  zrecompile -pq "$ZDOTDIR/.zshenv_secondary"
  zrecompile -pq "$ZDOTDIR/.zprofile"
  zrecompile -pq "$ZDOTDIR/.zshrc"
) &!
