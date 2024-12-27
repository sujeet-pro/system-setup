echo "Starting automated install"
echo "Running 00-system-config.zsh"
zsh ./00-system-config.zsh

echo "Running 01-xcode-install-wait.zsh"
zsh ./01-xcode-install-wait.zsh

echo "Running 02-install-brew-and-cli-tools.zsh"
zsh ./02-install-brew-and-cli-tools.zsh

echo "Running 03-brew-cask-install.zsh"
zsh ./03-brew-cask-install.zsh

echo "Running 04-post-install-config.zsh"
zsh ./04-post-install-config.zsh

echo "Completed automated install"
