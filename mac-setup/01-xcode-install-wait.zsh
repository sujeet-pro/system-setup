#!/bin/bash

# Function to check if Xcode Command Line Tools are installed
check_xcode_tools_installed() {
    xcode-select -p &>/dev/null
    return $?
}

# Prompt to install Xcode Command Line Tools if not installed
install_xcode_tools() {
    echo "Checking if Xcode Command Line Tools are installed..."
    if check_xcode_tools_installed; then
        echo "Xcode Command Line Tools are already installed."
    else
        echo "Xcode Command Line Tools are not installed. Starting installation..."
        xcode-select --install &

        # Wait for the installation to complete
        echo "Waiting for the installation to complete. Please follow any on-screen prompts."
        while check_xcode_tools_installed; [ $? -ne 0 ]; do
            sleep 5
        done
        echo "Xcode Command Line Tools installation completed."
    fi
}

# Main script
install_xcode_tools

# Proceed with the next steps
echo "Running the next steps..."
# Add the rest of your script here
