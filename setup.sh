#!/bin/bash

# Linux Security Command Center - Setup Script
# Automated installation and configuration

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                 Linux Security Command Center - Setup                       ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo -e "${YELLOW}Warning: Running as root. Some features may require non-root privileges.${NC}"
fi

# Function to check and install packages
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${YELLOW}Installing $1...${NC}"
        if command -v apt-get &> /dev/null; then
            sudo apt-get update -qq && sudo apt-get install -y $2
        elif command -v yum &> /dev/null; then
            sudo yum install -y $2
        elif command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm $2
        else
            echo -e "${RED}Package manager not supported. Please install $1 manually.${NC}"
        fi
    else
        echo -e "${GREEN}✓ $1 is already installed${NC}"
    fi
}

# Install required system packages
echo -e "${CYAN}Installing system dependencies...${NC}"
install_package "python3" "python3"
install_package "pip3" "python3-pip"
install_package "openssl" "openssl"
install_package "nmap" "nmap"
install_package "netstat" "net-tools"

# Install Python packages
echo -e "${CYAN}Installing Python packages...${NC}"
pip3 install --user cryptography tkinter psutil || {
    echo -e "${YELLOW}Some Python packages might need system-level installation${NC}"
    sudo pip3 install cryptography psutil 2>/dev/null || echo -e "${YELLOW}Note: Some GUI features may not work without tkinter${NC}"
}

# Create necessary directories
echo -e "${CYAN}Creating directory structure...${NC}"
mkdir -p logs data/keys data/reports

# Set execute permissions
echo -e "${CYAN}Setting permissions...${NC}"
chmod +x security_center.sh
chmod +x core/*.sh
chmod +x *.sh

# Create log files
touch logs/security.log
touch logs/access.log
touch logs/system.log

# Test installations
echo -e "${CYAN}Testing installations...${NC}"

echo -n "Testing Python GUI... "
if python3 -c "import tkinter; import cryptography; import psutil" 2>/dev/null; then
    echo -e "${GREEN}✓ OK${NC}"
else
    echo -e "${YELLOW}⚠ Some Python modules missing${NC}"
fi

echo -n "Testing CLI tools... "
if command -v openssl &> /dev/null && command -v nmap &> /dev/null; then
    echo -e "${GREEN}✓ OK${NC}"
else
    echo -e "${YELLOW}⚠ Some CLI tools missing${NC}"
fi

echo
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                           Setup Complete!                                   ║${NC}"
echo -e "${GREEN}╠══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${GREEN}║  Quick Start:                                                                ║${NC}"
echo -e "${GREEN}║                                                                              ║${NC}"
echo -e "${GREEN}║  1. Terminal Interface:  ./security_center.sh                               ║${NC}"
echo -e "${GREEN}║  2. GUI Interface:       python3 gui/streamlined_security_gui.py           ║${NC}"
echo -e "${GREEN}║  3. Demo Launcher:       ./demo_launcher.sh                                 ║${NC}"
echo -e "${GREEN}║                                                                              ║${NC}"
echo -e "${GREEN}║  For help and documentation, see README.md                                  ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo
