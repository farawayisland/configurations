#!/usr/bin/env zsh
# ~/.config/zsh/.zlogout

# Profiling
if [ "$ZSH_DEBUG" = true ] && [ "$ZSHENV_ONLY" = false ]; then
  zprof
fi
