#!/bin/bash

# WezTerm Setup Script
# This script installs WezTerm and sets up the configuration

set -e

echo "🚀 Setting up WezTerm..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# Install WezTerm
echo "📦 Installing WezTerm..."
brew install --cask wezterm

# Create WezTerm config directory if it doesn't exist
WEZTERM_CONFIG_DIR="$HOME/.config/wezterm"
echo "📁 Creating WezTerm config directory: $WEZTERM_CONFIG_DIR"
mkdir -p "$WEZTERM_CONFIG_DIR"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symlink to the config file
CONFIG_FILE="$WEZTERM_CONFIG_DIR/wezterm.lua"
if [ -L "$CONFIG_FILE" ]; then
    echo "🔗 Removing existing symlink..."
    rm "$CONFIG_FILE"
elif [ -f "$CONFIG_FILE" ]; then
    echo "💾 Backing up existing config..."
    mv "$CONFIG_FILE" "$CONFIG_FILE.backup.$(date +%Y%m%d_%H%M%S)"
fi

echo "🔗 Creating symlink to config file..."
ln -s "$SCRIPT_DIR/wezterm.lua" "$CONFIG_FILE"

# Install recommended fonts
echo "🔤 Installing recommended fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono font-fira-code

echo "✅ WezTerm setup complete!"
echo ""
echo "🎉 WezTerm has been installed and configured with a professional setup."
echo ""
echo "📋 Key features included:"
echo "   • Catppuccin Mocha theme (popular dark theme)"
echo "   • JetBrains Mono font with fallbacks"
echo "   • Professional key bindings (Ctrl+Shift+T for new tab, etc.)"
echo "   • Smart tab titles"
echo "   • Custom status bar with git branch info"
echo "   • Pane splitting and management"
echo "   • Hyperlink detection"
echo "   • Performance optimizations"
echo ""
echo "🔧 To reload the configuration:"
echo "   • Press Ctrl+Shift+R in WezTerm"
echo "   • Or restart WezTerm"
echo ""
echo "📚 Key shortcuts:"
echo "   • Ctrl+Shift+T: New tab"
echo "   • Ctrl+Shift+W: Close tab"
echo "   • Ctrl+Tab: Next tab"
echo "   • Ctrl+Shift+Tab: Previous tab"
echo "   • Ctrl+Shift+\\: Split horizontally"
echo "   • Ctrl+Shift+-: Split vertically"
echo "   • Ctrl+Shift+H/J/K/L: Navigate panes"
echo "   • Ctrl+Shift+Z: Toggle pane zoom"
echo "   • Ctrl+Shift+F: Toggle fullscreen"
echo "   • Ctrl+Shift+R: Reload config"
echo ""
echo "🎨 To customize further, edit: $CONFIG_FILE"
