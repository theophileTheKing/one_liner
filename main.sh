#!/bin/bash

# Exit on error
set -e

# Define variables
INSTALL_DIR="/home/theophile"
APP_NAME="one-liner"
REPO_URL="https://github.com/theophileTheKing/one_liner"
TMP_DIR=$(mktemp -d)

# Print message
echo "Installing $APP_NAME..."

# Fetch the latest release from github
LATEST_RELEASE=$(curl -sL "$REPO_URL/releases/latest" | grep -oP 'tag/\K(.*?)(?=")')
echo "Latest release: $LATEST_RELEASE"

# Download the application script
curl -sL "$REPO_URL/releases/download/$LATEST_RELEASE/$APP_NAME" -o "$TMP_DIR/$APP_NAME"

# Make it executable
chmod +x "$TMP_DIR/$APP_NAME"

# Move to the install directory
sudo mv "$TMP_DIR/$APP_NAME" "$INSTALL_DIR/$APP_NAME"

# Clean up
rm -rf "$TMP_DIR"

# Check the installation
echo "$APP_NAME installed successfully!"
