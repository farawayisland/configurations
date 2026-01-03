<!-- ~/Configurations/zsh/add-zsh-to-shells.md -->
# Add Zsh to shells
## 1. Install Zsh via Homebrew
```
export HOMEBREW_PREFIX="/opt/homebrew"
[ -f "$HOMEBREW_PREFIX/bin/brew" ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[ -f "$HOMEBREW_PREFIX/opt/zsh/bin/zsh" ] || brew install zsh
```

## 2. Add the Homebrew-installed Zsh to PATH by inserting the following line before the `export PATH` line in `${ZDOTDIR:-$HOME}/.zshrc`
`path=("$HOMEBREW_PREFIX/opt/zsh/bin" $path)`

## [3. Add Zsh to `/etc/shells`, then change the login shell in `System Settings.app > Users & Groups > <User> > Advanced Options… > Login shell` to `$HOMEBREW_PREFIX/opt/zsh/bin/zsh`](https://stackoverflow.com/a/44547726)
`printf '%s\n' "$HOMEBREW_PREFIX/opt/zsh/bin/zsh" | sudo tee -a "/etc/shells"`

## (Optional) Set Homebrew-installed Zsh as the default shell for root and the current user respectively, then execute $SHELL or simply restart the terminal for it to take effect
```
sudo chsh -s "$HOMEBREW_PREFIX/opt/zsh/bin/zsh"
chsh -s "$HOMEBREW_PREFIX/opt/zsh/bin/zsh"
exec "$SHELL"
```
