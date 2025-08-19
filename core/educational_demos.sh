#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                         EDUCATIONAL DEMO SUITE                              ║
# ║                                                                              ║
# ║  🎓 Interactive Security Demonstrations • Live Attack Simulations           ║
# ║  📊 Visual Learning Tools • Real-time Monitoring • Educational Content      ║
# ║  🛡️ Security Concept Visualization • Hands-on Learning • Teacher Tools     ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Colors and effects
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'

# Matrix effects
MATRIX_GREEN='\033[1;32m'
NEON_BLUE='\033[1;96m'
ELECTRIC_YELLOW='\033[1;93m'

# Demo suite banner
show_demo_banner() {
    clear
    echo -e "${MATRIX_GREEN}"
    echo "    ███████╗██████╗ ██╗   ██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗ █████╗ ██╗     "
    echo "    ██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔══██╗██║     "
    echo "    █████╗  ██║  ██║██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████║██║     "
    echo "    ██╔══╝  ██║  ██║██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║██╔══██║██║     "
    echo "    ███████╗██████╔╝╚██████╔╝╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║██║  ██║███████╗"
    echo "    ╚══════╝╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝"
    echo ""
    echo "    ██████╗ ███████╗███╗   ███╗ ██████╗     ███████╗██╗   ██╗██╗████████╗███████╗"
    echo "    ██╔══██╗██╔════╝████╗ ████║██╔═══██╗    ██╔════╝██║   ██║██║╚══██╔══╝██╔════╝"
    echo "    ██║  ██║█████╗  ██╔████╔██║██║   ██║    ███████╗██║   ██║██║   ██║   █████╗  "
    echo "    ██║  ██║██╔══╝  ██║╚██╔╝██║██║   ██║    ╚════██║██║   ██║██║   ██║   ██╔══╝  "
    echo "    ██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝    ███████║╚██████╔╝██║   ██║   ███████╗"
    echo "    ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝"
    echo -e "${NC}"
    echo
    echo -e "${NEON_BLUE}            🎓 INTERACTIVE CYBERSECURITY EDUCATION PLATFORM 🎓${NC}"
    echo -e "${ELECTRIC_YELLOW}         Live Demonstrations • Security Simulations • Learning Tools${NC}"
    echo
}

# Demo menu
show_demo_menu() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                         EDUCATIONAL DEMO CONTROL PANEL                       ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}🔐 CRYPTOGRAPHY DEMOS${NC}              ${ELECTRIC_YELLOW}🌐 NETWORK SECURITY DEMOS${NC}        ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}1.${NC} Hash Function Visualization        ${GREEN}7.${NC} Port Scanning Simulation      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}2.${NC} Encryption/Decryption Demo        ${GREEN}8.${NC} Network Traffic Analysis      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}3.${NC} Password Security Analysis        ${GREEN}9.${NC} Intrusion Detection Demo     ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}4.${NC} Digital Signature Demo            ${GREEN}10.${NC} WiFi Security Assessment     ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}🛡️ SYSTEM SECURITY DEMOS${NC}           ${ELECTRIC_YELLOW}🔍 FORENSICS DEMOS${NC}               ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}5.${NC} Live System Monitoring            ${GREEN}11.${NC} Log Analysis Workshop        ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}6.${NC} Vulnerability Assessment          ${GREEN}12.${NC} Digital Evidence Analysis    ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}🎯 ADVANCED DEMONSTRATIONS${NC}          ${ELECTRIC_YELLOW}📚 EDUCATIONAL TOOLS${NC}             ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}13.${NC} Attack Simulation Scenarios      ${GREEN}15.${NC} Security Concepts Tutorial   ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}14.${NC} Complete Security Audit Demo     ${GREEN}16.${NC} Interactive Quiz System      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${RED}0.${NC} Return to Main Menu                                                     ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -ne "${BOLD}${NEON_BLUE}╭─[${WHITE}EduDemo${NEON_BLUE}]─[${WHITE}Select Demonstration${NEON_BLUE}]${NC}\n${BOLD}${NEON_BLUE}╰─► ${NC}"
}

# Hash function visualization
hash_demo() {
    echo -e "${CYAN}${BOLD}🔗 HASH FUNCTION VISUALIZATION${NC}"
    echo "=============================================="
    echo
    
    echo -e "${BOLD}Understanding Hash Functions:${NC}"
    echo "Hash functions convert input data into fixed-size strings"
    echo "They are one-way functions - you can't reverse them"
    echo "Small changes in input create completely different hashes"
    echo
    
    echo -e "${YELLOW}Let's demonstrate with different inputs:${NC}"
    echo
    
    test_strings=("Hello" "hello" "Hello!" "Hello World" "")
    
    for str in "${test_strings[@]}"; do
        if [ -z "$str" ]; then
            display_str="(empty string)"
            input_str=""
        else
            display_str="\"$str\""
            input_str="$str"
        fi
        
        echo -e "${BOLD}Input: ${GREEN}$display_str${NC}"
        echo -e "${CYAN}MD5:    ${WHITE}$(echo -n "$input_str" | md5sum | cut -d' ' -f1)${NC}"
        echo -e "${CYAN}SHA256: ${WHITE}$(echo -n "$input_str" | sha256sum | cut -d' ' -f1)${NC}"
        echo
        sleep 1
    done
    
    echo -e "${BOLD}Key Observations:${NC}"
    echo "✅ Same input always produces same hash"
    echo "✅ Tiny changes create completely different hashes"
    echo "✅ Hash length is always the same regardless of input size"
    echo "✅ It's computationally infeasible to reverse the process"
    echo
    
    echo -e "${GREEN}🎯 Educational Value: Students learn hash function properties${NC}"
    echo
}

# Encryption demo
encryption_demo() {
    echo -e "${CYAN}${BOLD}🔐 ENCRYPTION/DECRYPTION DEMONSTRATION${NC}"
    echo "=============================================="
    echo
    
    echo -e "${BOLD}Symmetric Encryption with OpenSSL:${NC}"
    echo "We'll encrypt and decrypt a message using AES-256"
    echo
    
    message="This is a secret message for cybersecurity class!"
    password="demo_password_123"
    
    echo -e "${YELLOW}Original Message:${NC}"
    echo -e "${WHITE}\"$message\"${NC}"
    echo
    
    echo -e "${YELLOW}Encrypting with AES-256...${NC}"
    encrypted=$(echo "$message" | openssl aes-256-cbc -a -salt -k "$password" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Encrypted (Base64):${NC}"
        echo -e "${CYAN}$encrypted${NC}"
        echo
        
        echo -e "${YELLOW}Decrypting back to original...${NC}"
        decrypted=$(echo "$encrypted" | openssl aes-256-cbc -d -a -k "$password" 2>/dev/null)
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Decrypted Message:${NC}"
            echo -e "${WHITE}\"$decrypted\"${NC}"
            echo
            
            if [ "$message" = "$decrypted" ]; then
                echo -e "${GREEN}✅ SUCCESS: Original and decrypted messages match!${NC}"
            else
                echo -e "${RED}❌ ERROR: Messages don't match${NC}"
            fi
        else
            echo -e "${RED}❌ Decryption failed${NC}"
        fi
    else
        echo -e "${RED}❌ Encryption failed - OpenSSL not available${NC}"
    fi
    
    echo
    echo -e "${BOLD}Key Concepts Demonstrated:${NC}"
    echo "🔑 Symmetric encryption uses same key for encrypt/decrypt"
    echo "🔒 AES-256 is industry-standard encryption algorithm"
    echo "📊 Base64 encoding makes binary data text-readable"
    echo "🛡️ Strong passwords are essential for security"
    echo
}

# Password security analysis
password_demo() {
    echo -e "${CYAN}${BOLD}🔒 PASSWORD SECURITY ANALYSIS${NC}"
    echo "=============================================="
    echo
    
    echo -e "${BOLD}Testing Password Strength:${NC}"
    echo
    
    # Sample passwords from weak to strong
    passwords=(
        "123:Very Weak"
        "password:Weak"
        "Password1:Fair"
        "MyP@ssw0rd:Good"
        "C0mpl3x!P@ssw0rd#2024:Very Strong"
    )
    
    echo -e "${YELLOW}Password Strength Analysis:${NC}"
    echo
    
    for pass_info in "${passwords[@]}"; do
        password=$(echo "$pass_info" | cut -d: -f1)
        strength=$(echo "$pass_info" | cut -d: -f2)
        length=${#password}
        
        echo -e "${BOLD}Password: ${WHITE}\"$password\"${NC}"
        echo -e "${CYAN}Length: $length characters${NC}"
        
        # Analyze composition
        has_lower=$(echo "$password" | grep -q '[a-z]' && echo "✅" || echo "❌")
        has_upper=$(echo "$password" | grep -q '[A-Z]' && echo "✅" || echo "❌")
        has_digit=$(echo "$password" | grep -q '[0-9]' && echo "✅" || echo "❌")
        has_special=$(echo "$password" | grep -q '[^a-zA-Z0-9]' && echo "✅" || echo "❌")
        
        echo -e "${CYAN}Lowercase letters: $has_lower${NC}"
        echo -e "${CYAN}Uppercase letters: $has_upper${NC}"
        echo -e "${CYAN}Digits: $has_digit${NC}"
        echo -e "${CYAN}Special characters: $has_special${NC}"
        
        case $strength in
            "Very Weak") color="$RED" ;;
            "Weak") color="$RED" ;;
            "Fair") color="$YELLOW" ;;
            "Good") color="$GREEN" ;;
            "Very Strong") color="$GREEN" ;;
        esac
        
        echo -e "${BOLD}Strength: ${color}$strength${NC}"
        echo "─────────────────────────────────────"
        sleep 2
    done
    
    echo
    echo -e "${BOLD}Best Practices for Strong Passwords:${NC}"
    echo "🔸 Minimum 12 characters length"
    echo "🔸 Mix of uppercase and lowercase letters"
    echo "🔸 Include numbers and special characters"
    echo "🔸 Avoid dictionary words and personal info"
    echo "🔸 Use unique passwords for each account"
    echo "🔸 Consider using a password manager"
    echo
}

# Live system monitoring demo
live_monitoring_demo() {
    echo -e "${CYAN}${BOLD}📊 LIVE SYSTEM MONITORING DEMONSTRATION${NC}"
    echo "=============================================="
    echo
    
    echo -e "${YELLOW}Starting real-time system monitoring...${NC}"
    echo -e "${WHITE}Monitoring for 30 seconds - watch the values change!${NC}"
    echo
    
    for i in {1..6}; do
        clear
        echo -e "${CYAN}${BOLD}📊 LIVE SYSTEM MONITORING (Update $i/6)${NC}"
        echo "=============================================="
        echo
        
        # CPU usage
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 || echo "N/A")
        echo -e "${BOLD}CPU Usage: ${GREEN}$cpu_usage%${NC}"
        
        # Memory usage
        mem_info=$(free | grep Mem)
        total_mem=$(echo $mem_info | awk '{print $2}')
        used_mem=$(echo $mem_info | awk '{print $3}')
        if [ "$total_mem" -gt 0 ]; then
            mem_percent=$((used_mem * 100 / total_mem))
        else
            mem_percent=0
        fi
        echo -e "${BOLD}Memory Usage: ${GREEN}$mem_percent%${NC}"
        
        # Load average
        load_avg=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
        echo -e "${BOLD}Load Average: ${GREEN}$load_avg${NC}"
        
        # Active processes
        process_count=$(ps aux | wc -l)
        echo -e "${BOLD}Running Processes: ${GREEN}$process_count${NC}"
        
        # Network connections
        if command -v netstat >/dev/null; then
            net_connections=$(netstat -an | grep ESTABLISHED | wc -l)
            echo -e "${BOLD}Network Connections: ${GREEN}$net_connections${NC}"
        fi
        
        # Disk usage
        disk_usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
        echo -e "${BOLD}Disk Usage: ${GREEN}$disk_usage%${NC}"
        
        echo
        echo -e "${YELLOW}Monitoring... ($((i*5)) seconds elapsed)${NC}"
        sleep 5
    done
    
    echo
    echo -e "${GREEN}✅ Live monitoring demonstration completed!${NC}"
    echo -e "${CYAN}Students observed real-time system metrics and their fluctuations${NC}"
    echo
}

# Complete security audit demo
security_audit_demo() {
    echo -e "${CYAN}${BOLD}🔍 COMPLETE SECURITY AUDIT DEMONSTRATION${NC}"
    echo "=============================================="
    echo
    
    echo -e "${YELLOW}Performing comprehensive security assessment...${NC}"
    echo
    
    # 1. System Information
    echo -e "${BOLD}1. SYSTEM RECONNAISSANCE${NC}"
    echo "─────────────────────────────────"
    echo -e "${GREEN}Hostname: $(hostname)${NC}"
    echo -e "${GREEN}OS: $(uname -s) $(uname -r)${NC}"
    echo -e "${GREEN}Architecture: $(uname -m)${NC}"
    echo -e "${GREEN}Uptime: $(uptime -p 2>/dev/null || uptime | cut -d',' -f1)${NC}"
    echo
    sleep 2
    
    # 2. Network Analysis
    echo -e "${BOLD}2. NETWORK SECURITY ANALYSIS${NC}"
    echo "─────────────────────────────────"
    
    # Check listening ports
    echo -e "${YELLOW}Scanning for open ports...${NC}"
    listening_ports=0
    if command -v netstat >/dev/null; then
        listening_ports=$(netstat -tuln | grep LISTEN | wc -l)
    fi
    echo -e "${GREEN}Listening services: $listening_ports${NC}"
    
    # Network interfaces
    interfaces=$(ip addr show | grep -E "^[0-9]+:" | wc -l)
    echo -e "${GREEN}Network interfaces: $interfaces${NC}"
    echo
    sleep 2
    
    # 3. User Account Analysis
    echo -e "${BOLD}3. USER ACCOUNT SECURITY${NC}"
    echo "─────────────────────────────────"
    
    # Count user accounts
    user_accounts=$(cut -d: -f1 /etc/passwd | wc -l)
    echo -e "${GREEN}Total user accounts: $user_accounts${NC}"
    
    # Check for accounts with shell access
    shell_users=$(grep -E "/bin/bash|/bin/sh" /etc/passwd | wc -l)
    echo -e "${GREEN}Users with shell access: $shell_users${NC}"
    echo
    sleep 2
    
    # 4. File System Security
    echo -e "${BOLD}4. FILE SYSTEM SECURITY${NC}"
    echo "─────────────────────────────────"
    
    # Check for SUID files
    echo -e "${YELLOW}Scanning for SUID executables...${NC}"
    suid_files=$(find /usr/bin /bin /sbin /usr/sbin -perm -4000 -type f 2>/dev/null | wc -l)
    echo -e "${GREEN}SUID executables found: $suid_files${NC}"
    
    # Disk usage
    disk_usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
    if [ "$disk_usage" -gt 80 ]; then
        echo -e "${RED}⚠️  High disk usage: $disk_usage%${NC}"
    else
        echo -e "${GREEN}✅ Disk usage normal: $disk_usage%${NC}"
    fi
    echo
    sleep 2
    
    # 5. Process Analysis
    echo -e "${BOLD}5. RUNNING PROCESS ANALYSIS${NC}"
    echo "─────────────────────────────────"
    
    total_processes=$(ps aux | wc -l)
    echo -e "${GREEN}Total running processes: $total_processes${NC}"
    
    # Check for processes listening on network
    if command -v netstat >/dev/null; then
        network_processes=$(netstat -tulnp 2>/dev/null | grep LISTEN | wc -l)
        echo -e "${GREEN}Network listening processes: $network_processes${NC}"
    fi
    echo
    sleep 2
    
    # 6. Security Assessment Summary
    echo -e "${BOLD}6. SECURITY ASSESSMENT SUMMARY${NC}"
    echo "═════════════════════════════════════════"
    
    # Calculate security score
    score=100
    
    if [ "$disk_usage" -gt 90 ]; then
        score=$((score - 10))
        echo -e "${RED}⚠️  Disk space critically low${NC}"
    fi
    
    if [ "$listening_ports" -gt 20 ]; then
        score=$((score - 5))
        echo -e "${YELLOW}⚠️  Many listening services detected${NC}"
    fi
    
    if [ "$suid_files" -gt 50 ]; then
        score=$((score - 5))
        echo -e "${YELLOW}⚠️  High number of SUID executables${NC}"
    fi
    
    # Display final score
    if [ "$score" -ge 90 ]; then
        color="$GREEN"
        status="EXCELLENT"
    elif [ "$score" -ge 80 ]; then
        color="$GREEN"
        status="GOOD"
    elif [ "$score" -ge 70 ]; then
        color="$YELLOW"
        status="FAIR"
    else
        color="$RED"
        status="NEEDS ATTENTION"
    fi
    
    echo
    echo -e "${BOLD}Overall Security Score: ${color}$score/100 ($status)${NC}"
    echo
    
    echo -e "${GREEN}✅ Security audit demonstration completed!${NC}"
    echo -e "${CYAN}This comprehensive scan demonstrates systematic security assessment${NC}"
    echo
}

# Interactive quiz system
security_quiz() {
    echo -e "${CYAN}${BOLD}🧠 INTERACTIVE CYBERSECURITY QUIZ${NC}"
    echo "=============================================="
    echo
    
    questions=(
        "What does AES stand for?:Advanced Encryption Standard:answer"
        "Which hash algorithm produces 256-bit output?:SHA-256:answer"
        "What is the minimum recommended password length?:12:answer"
        "What does SUID stand for?:Set User ID:answer"
        "Which port is commonly used for HTTPS?:443:answer"
    )
    
    score=0
    total=${#questions[@]}
    
    echo -e "${BOLD}Answer the following cybersecurity questions:${NC}"
    echo
    
    for i in "${!questions[@]}"; do
        question_data="${questions[$i]}"
        question=$(echo "$question_data" | cut -d: -f1)
        correct_answer=$(echo "$question_data" | cut -d: -f2)
        
        echo -e "${YELLOW}Question $((i+1))/$total:${NC}"
        echo -e "${WHITE}$question${NC}"
        echo
        echo -ne "${NEON_BLUE}Your answer: ${NC}"
        read -r user_answer
        
        # Simple answer checking (case insensitive)
        if echo "$user_answer" | grep -qi "$correct_answer"; then
            echo -e "${GREEN}✅ Correct! Great job!${NC}"
            ((score++))
        else
            echo -e "${RED}❌ Incorrect. The correct answer is: $correct_answer${NC}"
        fi
        echo
        sleep 2
    done
    
    # Calculate percentage
    percentage=$((score * 100 / total))
    
    echo -e "${BOLD}QUIZ RESULTS${NC}"
    echo "════════════════════════════════"
    echo -e "${GREEN}Score: $score/$total ($percentage%)${NC}"
    
    if [ "$percentage" -ge 80 ]; then
        echo -e "${GREEN}🎉 Excellent! You have strong cybersecurity knowledge!${NC}"
    elif [ "$percentage" -ge 60 ]; then
        echo -e "${YELLOW}👍 Good job! Keep learning to improve your skills!${NC}"
    else
        echo -e "${RED}📚 Keep studying! Cybersecurity knowledge takes time to build!${NC}"
    fi
    echo
}

# Main demo function
run_educational_demos() {
    while true; do
        show_demo_banner
        show_demo_menu
        read -r choice
        echo
        
        case $choice in
            1)
                hash_demo
                ;;
            2)
                encryption_demo
                ;;
            3)
                password_demo
                ;;
            4)
                echo -e "${CYAN}${BOLD}✍️ DIGITAL SIGNATURE DEMONSTRATION${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}Creating a digital signature with OpenSSL:${NC}"
                echo
                
                # Create a test message
                test_message="Important security document for verification"
                echo -e "${YELLOW}Document to sign:${NC}"
                echo -e "${WHITE}\"$test_message\"${NC}"
                echo
                
                echo -e "${GREEN}✅ Digital signature concepts demonstrated${NC}"
                echo -e "${CYAN}In practice, this would use public/private key pairs${NC}"
                echo
                ;;
            5)
                live_monitoring_demo
                ;;
            6)
                echo -e "${CYAN}${BOLD}🔍 VULNERABILITY ASSESSMENT SIMULATION${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Simulating vulnerability scan...${NC}"
                echo
                
                vulnerabilities=(
                    "Outdated software versions"
                    "Weak password policies"
                    "Unnecessary open ports"
                    "Missing security patches"
                    "Unencrypted data transmission"
                )
                
                for vuln in "${vulnerabilities[@]}"; do
                    echo -e "${RED}⚠️  Found: $vuln${NC}"
                    sleep 1
                done
                
                echo
                echo -e "${GREEN}✅ Vulnerability assessment simulation completed${NC}"
                echo
                ;;
            7)
                echo -e "${CYAN}${BOLD}🌐 PORT SCANNING SIMULATION${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Simulating network port scan...${NC}"
                echo
                
                common_ports=(22 23 25 53 80 110 143 443 993 995 3389)
                
                for port in "${common_ports[@]}"; do
                    if [ $((RANDOM % 3)) -eq 0 ]; then
                        echo -e "${GREEN}Port $port: OPEN${NC}"
                    else
                        echo -e "${RED}Port $port: CLOSED${NC}"
                    fi
                    sleep 0.5
                done
                
                echo
                echo -e "${GREEN}✅ Port scan simulation completed${NC}"
                echo
                ;;
            8)
                echo -e "${CYAN}${BOLD}📈 NETWORK TRAFFIC ANALYSIS DEMO${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Analyzing network traffic patterns...${NC}"
                echo
                
                protocols=("HTTP" "HTTPS" "SSH" "FTP" "DNS" "SMTP")
                
                for protocol in "${protocols[@]}"; do
                    packets=$((RANDOM % 1000 + 100))
                    bytes=$((packets * (RANDOM % 1000 + 500)))
                    echo -e "${GREEN}$protocol: $packets packets, $bytes bytes${NC}"
                    sleep 1
                done
                
                echo
                echo -e "${GREEN}✅ Traffic analysis demonstration completed${NC}"
                echo
                ;;
            9)
                echo -e "${CYAN}${BOLD}🚨 INTRUSION DETECTION SIMULATION${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Monitoring for suspicious activity...${NC}"
                echo
                
                threats=(
                    "Multiple failed login attempts from 192.168.1.100"
                    "Unusual network traffic detected on port 4444"
                    "Suspicious file modification in /etc/passwd"
                    "Unauthorized privilege escalation attempt"
                    "Potential data exfiltration detected"
                )
                
                for threat in "${threats[@]}"; do
                    echo -e "${RED}🚨 ALERT: $threat${NC}"
                    sleep 2
                done
                
                echo
                echo -e "${GREEN}✅ Intrusion detection simulation completed${NC}"
                echo
                ;;
            10)
                echo -e "${CYAN}${BOLD}📡 WIFI SECURITY ASSESSMENT DEMO${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Scanning for wireless networks...${NC}"
                echo
                
                networks=(
                    "HomeWiFi:WPA2:Strong"
                    "GuestNetwork:WEP:Weak"
                    "OfficeNet:WPA3:Very Strong"
                    "OpenWiFi:None:Vulnerable"
                    "CafeWiFi:WPA2:Fair"
                )
                
                for network in "${networks[@]}"; do
                    name=$(echo "$network" | cut -d: -f1)
                    security=$(echo "$network" | cut -d: -f2)
                    strength=$(echo "$network" | cut -d: -f3)
                    
                    case $strength in
                        "Vulnerable") color="$RED" ;;
                        "Weak") color="$RED" ;;
                        "Fair") color="$YELLOW" ;;
                        "Strong") color="$GREEN" ;;
                        "Very Strong") color="$GREEN" ;;
                    esac
                    
                    echo -e "${CYAN}📡 $name${NC} - Security: $security - ${color}$strength${NC}"
                    sleep 1
                done
                
                echo
                echo -e "${GREEN}✅ WiFi security assessment completed${NC}"
                echo
                ;;
            11)
                echo -e "${CYAN}${BOLD}📋 LOG ANALYSIS WORKSHOP${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Analyzing system logs for security events...${NC}"
                echo
                
                log_events=(
                    "Authentication success for user admin"
                    "Failed login attempt from 203.0.113.1"
                    "Privilege escalation detected"
                    "Suspicious file access in /var/log"
                    "Network connection from unknown IP"
                )
                
                for event in "${log_events[@]}"; do
                    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
                    echo -e "${GREEN}[$timestamp]${NC} $event"
                    sleep 1.5
                done
                
                echo
                echo -e "${GREEN}✅ Log analysis workshop completed${NC}"
                echo
                ;;
            12)
                echo -e "${CYAN}${BOLD}🔍 DIGITAL EVIDENCE ANALYSIS${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Examining digital evidence...${NC}"
                echo
                
                evidence=(
                    "File hash verification: MATCH"
                    "Metadata extraction: Complete"
                    "Timeline reconstruction: In progress"
                    "Deleted file recovery: 15 files found"
                    "Network connection logs: Analyzed"
                )
                
                for item in "${evidence[@]}"; do
                    echo -e "${GREEN}✅ $item${NC}"
                    sleep 1.5
                done
                
                echo
                echo -e "${GREEN}✅ Digital evidence analysis completed${NC}"
                echo
                ;;
            13)
                echo -e "${CYAN}${BOLD}🎯 ATTACK SIMULATION SCENARIOS${NC}"
                echo "=============================================="
                echo
                echo -e "${YELLOW}Running controlled attack simulations...${NC}"
                echo
                
                attacks=(
                    "Brute force login simulation"
                    "SQL injection test scenario"
                    "Cross-site scripting (XSS) demo"
                    "Buffer overflow demonstration"
                    "Social engineering awareness"
                )
                
                for attack in "${attacks[@]}"; do
                    echo -e "${RED}🎯 Simulating: $attack${NC}"
                    sleep 2
                    echo -e "${GREEN}   ✅ Countermeasures demonstrated${NC}"
                    sleep 1
                done
                
                echo
                echo -e "${GREEN}✅ Attack simulation scenarios completed${NC}"
                echo
                ;;
            14)
                security_audit_demo
                ;;
            15)
                echo -e "${CYAN}${BOLD}📚 SECURITY CONCEPTS TUTORIAL${NC}"
                echo "=============================================="
                echo
                
                concepts=(
                    "Confidentiality, Integrity, Availability (CIA Triad)"
                    "Defense in Depth Strategy"
                    "Principle of Least Privilege"
                    "Risk Assessment and Management"
                    "Incident Response Planning"
                )
                
                echo -e "${BOLD}Core Cybersecurity Concepts:${NC}"
                echo
                
                for i in "${!concepts[@]}"; do
                    echo -e "${GREEN}$((i+1)). ${concepts[$i]}${NC}"
                    sleep 1.5
                done
                
                echo
                echo -e "${GREEN}✅ Security concepts tutorial completed${NC}"
                echo
                ;;
            16)
                security_quiz
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}❌ Invalid option. Please select 0-16.${NC}"
                ;;
        esac
        
        echo -e "${YELLOW}Press any key to continue...${NC}"
        read -n 1 -s
        clear
    done
}
