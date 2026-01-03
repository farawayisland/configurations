#!/usr/bin/env zsh
# ~/.config/zsh/.zprofile

# Environment variable which serves as a flag which will be true after
# `eval "$(/opt/homebrew/bin/brew shellenv)"`
# is called (at most once) by my `brew` function which overrides
# (but runs) the Homebrew executable
export HAS_HOMEBREW_SHELLENV_BEEN_EVALUATED=false

# References
## Homebrew
### "How to Install Homebrew on Mac". https://mac.install.guide/homebrew/3
