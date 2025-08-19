#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                      PROJECT DEMONSTRATION SCRIPT                           ║
# ║                                                                              ║
# ║  🎯 Quick Demo Launcher for Teacher Presentations                           ║
# ║  🚀 Automated Interface Testing and Showcase                                ║
# ║  📊 Complete Project Overview and Feature Highlights                        ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'
MATRIX_GREEN='\033[1;32m'
NEON_BLUE='\033[1;96m'

# Demo banner
show_demo_banner() {
    clear
    echo -e "${MATRIX_GREEN}"
    echo "    ██████╗ ███████╗███╗   ███╗ ██████╗     ███████╗██╗   ██╗██╗████████╗███████╗"
    echo "    ██╔══██╗██╔════╝████╗ ████║██╔═══██╗    ██╔════╝██║   ██║██║╚══██╔══╝██╔════╝"
    echo "    ██║  ██║█████╗  ██╔████╔██║██║   ██║    ███████╗██║   ██║██║   ██║   █████╗  "
    echo "    ██║  ██║██╔══╝  ██║╚██╔╝██║██║   ██║    ╚════██║██║   ██║██║   ██║   ██╔══╝  "
    echo "    ██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝    ███████║╚██████╔╝██║   ██║   ███████╗"
    echo "    ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝"
    echo -e "${NC}"
    echo
    echo -e "${NEON_BLUE}        🎯 LINUX SECURITY COMMAND CENTER - TEACHER DEMONSTRATION 🎯${NC}"
    echo -e "${YELLOW}           Complete Cybersecurity Toolkit with Dual Interfaces${NC}"
    echo
}

# Project overview
show_project_overview() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                           PROJECT OVERVIEW                                   ║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${GREEN}📋 Project Name:${NC} Linux Security Command Center"
    echo -e "${GREEN}🎯 Purpose:${NC} Educational Cybersecurity Toolkit"
    echo -e "${GREEN}👨‍🎓 Target Audience:${NC} Students, Educators, Security Professionals"
    echo -e "${GREEN}💻 Interfaces:${NC} Terminal CLI + Modern GUI"
    echo -e "${GREEN}🔧 Technology:${NC} Bash + Python + Tkinter"
    echo
    echo -e "${BOLD}Key Achievements:${NC}"
    echo -e "${GREEN}✅${NC} Complete dual-interface security toolkit"
    echo -e "${GREEN}✅${NC} Real-time system monitoring (5-second updates)"
    echo -e "${GREEN}✅${NC} Advanced cryptographic operations (RSA-2048)"
    echo -e "${GREEN}✅${NC} Network security scanning and analysis"
    echo -e "${GREEN}✅${NC} Digital forensics and log analysis"
    echo -e "${GREEN}✅${NC} Interactive educational demonstrations"
    echo -e "${GREEN}✅${NC} Professional presentation-ready interfaces"
    echo
}

# Feature highlights
show_feature_highlights() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                          FEATURE HIGHLIGHTS                                  ║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    
    echo -e "${BOLD}🔐 CRYPTOGRAPHIC TOOLKIT:${NC}"
    echo "   • Hash Functions: MD5, SHA-1, SHA-256, SHA-512"
    echo "   • RSA Encryption: 2048-bit key generation and operations"
    echo "   • Encoding: Base64, URL, Hex encoding/decoding"
    echo "   • Password Generator: Cryptographically secure passwords"
    echo
    
    echo -e "${BOLD}📊 SYSTEM MONITORING:${NC}"
    echo "   • Real-time CPU, memory, and disk monitoring"
    echo "   • Live process analysis and resource tracking"
    echo "   • Network interface statistics"
    echo "   • 5-second update intervals for live data"
    echo
    
    echo -e "${BOLD}🌐 NETWORK SECURITY:${NC}"
    echo "   • Port scanning (quick and comprehensive)"
    echo "   • Service detection and enumeration"
    echo "   • Active connection monitoring"
    echo "   • Network traffic analysis"
    echo "   • Intrusion detection simulations"
    echo
    
    echo -e "${BOLD}🔍 LOG FORENSICS:${NC}"
    echo "   • System log analysis and parsing"
    echo "   • Authentication monitoring"
    echo "   • Security event detection"
    echo "   • Forensic report generation"
    echo "   • Real-time log monitoring"
    echo
    
    echo -e "${BOLD}🎓 EDUCATIONAL DEMOS:${NC}"
    echo "   • Interactive hash function demonstrations"
    echo "   • Encryption/decryption visualizations"
    echo "   • Password security analysis"
    echo "   • Attack simulation scenarios"
    echo "   • Cybersecurity quiz system"
    echo
}

# Interface comparison
show_interface_comparison() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                         INTERFACE COMPARISON                                 ║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    
    echo -e "${BOLD}🖥️  TERMINAL INTERFACE (CLI):${NC}"
    echo "   • Matrix-style security banner with professional effects"
    echo "   • 10 comprehensive modules with structured navigation"
    echo "   • Color-coded menus and interactive prompts"
    echo "   • Real-time terminal-based monitoring"
    echo "   • Educational demonstrations and simulations"
    echo "   • Perfect for command-line enthusiasts and demonstrations"
    echo
    
    echo -e "${BOLD}🎨 GRAPHICAL INTERFACE (GUI):${NC}"
    echo "   • Modern dark theme with neon blue accents"
    echo "   • 4-tab layout: Hash Functions, RSA Encryption, Password Generator, System Monitor"
    echo "   • Real-time monitoring with live charts and metrics"
    echo "   • User-friendly buttons and input fields"
    echo "   • Professional appearance suitable for presentations"
    echo "   • Perfect for visual demonstrations and user interaction"
    echo
}

# Technical specifications
show_technical_specs() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                        TECHNICAL SPECIFICATIONS                              ║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    
    echo -e "${BOLD}📁 PROJECT STRUCTURE:${NC}"
    echo "   Project/"
    echo "   ├── security_center.sh          # Main CLI launcher"
    echo "   ├── gui/"
    echo "   │   ├── streamlined_security_gui.py    # Main GUI application"
    echo "   │   └── advanced_crypto.py             # RSA cryptographic backend"
    echo "   ├── core/"
    echo "   │   ├── crypto_toolkit.sh              # Cryptographic tools"
    echo "   │   ├── system_monitor.sh              # System monitoring"
    echo "   │   ├── network_security.sh            # Network analysis"
    echo "   │   ├── log_forensics.sh               # Log analysis"
    echo "   │   └── educational_demos.sh           # Demo suite"
    echo "   ├── data/                       # Generated data storage"
    echo "   ├── logs/                       # System logs and reports"
    echo "   └── setup.sh                    # Automated setup script"
    echo
    
    echo -e "${BOLD}⚙️ TECHNICAL DETAILS:${NC}"
    echo "   • Backend: Bash scripting (primary), Python 3"
    echo "   • GUI Framework: Python Tkinter with custom styling"
    echo "   • Cryptography: Python cryptography library, OpenSSL"
    echo "   • Real-time Updates: 5-second intervals for monitoring"
    echo "   • Error Handling: Comprehensive error management"
    echo "   • Portability: Compatible across Linux distributions"
    echo
}

# Quick launcher menu
show_launcher_menu() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                          QUICK DEMO LAUNCHER                                 ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${YELLOW}🚀 DEMONSTRATION OPTIONS${NC}                                                ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}1.${NC} Launch Terminal Interface (CLI)                                      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}2.${NC} Launch GUI Interface                                                ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}3.${NC} Show Project File Structure                                         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}4.${NC} Test All Components                                                 ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}5.${NC} View Documentation                                                  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${RED}0.${NC} Exit Demo Launcher                                                    ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -ne "${BOLD}${NEON_BLUE}╭─[${WHITE}DemoLauncher${NEON_BLUE}]─[${WHITE}Select Option${NEON_BLUE}]${NC}\n${BOLD}${NEON_BLUE}╰─► ${NC}"
}

# Show file structure
show_file_structure() {
    echo -e "${CYAN}📁 PROJECT FILE STRUCTURE${NC}"
    echo "=================================="
    echo
    tree . 2>/dev/null || find . -type f -name "*.sh" -o -name "*.py" -o -name "*.md" | sort
    echo
    echo -e "${GREEN}File Counts:${NC}"
    echo "Bash scripts: $(find . -name "*.sh" | wc -l)"
    echo "Python files: $(find . -name "*.py" | wc -l)"
    echo "Documentation: $(find . -name "*.md" | wc -l)"
    echo "Total project files: $(find . -type f | wc -l)"
    echo
}

# Test components
test_components() {
    echo -e "${CYAN}🧪 TESTING ALL COMPONENTS${NC}"
    echo "=================================="
    echo
    
    echo -e "${YELLOW}Testing file permissions...${NC}"
    if [ -x "./security_center.sh" ]; then
        echo -e "${GREEN}✅ Main script executable${NC}"
    else
        echo -e "${RED}❌ Main script not executable${NC}"
    fi
    
    echo -e "${YELLOW}Testing core modules...${NC}"
    for module in core/*.sh; do
        if [ -f "$module" ]; then
            echo -e "${GREEN}✅ $(basename $module) found${NC}"
        else
            echo -e "${RED}❌ $(basename $module) missing${NC}"
        fi
    done
    
    echo -e "${YELLOW}Testing GUI components...${NC}"
    if [ -f "gui/streamlined_security_gui.py" ]; then
        echo -e "${GREEN}✅ Main GUI found${NC}"
    else
        echo -e "${RED}❌ Main GUI missing${NC}"
    fi
    
    if [ -f "gui/advanced_crypto.py" ]; then
        echo -e "${GREEN}✅ Crypto backend found${NC}"
    else
        echo -e "${RED}❌ Crypto backend missing${NC}"
    fi
    
    echo -e "${YELLOW}Testing Python dependencies...${NC}"
    python3 -c "import tkinter, psutil, cryptography" 2>/dev/null && echo -e "${GREEN}✅ All Python dependencies available${NC}" || echo -e "${YELLOW}⚠️  Some Python dependencies may be missing${NC}"
    
    echo
    echo -e "${GREEN}✅ Component testing completed!${NC}"
    echo
}

# Main demo function
main() {
    while true; do
        show_demo_banner
        show_project_overview
        echo
        show_feature_highlights
        echo
        show_interface_comparison
        echo
        show_technical_specs
        echo
        show_launcher_menu
        
        read -r choice
        echo
        
        case $choice in
            1)
                echo -e "${CYAN}🚀 Launching Terminal Interface...${NC}"
                echo -e "${YELLOW}This will start the CLI security center${NC}"
                echo
                sleep 2
                ./security_center.sh
                ;;
            2)
                echo -e "${CYAN}🎨 Launching GUI Interface...${NC}"
                echo -e "${YELLOW}This will start the graphical interface${NC}"
                echo
                sleep 2
                cd gui && python3 streamlined_security_gui.py
                cd ..
                ;;
            3)
                show_file_structure
                echo -e "${YELLOW}Press any key to continue...${NC}"
                read -n 1 -s
                ;;
            4)
                test_components
                echo -e "${YELLOW}Press any key to continue...${NC}"
                read -n 1 -s
                ;;
            5)
                echo -e "${CYAN}📚 Opening Documentation...${NC}"
                if command -v less >/dev/null; then
                    less README.md
                else
                    cat README.md
                fi
                ;;
            0)
                echo -e "${GREEN}👋 Thank you for viewing the Linux Security Command Center!${NC}"
                echo -e "${CYAN}This project demonstrates comprehensive cybersecurity education tools${NC}"
                echo -e "${YELLOW}with both terminal and GUI interfaces for maximum impact.${NC}"
                echo
                exit 0
                ;;
            *)
                echo -e "${RED}❌ Invalid option. Please select 0-5.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Start demo
main
