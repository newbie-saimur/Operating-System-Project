#!/bin/bash

# Cryptographic Toolkit
# Advanced cryptographic operations for security analysis
# Part of Linux Security Command Center

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

display_crypto_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                        CRYPTOGRAPHIC TOOLKIT v2.0                           ║"
    echo "║                                                                              ║"
    echo "║     ██████╗ ██████╗ ██╗   ██╗██████╗ ████████╗ ██████╗                      ║"
    echo "║    ██╔════╝ ██╔══██╗╚██╗ ██╔╝██╔══██╗╚══██╔══╝██╔═══██╗                     ║"
    echo "║    ██║      ██████╔╝ ╚████╔╝ ██████╔╝   ██║   ██║   ██║                     ║"
    echo "║    ██║      ██╔══██╗  ╚██╔╝  ██╔═══╝    ██║   ██║   ██║                     ║"
    echo "║    ╚██████╗ ██║  ██║   ██║   ██║        ██║   ╚██████╔╝                     ║"
    echo "║     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝    ╚═════╝                      ║"
    echo "║                                                                              ║"
    echo "║                 Hash Functions • Encryption • Key Generation                ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_crypto_menu() {
    echo -e "${WHITE}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                    CRYPTOGRAPHIC OPERATIONS                      ║${NC}"
    echo -e "${WHITE}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║  ${GREEN}1${NC}${WHITE}. Hash Generator (MD5/SHA)    ${YELLOW}6${NC}${WHITE}. Base64 Encoding/Decoding    ║${NC}"
    echo -e "${WHITE}║  ${GREEN}2${NC}${WHITE}. RSA Key Generation          ${YELLOW}7${NC}${WHITE}. Password Strength Tester    ║${NC}"
    echo -e "${WHITE}║  ${GREEN}3${NC}${WHITE}. File Encryption             ${YELLOW}8${NC}${WHITE}. Random Number Generator     ║${NC}"
    echo -e "${WHITE}║  ${GREEN}4${NC}${WHITE}. Text Encryption             ${YELLOW}9${NC}${WHITE}. Cryptographic Analysis      ║${NC}"
    echo -e "${WHITE}║  ${GREEN}5${NC}${WHITE}. Digital Signatures          ${RED}0${NC}${WHITE}. Return to Main Menu         ║${NC}"
    echo -e "${WHITE}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${CYAN}Enter your choice [0-9]: ${NC}"
}

hash_generator() {
    echo -e "${GREEN}Hash Generator${NC}"
    echo "1. MD5 Hash"
    echo "2. SHA-1 Hash"
    echo "3. SHA-256 Hash"
    echo "4. SHA-512 Hash"
    read -p "Select hash type [1-4]: " hash_type
    read -p "Enter text to hash: " input_text
    
    case $hash_type in
        1) echo "MD5: $(echo -n "$input_text" | md5sum | cut -d' ' -f1)" ;;
        2) echo "SHA-1: $(echo -n "$input_text" | sha1sum | cut -d' ' -f1)" ;;
        3) echo "SHA-256: $(echo -n "$input_text" | sha256sum | cut -d' ' -f1)" ;;
        4) echo "SHA-512: $(echo -n "$input_text" | sha512sum | cut -d' ' -f1)" ;;
        *) echo -e "${RED}Invalid option!${NC}" ;;
    esac
    read -p "Press Enter to continue..."
}

rsa_key_generation() {
    echo -e "${GREEN}RSA Key Generation${NC}"
    read -p "Enter key size (1024/2048/4096): " keysize
    
    case $keysize in
        1024|2048|4096)
            echo "Generating $keysize-bit RSA key pair..."
            openssl genrsa -out private_key.pem $keysize 2>/dev/null
            openssl rsa -in private_key.pem -pubout -out public_key.pem 2>/dev/null
            echo -e "${GREEN}Keys generated successfully!${NC}"
            echo "Private key: private_key.pem"
            echo "Public key: public_key.pem"
            ;;
        *)
            echo -e "${RED}Invalid key size!${NC}"
            ;;
    esac
    read -p "Press Enter to continue..."
}

file_encryption() {
    echo -e "${GREEN}File Encryption${NC}"
    read -p "Enter file path to encrypt: " filepath
    
    if [ -f "$filepath" ]; then
        read -s -p "Enter password: " password
        echo
        openssl enc -aes-256-cbc -salt -in "$filepath" -out "${filepath}.encrypted" -pass pass:"$password" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}File encrypted successfully: ${filepath}.encrypted${NC}"
        else
            echo -e "${RED}Encryption failed!${NC}"
        fi
    else
        echo -e "${RED}File not found!${NC}"
    fi
    read -p "Press Enter to continue..."
}

text_encryption() {
    echo -e "${GREEN}Text Encryption${NC}"
    read -p "Enter text to encrypt: " plaintext
    read -s -p "Enter password: " password
    echo
    
    encrypted=$(echo "$plaintext" | openssl enc -aes-256-cbc -a -salt -pass pass:"$password" 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Encrypted text:${NC}"
        echo "$encrypted"
    else
        echo -e "${RED}Encryption failed!${NC}"
    fi
    read -p "Press Enter to continue..."
}

base64_operations() {
    echo -e "${GREEN}Base64 Operations${NC}"
    echo "1. Encode"
    echo "2. Decode"
    read -p "Select operation [1-2]: " operation
    
    case $operation in
        1)
            read -p "Enter text to encode: " text
            echo "Encoded: $(echo -n "$text" | base64)"
            ;;
        2)
            read -p "Enter Base64 text to decode: " encoded
            echo "Decoded: $(echo "$encoded" | base64 -d 2>/dev/null)"
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            ;;
    esac
    read -p "Press Enter to continue..."
}

password_strength_test() {
    echo -e "${GREEN}Password Strength Tester${NC}"
    read -s -p "Enter password to test: " password
    echo
    
    length=${#password}
    score=0
    
    # Length check
    if [ $length -ge 8 ]; then
        score=$((score + 25))
    fi
    
    # Uppercase check
    if [[ "$password" =~ [A-Z] ]]; then
        score=$((score + 25))
    fi
    
    # Lowercase check
    if [[ "$password" =~ [a-z] ]]; then
        score=$((score + 25))
    fi
    
    # Number check
    if [[ "$password" =~ [0-9] ]]; then
        score=$((score + 25))
    fi
    
    echo "Password length: $length characters"
    echo "Strength score: $score/100"
    
    if [ $score -eq 100 ]; then
        echo -e "${GREEN}Password strength: EXCELLENT${NC}"
    elif [ $score -ge 75 ]; then
        echo -e "${YELLOW}Password strength: GOOD${NC}"
    elif [ $score -ge 50 ]; then
        echo -e "${YELLOW}Password strength: MODERATE${NC}"
    else
        echo -e "${RED}Password strength: WEAK${NC}"
    fi
    
    read -p "Press Enter to continue..."
}

random_number_generator() {
    echo -e "${GREEN}Random Number Generator${NC}"
    read -p "Enter minimum value: " min
    read -p "Enter maximum value: " max
    read -p "How many numbers to generate: " count
    
    echo "Generated random numbers:"
    for ((i=1; i<=count; i++)); do
        echo "$i: $(shuf -i $min-$max -n 1)"
    done
    
    read -p "Press Enter to continue..."
}

crypto_analysis() {
    echo -e "${GREEN}Cryptographic Analysis${NC}"
    echo "Available analysis tools:"
    echo "1. Character frequency analysis"
    echo "2. Entropy calculation"
    echo "3. Pattern detection"
    
    read -p "Select analysis [1-3]: " analysis
    read -p "Enter text to analyze: " text
    
    case $analysis in
        1)
            echo "Character frequency analysis:"
            echo "$text" | fold -w1 | sort | uniq -c | sort -nr | head -10
            ;;
        2)
            length=${#text}
            unique=$(echo "$text" | fold -w1 | sort -u | wc -l)
            echo "Text length: $length characters"
            echo "Unique characters: $unique"
            echo "Estimated entropy: $(echo "scale=2; $unique * l($unique) / l(2)" | bc -l 2>/dev/null || echo "N/A")"
            ;;
        3)
            echo "Pattern detection (repeated sequences):"
            echo "$text" | grep -o '..' | sort | uniq -c | sort -nr | head -5
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

handle_crypto_choice() {
    case $1 in
        1) hash_generator ;;
        2) rsa_key_generation ;;
        3) file_encryption ;;
        4) text_encryption ;;
        5) echo "Digital signatures - Implementation pending"; read -p "Press Enter to continue..." ;;
        6) base64_operations ;;
        7) password_strength_test ;;
        8) random_number_generator ;;
        9) crypto_analysis ;;
        0) return 0 ;;
        *) echo -e "${RED}Invalid option!${NC}"; read -p "Press Enter to continue..." ;;
    esac
    return 1
}

# Main crypto toolkit loop
main_crypto() {
    while true; do
        display_crypto_banner
        show_crypto_menu
        read -r choice
        if ! handle_crypto_choice "$choice"; then
            break
        fi
    done
}

# Start the crypto toolkit
main_crypto
