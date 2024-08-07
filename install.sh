#!/bin/bash

display_message() {
    cat <<"EOF"
   ______      _______           __ 
  / ____/_  __/ / __(_)_________/ /_
 / / __/ / / / / /_/ / ___/ ___/ __/
/ /_/ / /_/ / / __/ / /  (__  ) /_  
\____/\__, /_/_/ /_/_/  /____/\__/  
    /____/                         
EOF
    echo "This script will help you setup my NeoVim configuration"
}

wait_time() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        echo -ne "$seconds"
        sleep 0.25
        echo -ne "."
        sleep 0.25
        echo -ne "."
        sleep 0.25
        echo -ne "."
        sleep 0.25
        : $((seconds--))
    done
    echo -ne "0\n"
}

update_and_install() {
    if [ -f /etc/arch-release ]; then
        pacman -Sy
        pacman -S neovim --noconfirm
    else
        apt-get update
        apt-get install neovim -y
    fi
}

install_neovim() {
    echo "Installing NeoVim..."
    
    if ! command -v nvim >/dev/null 2>&1; then
        echo -e "NeoVim is not installed"
        # Update the package list
        if [  "$EUID" -ne 0 ]; then
            echo -e "Asking for root password to update and install NeoVim..."
            sudo bash -c "$(declare -f update_and_install); update_and_install"
        else
            update_and_install
        fi
        echo -e "\nNeoVim installed"
    else
        echo -e "NeoVim is already installed"
    fi
}

copy_config() {
    # Copy the configuration files to the NeoVim config directory
    echo -e "Copying the configuration files..."
    rm -rf ~/.config/nvim
    cp -r ./nvim ~/.config/nvim
    if [ -d ~/.config/nvim ]; then
        echo -e "Configuration files copied"
    else
        echo -e "Error: Configuration files not copied"
        exit 1
    fi
}

backup_config() {
    local backup_dir=~/.config/nvim_backup.$(date +%Y-%m-%d_%H-%M-%S)
    # Backup the current configuration files
    echo -e "\nBacking up the current configuration files..."
    mv ~/.config/nvim $backup_dir
    echo -e "\nCurrent configuration files backed up to '$backup_dir'\n"
}

main() {
   # Clear the screen
    clear

    # Display the welcome message
    display_message

    # Draw a line
    echo -e "\n-----------------------------------------------------------\n"

    # Display the warning message   
    echo -e "Starting the setup process...\nThis script will install NeoVim and copy my configuration files"
    if [ -d ~/.config/nvim ]; then
        echo -e "\n-----------------------------------------------------------"
        echo -e "WARNING: The directory '~/.config/nvim' already exists"
        read -p "Do you want to backup it? [Y/n]: " choice
        : ${choice:="Y"}
        if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
            backup_config
        else
            echo -e "\nWARNING: Your current configuration will be overwritten\n"
        fi
    fi
    echo -e "The installation will start in 5 seconds\nYou can cancel the installation by pressing Ctrl + C"
    wait_time 5

    # Draw a line
    echo -e "\n-----------------------------------------------------------\n"

    # Install neovim depending of the Linux distribution
    install_neovim

    # Draw a line
    echo -e "\n-----------------------------------------------------------\n"

    # Copy the configuration files
    copy_config

    # Draw a line
    echo -e "\n-----------------------------------------------------------\n"

    # Display the completion message
    echo "Setup completed"
    echo "Enjoy my NeoVim config!"
    echo "Thank you for using this script"
    echo "You can now experiment the config by typing 'nvim' in your terminal"
}

main
