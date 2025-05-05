<!-- ~/'Configuration Files/zsh/add-zsh-to-shells' -->
# Add Zsh to shells
## 1. Install Zsh via Homebrew
`brew install zsh`

## 2. Add the Homebrew-Installed Zsh to PATH by inserting the following line before the `export PATH` line in `~/.zshrc`
`path=("$HOMEBREW_PREFIX/opt/zsh/bin" $path)`

## 3. Add Zsh to `/etc/shells`
`echo $(which zsh) | sudo tee -a /etc/shells`

## (Optional) Set Zsh as the default shell for root and the current user respectively, then execute $SHELL or simply restart the terminal for it to take effect
```
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
exec $SHELL
```