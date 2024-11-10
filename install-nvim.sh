#!/bin/bash

# Function to print messages with colors
print_status() {
    local color=$1
    local message=$2
    case $color in
        "green") echo -e "\e[32m$message\e[0m" ;;
        "red") echo -e "\e[31m$message\e[0m" ;;
        "yellow") echo -e "\e[33m$message\e[0m" ;;
    esac
}

# Function to check command status
check_status() {
    if [ $? -eq 0 ]; then
        print_status "green" "✔ $1 successful"
    else
        print_status "red" "✘ $1 failed"
        exit 1
    fi
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    print_status "yellow" "Git not found. Installing git..."
    sudo apt-get update && sudo apt-get install -y git
    check_status "Git installation"
fi

# Create temporary directory for download
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit 1

# Download latest Neovim AppImage
print_status "yellow" "Downloading latest Neovim AppImage..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
check_status "Download"

# Make AppImage executable
print_status "yellow" "Setting executable permissions..."
chmod u+x nvim.appimage
check_status "Chmod"

# Using sudo only for the system-wide installation steps
print_status "yellow" "Installing Neovim system-wide (requires sudo)..."
sudo mv nvim.appimage /usr/local/bin/nvim
sudo chmod 755 /usr/local/bin/nvim
sudo chown root:root /usr/local/bin/nvim
check_status "Installation"

# Create symbolic link (optional)
if [ -L /usr/local/bin/vim ]; then
    print_status "yellow" "Updating vim symlink (requires sudo)..."
    sudo rm /usr/local/bin/vim
    sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim
    check_status "Symlink creation"
fi

# Clean up
cd - > /dev/null
rm -rf "$TEMP_DIR"

# Clone Neovim configuration
print_status "yellow" "Setting up Neovim configuration..."
CONFIG_DIR="$HOME/.config/nvim"

# Backup existing configuration if it exists
if [ -d "$CONFIG_DIR" ]; then
    print_status "yellow" "Backing up existing Neovim configuration..."
    mv "$CONFIG_DIR" "$CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
    check_status "Configuration backup"
fi

# Clone the configuration repository
print_status "yellow" "Cloning your Neovim configuration..."
git clone https://github.com/raoulg/neovim.git "$CONFIG_DIR"
check_status "Configuration clone"

# Verify installation
print_status "yellow" "Verifying installation..."
if command -v nvim >/dev/null 2>&1; then
    VERSION=$(nvim --version | head -n 1)
    print_status "green" "✔ Neovim installed successfully!"
    print_status "green" "Version: $VERSION"
    print_status "green" "Configuration installed at: $CONFIG_DIR"
    print_status "green" "You can now use 'nvim' command from anywhere in the system"
else
    print_status "red" "✘ Installation verification failed"
    exit 1
fi
