<!-- ~/'Configuration Files/bash/add-bash-to-shells.md' -->
# Add Bash to shells
## 1. Install Bash via Homebrew
`brew install bash`

## 2. Add the Homebrew-Installed Bash to PATH by inserting the following line before the `export PATH` line in `~/.bashrc`
`path=("$HOMEBREW_PREFIX/opt/bash/bin" $path)`

## 3. Add Bash to `/etc/shells`
`echo $(which bash) | sudo tee -a /etc/shells`

## (Optional) Set Bash as the default shell for root and the current user respectively, then execute $SHELL or simply restart the terminal for it to take effect
```
sudo chsh -s $(which bash)
chsh -s $(which bash)
exec $SHELL
```