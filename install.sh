#!/usr/bin/env bash
# Make sure dotfiles repo is up to date
git pull

echo "Making all directories in home"
scripts/make-directories.sh

echo "Installing dotfiles..."
scripts/install-dotfiles.sh

# Installing all packages
scripts/install-packages.sh

# Enabling services
scripts/enable-services.sh

# Set default shell to zsh
scripts/set-default-to-zsh.sh
echo "Done!"

# Configuring macOS
if [[ $(uname -s) == "Darwin" ]]; then
    echo "macOS detected, running configure script..."
    scripts/configure_macos_defaults.sh
fi
