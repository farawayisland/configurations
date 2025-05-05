#!/usr/bin/env zsh
# ~/.config/zsh/.zlogin
# Execute code in the background so as not to affect the current session
(
  # Set path for and recompile ZCOMPDUMP if modified
  autoload -Uz zrecompile
  if [[ -s "$ZCOMPDUMP" && (! -s "$zcompdump.zwc" || "$zcompdump" -nt "$zcompdump.zwc") ]]; then
      zrecompile -pq "$ZCOMPDUMP"
  fi

  # Recompile .zshenv, .zshenv_secondary, .zprofile, .zshrc, and .zlogout
  zrecompile -pq "$ZDOTDIR/.zshenv"
  zrecompile -pq "$ZDOTDIR/.zshenv_secondary"
  zrecompile -pq "$ZDOTDIR/.zlogout"
  zrecompile -pq "$ZDOTDIR/.zprofile"
  zrecompile -pq "$ZDOTDIR/.zshrc"
) &!

# References
## Zsh
### "Faster and enjoyable ZSH (maybe)". https://github.com/htr3n/zsh-config/blob/master/zlogin
