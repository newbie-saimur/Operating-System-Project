#!/bin/bash

# Network Security Scanner
# Advanced network analysis and security testing tools
# Part of Linux Security Command Center

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

display_network_banner() {
    clear
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                      NETWORK SECURITY SCANNER v2.0                          ║"
    echo "║                                                                              ║"
    echo "║    ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗           ║"
    echo "║    ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝           ║"
    echo "║    ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝            ║"
    echo "║    ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗            ║"
    echo "║    ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗           ║"
    echo "║    ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝           ║"
    echo "║                                                                              ║"
    echo "║                Port Scanning • Traffic Analysis • Intrusion Detection       ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_network_menu() {
    echo -e "${WHITE}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                    NETWORK SECURITY TOOLS                        ║${NC}"
    echo -e "${WHITE}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║  ${GREEN}1${NC}${WHITE}. Port Scanner               ${YELLOW}7${NC}${WHITE}. Wireless Network Scan       ║${NC}"
    echo -e "${WHITE}║  ${GREEN}2${NC}${WHITE}. Network Discovery          ${YELLOW}8${NC}${WHITE}. Firewall Status Check       ║${NC}"
    echo -e "${WHITE}║  ${GREEN}3${NC}${WHITE}. Service Detection          ${YELLOW}9${NC}${WHITE}. Network Configuration       ║${NC}"
    echo -e "${WHITE}║  ${GREEN}4${NC}${WHITE}. Traffic Monitor            ${YELLOW}10${NC}${WHITE}. Security Assessment         ║${NC}"
    echo -e "${WHITE}║  ${GREEN}5${NC}${WHITE}. Intrusion Detection        ${YELLOW}11${NC}${WHITE}. Network Troubleshoot        ║${NC}"
    echo -e "${WHITE}║  ${GREEN}6${NC}${WHITE}. Vulnerability Scan         ${RED}0${NC}${WHITE}. Return to Main Menu          ║${NC}"
    echo -e "${WHITE}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${CYAN}Enter your choice [0-11]: ${NC}"
}

port_scanner() {
    echo -e "${GREEN}Port Scanner${NC}"
    read -p "Enter target IP address: " target_ip
    read -p "Enter port range (e.g., 1-1000): " port_range
    
    if command -v nmap >/dev/null 2>&1; then
        echo "Scanning $target_ip ports $port_range with nmap..."
        nmap -p $port_range $target_ip
    else
        echo "Using basic port scan (nmap not available)..."
        IFS='-' read -ra RANGE <<< "$port_range"
        start_port=${RANGE[0]}
        end_port=${RANGE[1]}
        
        echo "Scanning ports $start_port to $end_port on $target_ip"
        for ((port=$start_port; port<=$end_port; port++)); do
            if timeout 1 bash -c "echo >/dev/tcp/$target_ip/$port" 2>/dev/null; then
                echo "Port $port: Open"
            fi
        done
    fi
    
    read -p "Press Enter to continue..."
}

network_discovery() {
    echo -e "${GREEN}Network Discovery${NC}"
    echo "Discovering devices on local network..."
    
    # Get local network
    local_ip=$(ip route | grep default | awk '{print $3}' | head -1)
    network=$(ip route | grep "$local_ip" | grep -v default | awk '{print $1}' | head -1)
    
    echo "Local network: $network"
    echo "Scanning for active devices..."
    
    if command -v nmap >/dev/null 2>&1; then
        nmap -sn $network
    else
        echo "Using ping scan (nmap not available)..."
        network_base=$(echo $network | cut -d'/' -f1 | cut -d'.' -f1-3)
        for i in {1..254}; do
            ip="$network_base.$i"
            if ping -c 1 -W 1 $ip >/dev/null 2>&1; then
                echo "Device found: $ip"
            fi
        done
    fi
    
    read -p "Press Enter to continue..."
}

service_detection() {
    echo -e "${GREEN}Service Detection${NC}"
    read -p "Enter target IP address: " target_ip
    
    echo "Detecting services on $target_ip..."
    
    if command -v nmap >/dev/null 2>&1; then
        nmap -sV $target_ip
    else
        echo "Basic service detection (nmap not available)..."
        common_ports=(22 23 25 53 80 110 143 443 993 995)
        
        for port in "${common_ports[@]}"; do
            if timeout 2 bash -c "echo >/dev/tcp/$target_ip/$port" 2>/dev/null; then
                case $port in
                    22) service="SSH" ;;
                    23) service="Telnet" ;;
                    25) service="SMTP" ;;
                    53) service="DNS" ;;
                    80) service="HTTP" ;;
                    110) service="POP3" ;;
                    143) service="IMAP" ;;
                    443) service="HTTPS" ;;
                    993) service="IMAPS" ;;
                    995) service="POP3S" ;;
                    *) service="Unknown" ;;
                esac
                echo "Port $port: $service"
            fi
        done
    fi
    
    read -p "Press Enter to continue..."
}

traffic_monitor() {
    echo -e "${GREEN}Traffic Monitor${NC}"
    echo "Network traffic monitoring options:"
    echo "1. Interface statistics"
    echo "2. Active connections"
    echo "3. Network usage"
    
    read -p "Select option [1-3]: " option
    
    case $option in
        1)
            echo "Network interface statistics:"
            cat /proc/net/dev | grep -v "lo:" | column -t
            ;;
        2)
            echo "Active network connections:"
            netstat -tuln 2>/dev/null || ss -tuln
            ;;
        3)
            echo "Network usage (5 seconds):"
            if command -v vnstat >/dev/null 2>&1; then
                vnstat -i eth0 -l
            else
                echo "Real-time monitoring requires vnstat or similar tools"
                echo "Current network statistics:"
                cat /proc/net/dev | head -3
            fi
            ;;
        *)
            echo -e "${RED}Invalid option!${NC}"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

intrusion_detection() {
    echo -e "${GREEN}Intrusion Detection${NC}"
    echo "Checking for suspicious network activity..."
    
    echo "1. Unusual network connections:"
    netstat -an | grep ESTABLISHED | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -10
    
    echo
    echo "2. Failed login attempts:"
    grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5 || echo "Log file not accessible"
    
    echo
    echo "3. Listening services:"
    netstat -tlnp 2>/dev/null | grep LISTEN | head -10 || ss -tlnp | grep LISTEN | head -10
    
    echo
    echo "4. Network interface status:"
    ip link show
    
    read -p "Press Enter to continue..."
}

vulnerability_scan() {
    echo -e "${GREEN}Vulnerability Scanner${NC}"
    read -p "Enter target to scan: " target
    
    echo "Basic vulnerability checks for $target:"
    
    echo "1. Open ports check:"
    if command -v nmap >/dev/null 2>&1; then
        nmap -sS $target | grep open
    else
        echo "nmap not available for advanced scanning"
    fi
    
    echo
    echo "2. SSL/TLS check (if HTTPS):"
    if timeout 5 bash -c "echo | openssl s_client -connect $target:443" 2>/dev/null; then
        echo "SSL connection successful"
    else
        echo "No SSL service on port 443"
    fi
    
    echo
    echo "3. HTTP headers check (if web server):"
    if command -v curl >/dev/null 2>&1; then
        curl -I http://$target 2>/dev/null | head -10
    else
        echo "curl not available for HTTP checks"
    fi
    
    read -p "Press Enter to continue..."
}

wireless_scan() {
    echo -e "${GREEN}Wireless Network Scanner${NC}"
    echo "Scanning for wireless networks..."
    
    if command -v iwlist >/dev/null 2>&1; then
        iwlist scan 2>/dev/null | grep -E "ESSID|Quality|Encryption" || echo "No wireless interface found"
    elif command -v nmcli >/dev/null 2>&1; then
        nmcli dev wifi list
    else
        echo "Wireless scanning tools not available"
        echo "Available network interfaces:"
        ip link show
    fi
    
    read -p "Press Enter to continue..."
}

firewall_status() {
    echo -e "${GREEN}Firewall Status Check${NC}"
    
    echo "1. UFW Status:"
    ufw status 2>/dev/null || echo "UFW not installed"
    
    echo
    echo "2. iptables rules:"
    iptables -L 2>/dev/null | head -20 || echo "iptables not accessible"
    
    echo
    echo "3. Active firewall processes:"
    ps aux | grep -E "(ufw|iptables|firewall)" | grep -v grep
    
    read -p "Press Enter to continue..."
}

network_config() {
    echo -e "${GREEN}Network Configuration${NC}"
    
    echo "1. Network interfaces:"
    ip addr show
    
    echo
    echo "2. Routing table:"
    ip route show
    
    echo
    echo "3. DNS configuration:"
    cat /etc/resolv.conf 2>/dev/null || echo "resolv.conf not accessible"
    
    echo
    echo "4. Network statistics:"
    netstat -i 2>/dev/null || ip -s link
    
    read -p "Press Enter to continue..."
}

security_assessment() {
    echo -e "${GREEN}Network Security Assessment${NC}"
    
    echo "Running comprehensive security assessment..."
    
    echo "1. Open listening ports:"
    netstat -tlnp 2>/dev/null | grep LISTEN | wc -l || ss -tlnp | grep LISTEN | wc -l
    
    echo "2. Network connections:"
    netstat -an | grep ESTABLISHED | wc -l
    
    echo "3. Firewall status:"
    if command -v ufw >/dev/null 2>&1; then
        ufw status | grep Status
    else
        echo "UFW not available"
    fi
    
    echo "4. Network services:"
    systemctl list-units --type=service --state=running | grep -E "(ssh|http|ftp|telnet)" | wc -l
    
    echo "5. Security recommendations:"
    echo "- Ensure unnecessary services are disabled"
    echo "- Enable firewall protection"
    echo "- Monitor network traffic regularly"
    echo "- Update system regularly"
    
    read -p "Press Enter to continue..."
}

network_troubleshoot() {
    echo -e "${GREEN}Network Troubleshoot${NC}"
    
    read -p "Enter target host to test connectivity: " target
    
    echo "Running network diagnostics for $target..."
    
    echo "1. Ping test:"
    ping -c 4 $target 2>/dev/null || echo "Ping failed"
    
    echo
    echo "2. Traceroute:"
    if command -v traceroute >/dev/null 2>&1; then
        traceroute $target 2>/dev/null | head -10
    else
        echo "traceroute not available"
    fi
    
    echo
    echo "3. DNS lookup:"
    nslookup $target 2>/dev/null || echo "DNS lookup failed"
    
    echo
    echo "4. Port connectivity test (port 80):"
    if timeout 3 bash -c "echo >/dev/tcp/$target/80" 2>/dev/null; then
        echo "Port 80 is reachable"
    else
        echo "Port 80 is not reachable"
    fi
    
    read -p "Press Enter to continue..."
}

handle_network_choice() {
    case $1 in
        1) port_scanner ;;
        2) network_discovery ;;
        3) service_detection ;;
        4) traffic_monitor ;;
        5) intrusion_detection ;;
        6) vulnerability_scan ;;
        7) wireless_scan ;;
        8) firewall_status ;;
        9) network_config ;;
        10) security_assessment ;;
        11) network_troubleshoot ;;
        0) return 0 ;;
        *) echo -e "${RED}Invalid option!${NC}"; read -p "Press Enter to continue..." ;;
    esac
    return 1
}

# Main network security loop
main_network() {
    while true; do
        display_network_banner
        show_network_menu
        read -r choice
        if ! handle_network_choice "$choice"; then
            break
        fi
    done
}

# Start the network security scanner
main_network
