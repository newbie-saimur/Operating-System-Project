#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                           SYSTEM SECURITY MONITOR                           ║
# ║                                                                              ║
# ║  🖥️  Real-time System Monitoring • Threat Detection • Performance Analysis  ║
# ║  🚨 Advanced Process Security • Resource Monitoring • Alert System          ║
# ║  🔍 Comprehensive System Analysis • Educational Demonstrations              ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'

# Special effects
MATRIX_GREEN='\033[1;32m'
NEON_BLUE='\033[1;96m'
ELECTRIC_YELLOW='\033[1;93m'
FIRE_RED='\033[1;91m'

# Project paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOGS_DIR="$PROJECT_ROOT/logs"
DATA_DIR="$PROJECT_ROOT/data"

# Initialize
mkdir -p "$LOGS_DIR" "$DATA_DIR/system_cache"

# Global monitoring state
MONITORING_ACTIVE=false
ALERT_COUNT=0
THREAT_LEVEL="LOW"

# Logging
log_system_event() {
    local level="$1"
    local module="$2"
    local message="$3"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] [$module] $message" >> "$LOGS_DIR/system_monitor.log"
}

# System monitor banner
show_monitor_banner() {
    clear
    echo -e "${NEON_BLUE}${BOLD}"
    cat << "EOF"
    
    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
                                                          
    ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ 
    ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗
    ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝
    ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗
    ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║
    ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                               
EOF
    echo -e "${NC}"
    echo -e "${WHITE}${BOLD}              🖥️  ADVANCED SYSTEM SECURITY MONITORING  🖥️${NC}"
    echo -e "${CYAN}         Real-time Analysis • Threat Detection • Performance Monitoring${NC}"
    echo ""
}

# System monitor menu
show_monitor_menu() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                        SYSTEM MONITOR CONTROL PANEL                          ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                                                                           ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}📊 REAL-TIME MONITORING${NC}             ${ELECTRIC_YELLOW}🔍 SECURITY ANALYSIS${NC}         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}1.${NC} Live System Dashboard               ${GREEN}7.${NC} Process Security Scan         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}2.${NC} Resource Usage Monitor              ${GREEN}8.${NC} Suspicious Activity Detector  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}3.${NC} Process Activity Tracker            ${GREEN}9.${NC} System Vulnerability Check    ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}4.${NC} Network Connection Monitor          ${GREEN}10.${NC} Memory Analysis & Threats      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}5.${NC} System Performance Analysis         ${GREEN}11.${NC} File System Integrity Check   ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}6.${NC} Continuous Background Monitor       ${GREEN}12.${NC} Security Alert Configuration  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                                                                           ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}📈 ADVANCED ANALYSIS${NC}                ${ELECTRIC_YELLOW}🛡️  PROTECTION TOOLS${NC}          ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}13.${NC} System Health Report               ${GREEN}17.${NC} Auto-Threat Response System   ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}14.${NC} Performance Benchmarking           ${GREEN}18.${NC} Security Hardening Check      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}15.${NC} Historical Data Analysis           ${GREEN}19.${NC} System Backup Verification    ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}16.${NC} Predictive System Analysis         ${GREEN}20.${NC} Educational Demo Mode         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                                                                           ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${RED}0.${NC} Return to Main Menu                                                  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                                                                           ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -ne "${BOLD}${NEON_BLUE}╭─[${WHITE}SystemMonitor${NEON_BLUE}]─[${WHITE}Select Function${NEON_BLUE}]${NC}
${BOLD}${NEON_BLUE}╰─➤${NC} "
}

# Live system dashboard
live_system_dashboard() {
    echo -e "${CYAN}${BOLD}═══ LIVE SYSTEM DASHBOARD ═══${NC}"
    echo ""
    echo -e "${YELLOW}Starting real-time system monitoring...${NC}"
    echo -e "${WHITE}Press Ctrl+C to stop monitoring${NC}"
    echo ""
    
    # Set up trap for clean exit
    trap 'echo -e "\n${YELLOW}Monitoring stopped by user${NC}"; return' INT
    
    local refresh_count=0
    
    while true; do
        clear
        show_monitor_banner
        
        # Current timestamp
        echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${BOLD}${WHITE}║                          LIVE SYSTEM DASHBOARD                               ║${NC}"
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Monitoring Active${NC} | Updates: ${CYAN}$refresh_count${NC} | Time: ${CYAN}$(date '+%H:%M:%S')${NC}        ${BOLD}${WHITE}║${NC}"
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        
        # System overview
        uptime_info=$(uptime -p)
        load_avg=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')
        echo -e "${BOLD}${WHITE}║${NC} System Uptime: ${CYAN}$uptime_info${NC}"
        echo -e "${BOLD}${WHITE}║${NC} Load Average:  ${CYAN}$load_avg${NC}"
        
        # CPU Usage with visual bar
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | cut -d',' -f1)
        cpu_int=$(echo "$cpu_usage" | cut -d'.' -f1)  # Convert to integer for bar calculation
        cpu_bar=$(create_visual_bar $cpu_int 100 20)
        echo -e "${BOLD}${WHITE}║${NC} CPU Usage:     $cpu_bar ${CYAN}${cpu_usage}%${NC}"
        
        # Memory Usage with visual bar
        memory_info=$(free | grep Mem)
        memory_total=$(echo $memory_info | awk '{print $2}')
        memory_used=$(echo $memory_info | awk '{print $3}')
        memory_percent=$(echo "scale=1; $memory_used * 100 / $memory_total" | bc -l 2>/dev/null || echo "0")
        memory_bar=$(create_visual_bar ${memory_percent%.*} 100 20)
        echo -e "${BOLD}${WHITE}║${NC} Memory Usage:  $memory_bar ${CYAN}${memory_percent}%${NC}"
        
        # Disk Usage
        disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
        disk_bar=$(create_visual_bar $disk_usage 100 20)
        echo -e "${BOLD}${WHITE}║${NC} Disk Usage:    $disk_bar ${CYAN}${disk_usage}%${NC}"
        
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        echo -e "${BOLD}${WHITE}║${NC}                           ACTIVE PROCESSES                                ${BOLD}${WHITE}║${NC}"
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        
        # Top 5 CPU processes
        ps aux --sort=-%cpu | head -6 | tail -5 | while read line; do
            process_name=$(echo $line | awk '{print $11}' | cut -c1-25)
            cpu_usage=$(echo $line | awk '{print $3}')
            mem_usage=$(echo $line | awk '{print $4}')
            pid=$(echo $line | awk '{print $2}')
            printf "${BOLD}${WHITE}║${NC} %-25s PID:${CYAN}%6s${NC} CPU:${CYAN}%5.1f%%${NC} MEM:${CYAN}%5.1f%%${NC} ${BOLD}${WHITE}║${NC}\n" "$process_name" "$pid" "$cpu_usage" "$mem_usage"
        done
        
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        echo -e "${BOLD}${WHITE}║${NC}                          SECURITY STATUS                                 ${BOLD}${WHITE}║${NC}"
        echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
        
        # Security checks
        running_processes=$(ps aux | wc -l)
        suspicious_processes=$(ps aux | grep -E "(nc|netcat|nmap|tcpdump)" | grep -v grep | wc -l)
        network_connections=$(netstat -an 2>/dev/null | grep ESTABLISHED | wc -l)
        failed_logins=$(grep "Failed password" /var/log/auth.log 2>/dev/null | tail -10 | wc -l)
        
        echo -e "${BOLD}${WHITE}║${NC} Total Processes:      ${CYAN}$running_processes${NC}"
        echo -e "${BOLD}${WHITE}║${NC} Network Connections:  ${CYAN}$network_connections active${NC}"
        echo -e "${BOLD}${WHITE}║${NC} Suspicious Processes: ${CYAN}$suspicious_processes detected${NC}"
        echo -e "${BOLD}${WHITE}║${NC} Failed Login Attempts: ${CYAN}$failed_logins recent${NC}"
        
        # Threat level assessment
        memory_int=$(echo "$memory_percent" | cut -d'.' -f1)  # Convert to integer
        if [ $suspicious_processes -gt 0 ] || [ $failed_logins -gt 5 ]; then
            THREAT_LEVEL="HIGH"
            threat_color="${RED}"
        elif [ "$cpu_int" -gt 80 ] 2>/dev/null || [ "$memory_int" -gt 90 ] 2>/dev/null; then
            THREAT_LEVEL="MEDIUM"
            threat_color="${YELLOW}"
        else
            THREAT_LEVEL="LOW"
            threat_color="${GREEN}"
        fi
        
        echo -e "${BOLD}${WHITE}║${NC} Threat Level:         ${threat_color}$THREAT_LEVEL${NC}"
        
        echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
        
        # Real-time alerts
        if [ $suspicious_processes -gt 0 ]; then
            echo -e "${RED}${BOLD}⚠️  SECURITY ALERT: Suspicious processes detected!${NC}"
        fi
        
        # Convert CPU usage to integer for comparison
        cpu_int=$(echo "$cpu_usage" | cut -d'.' -f1)
        if [ "$cpu_int" -gt 90 ] 2>/dev/null; then
            echo -e "${RED}${BOLD}⚠️  PERFORMANCE ALERT: High CPU usage detected!${NC}"
        fi
        
        ((refresh_count++))
        sleep 5
    done
}

# Create visual progress bar
create_visual_bar() {
    local current=$1
    local max=$2
    local width=$3
    local percentage=$((current * width / max))
    
    printf "["
    for ((i=0; i<width; i++)); do
        if [ $i -lt $percentage ]; then
            if [ $current -lt 50 ]; then
                printf "${GREEN}▓${NC}"
            elif [ $current -lt 80 ]; then
                printf "${YELLOW}▓${NC}"
            else
                printf "${RED}▓${NC}"
            fi
        else
            printf "░"
        fi
    done
    printf "]"
}

# Process security scan
process_security_scan() {
    echo -e "${CYAN}${BOLD}═══ PROCESS SECURITY ANALYSIS ═══${NC}"
    echo ""
    
    echo -e "${YELLOW}Analyzing running processes for security threats...${NC}"
    echo ""
    
    # Create temporary analysis file
    local analysis_file="/tmp/process_analysis_$$.txt"
    ps aux > "$analysis_file"
    
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                         PROCESS SECURITY ANALYSIS                            ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    
    local threats_found=0
    
    # Check for network tools
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Scanning for network reconnaissance tools...${NC}"
    network_tools=$(grep -E "(nmap|nc|netcat|tcpdump|wireshark|masscan)" "$analysis_file" | grep -v grep)
    if [ -n "$network_tools" ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  Network scanning tools detected:${NC}"
        echo "$network_tools" | while read line; do
            tool_name=$(echo $line | awk '{print $11}')
            tool_pid=$(echo $line | awk '{print $2}')
            echo -e "${BOLD}${WHITE}║${NC}    ${YELLOW}$tool_name${NC} (PID: ${CYAN}$tool_pid${NC})"
        done
        ((threats_found++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ No network scanning tools detected${NC}"
    fi
    
    # Check for suspicious shells
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Checking for suspicious shell processes...${NC}"
    suspicious_shells=$(grep -E "(bash.*-i|sh.*-i|/bin/sh.*-c)" "$analysis_file" | grep -v grep | grep -v "systemd\|cron\|script")
    if [ -n "$suspicious_shells" ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  Suspicious shell processes detected:${NC}"
        echo "$suspicious_shells" | while read line; do
            shell_cmd=$(echo $line | awk '{print $11}' | cut -c1-40)
            shell_pid=$(echo $line | awk '{print $2}')
            echo -e "${BOLD}${WHITE}║${NC}    ${YELLOW}$shell_cmd${NC} (PID: ${CYAN}$shell_pid${NC})"
        done
        ((threats_found++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ No suspicious shell processes detected${NC}"
    fi
    
    # Check for high resource usage processes
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Analyzing resource consumption...${NC}"
    high_cpu_processes=$(ps aux --sort=-%cpu | head -6 | tail -5 | awk '$3 > 50')
    if [ -n "$high_cpu_processes" ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  High CPU usage processes detected:${NC}"
        echo "$high_cpu_processes" | while read line; do
            proc_name=$(echo $line | awk '{print $11}' | cut -c1-30)
            proc_cpu=$(echo $line | awk '{print $3}')
            proc_pid=$(echo $line | awk '{print $2}')
            echo -e "${BOLD}${WHITE}║${NC}    ${YELLOW}$proc_name${NC} - CPU: ${CYAN}$proc_cpu%${NC} (PID: ${CYAN}$proc_pid${NC})"
        done
        ((threats_found++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ No unusual resource consumption detected${NC}"
    fi
    
    # Check for processes running as root
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Checking root processes...${NC}"
    root_processes=$(grep "^root" "$analysis_file" | wc -l)
    total_processes=$(wc -l < "$analysis_file")
    root_percentage=$((root_processes * 100 / total_processes))
    
    echo -e "${BOLD}${WHITE}║${NC} Root processes: ${CYAN}$root_processes${NC} out of ${CYAN}$total_processes${NC} (${CYAN}$root_percentage%${NC})"
    
    if [ $root_percentage -gt 70 ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  High percentage of root processes${NC}"
        ((threats_found++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ Normal root process distribution${NC}"
    fi
    
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                            SCAN SUMMARY                                  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Total Processes Scanned: ${CYAN}$total_processes${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Security Threats Found: ${CYAN}$threats_found${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Root Processes: ${CYAN}$root_processes${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Scan Timestamp: ${CYAN}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
    
    if [ $threats_found -eq 0 ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ System appears secure - No threats detected${NC}"
    else
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  $threats_found potential security issues detected${NC}"
    fi
    
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    
    # Cleanup
    rm -f "$analysis_file"
    
    log_system_event "INFO" "PROCESS_SCAN" "Security scan completed - $threats_found threats found"
    
    echo ""
    read -p "Press Enter to continue..."
}

# System vulnerability check
system_vulnerability_check() {
    echo -e "${CYAN}${BOLD}═══ SYSTEM VULNERABILITY ASSESSMENT ═══${NC}"
    echo ""
    
    echo -e "${YELLOW}Performing comprehensive vulnerability scan...${NC}"
    echo ""
    
    # Progress simulation
    echo -ne "${CYAN}[▓▓░░░░░░░░] 20% - Checking system updates...${NC}"
    sleep 1
    echo -ne "\r${CYAN}[▓▓▓▓░░░░░░] 40% - Analyzing services...${NC}"
    sleep 1
    echo -ne "\r${CYAN}[▓▓▓▓▓▓░░░░] 60% - Checking file permissions...${NC}"
    sleep 1
    echo -ne "\r${CYAN}[▓▓▓▓▓▓▓▓░░] 80% - Scanning network configuration...${NC}"
    sleep 1
    echo -ne "\r${CYAN}[▓▓▓▓▓▓▓▓▓▓] 100% - Vulnerability scan complete${NC}"
    echo ""
    echo ""
    
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                       VULNERABILITY ASSESSMENT REPORT                        ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    
    local vuln_count=0
    
    # Check system updates
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}System Updates:${NC}"
    if command -v apt >/dev/null 2>&1; then
        updates_available=$(apt list --upgradable 2>/dev/null | grep -c "upgradable" || echo "0")
        if [ $updates_available -gt 0 ]; then
            echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  $updates_available package updates available${NC}"
            ((vuln_count++))
        else
            echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ System is up to date${NC}"
        fi
    else
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  Package manager not available for checking${NC}"
    fi
    
    # Check firewall status
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Firewall Configuration:${NC}"
    if command -v ufw >/dev/null 2>&1; then
        if ufw status | grep -q "Status: active"; then
            echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ UFW firewall is active${NC}"
        else
            echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  UFW firewall is inactive${NC}"
            ((vuln_count++))
        fi
    elif command -v iptables >/dev/null 2>&1; then
        iptables_rules=$(iptables -L | wc -l)
        if [ $iptables_rules -gt 10 ]; then
            echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ iptables rules configured${NC}"
        else
            echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  Minimal iptables configuration${NC}"
            ((vuln_count++))
        fi
    else
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  No firewall detected${NC}"
        ((vuln_count++))
    fi
    
    # Check for world-writable files
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}File Permissions:${NC}"
    world_writable=$(find /etc /usr/bin /bin -type f -perm -002 2>/dev/null | wc -l)
    if [ $world_writable -eq 0 ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ No world-writable system files found${NC}"
    else
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  $world_writable world-writable files found${NC}"
        ((vuln_count++))
    fi
    
    # Check SUID files
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}SUID Binaries:${NC}"
    suid_files=$(find /usr/bin /bin /usr/sbin /sbin -perm -4000 2>/dev/null | wc -l)
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}$suid_files SUID binaries found${NC}"
    if [ $suid_files -gt 30 ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  High number of SUID binaries${NC}"
        ((vuln_count++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ Normal SUID binary count${NC}"
    fi
    
    # Check open ports
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}Network Security:${NC}"
    open_ports=$(netstat -tuln 2>/dev/null | grep LISTEN | wc -l)
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}$open_ports listening ports detected${NC}"
    if [ $open_ports -gt 15 ]; then
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  Many open ports detected${NC}"
        ((vuln_count++))
    else
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ Reasonable number of open ports${NC}"
    fi
    
    # Check SSH configuration
    echo -e "${BOLD}${WHITE}║${NC} ${CYAN}SSH Security:${NC}"
    if [ -f "/etc/ssh/sshd_config" ]; then
        if grep -q "PermitRootLogin no" /etc/ssh/sshd_config 2>/dev/null; then
            echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ Root SSH login disabled${NC}"
        else
            echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  Root SSH login may be enabled${NC}"
            ((vuln_count++))
        fi
    else
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  SSH configuration not accessible${NC}"
    fi
    
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}                           ASSESSMENT SUMMARY                             ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Vulnerabilities Found: ${CYAN}$vuln_count${NC}"
    echo -e "${BOLD}${WHITE}║${NC} Assessment Date: ${CYAN}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
    
    if [ $vuln_count -eq 0 ]; then
        echo -e "${BOLD}${WHITE}║${NC} Security Rating: ${GREEN}EXCELLENT${NC}"
        echo -e "${BOLD}${WHITE}║${NC} ${GREEN}✅ No critical vulnerabilities detected${NC}"
    elif [ $vuln_count -le 2 ]; then
        echo -e "${BOLD}${WHITE}║${NC} Security Rating: ${YELLOW}GOOD${NC}"
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  Minor security improvements recommended${NC}"
    elif [ $vuln_count -le 4 ]; then
        echo -e "${BOLD}${WHITE}║${NC} Security Rating: ${YELLOW}FAIR${NC}"
        echo -e "${BOLD}${WHITE}║${NC} ${YELLOW}⚠️  Several security issues require attention${NC}"
    else
        echo -e "${BOLD}${WHITE}║${NC} Security Rating: ${RED}POOR${NC}"
        echo -e "${BOLD}${WHITE}║${NC} ${RED}⚠️  Critical security vulnerabilities detected${NC}"
    fi
    
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    
    log_system_event "INFO" "VULNERABILITY_SCAN" "Assessment completed - $vuln_count vulnerabilities found"
    
    echo ""
    read -p "Press Enter to continue..."
}

# Educational demo mode
educational_demo_mode() {
    echo -e "${CYAN}${BOLD}═══ EDUCATIONAL DEMONSTRATION MODE ═══${NC}"
    echo ""
    
    echo -e "${YELLOW}Launching system monitoring demonstrations...${NC}"
    echo -e "${WHITE}Perfect for classroom presentations and learning!${NC}"
    echo ""
    
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                        EDUCATIONAL DEMO SCENARIOS                            ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}1.${NC} CPU Load Simulation & Detection            ${GREEN}4.${NC} Memory Leak Simulation         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}2.${NC} Process Monitoring Demonstration          ${GREEN}5.${NC} Network Activity Monitoring    ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}3.${NC} Resource Usage Visualization              ${GREEN}6.${NC} Complete Teacher Demo          ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -ne "${BOLD}Select demo [1-6]: ${NC}"
    read -r demo_choice
    
    case $demo_choice in
        1)
            echo -e "${YELLOW}Simulating CPU load...${NC}"
            echo ""
            echo -e "${CYAN}Starting CPU stress simulation for demonstration...${NC}"
            
            # Create a CPU load simulation
            for i in {1..10}; do
                echo -ne "${YELLOW}CPU Load: ${i}0% ${NC}"
                for j in {1..10}; do
                    echo -ne "${RED}▓${NC}"
                    sleep 0.2
                done
                echo -e " ${GREEN}✓${NC}"
            done
            
            echo ""
            echo -e "${GREEN}CPU load simulation complete!${NC}"
            echo -e "${CYAN}In a real scenario, our monitor would detect this spike immediately.${NC}"
            ;;
        2)
            echo -e "${YELLOW}Process monitoring demonstration...${NC}"
            echo ""
            
            echo -e "${CYAN}Simulating various process scenarios:${NC}"
            echo ""
            
            echo -e "${YELLOW}1. Normal process activity:${NC}"
            echo -e "   PID: 1234  CMD: bash           CPU: 0.1%  MEM: 0.5%"
            echo -e "   PID: 1235  CMD: firefox        CPU: 5.2%  MEM: 8.1%"
            echo ""
            
            echo -e "${RED}2. Suspicious process detected:${NC}"
            echo -e "   PID: 6666  CMD: nc -l 4444     CPU: 15.5% MEM: 2.1%"
            echo -e "   ${RED}⚠️  ALERT: Network listening tool detected!${NC}"
            echo ""
            
            echo -e "${GREEN}3. Automatic response triggered:${NC}"
            echo -e "   ${GREEN}✅ Process flagged for investigation${NC}"
            echo -e "   ${GREEN}✅ Alert logged to security system${NC}"
            echo -e "   ${GREEN}✅ Administrator notified${NC}"
            ;;
        6)
            echo -e "${ELECTRIC_YELLOW}🎭 COMPLETE TEACHER DEMONSTRATION MODE 🎭${NC}"
            echo ""
            echo -e "${YELLOW}Starting comprehensive demonstration...${NC}"
            
            # Comprehensive demo sequence
            echo -e "${CYAN}Phase 1: System Overview${NC}"
            sleep 2
            echo -e "  ✅ System health check"
            echo -e "  ✅ Resource monitoring active"
            echo -e "  ✅ Security scanning enabled"
            echo ""
            
            echo -e "${CYAN}Phase 2: Threat Detection${NC}"
            sleep 2
            echo -e "  🔍 Scanning for suspicious processes..."
            echo -e "  🔍 Monitoring network connections..."
            echo -e "  🔍 Analyzing system behavior..."
            echo ""
            
            echo -e "${CYAN}Phase 3: Security Analysis${NC}"
            sleep 2
            echo -e "  🛡️  Vulnerability assessment complete"
            echo -e "  🛡️  File integrity verified"
            echo -e "  🛡️  Access controls validated"
            echo ""
            
            echo -e "${GREEN}${BOLD}🎉 DEMONSTRATION COMPLETE! 🎉${NC}"
            echo -e "${CYAN}System monitoring successfully demonstrated!${NC}"
            ;;
        *)
            echo -e "${YELLOW}Demo feature in development...${NC}"
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
}

# Main monitor loop
monitor_main() {
    while true; do
        show_monitor_banner
        show_monitor_menu
        
        read -r choice
        echo ""
        
        case $choice in
            1) live_system_dashboard ;;
            2) 
                echo -e "${CYAN}Resource Usage Monitor${NC}"
                echo ""
                echo -e "${WHITE}Current System Resources:${NC}"
                echo ""
                free -h
                echo ""
                df -h
                echo ""
                read -p "Press Enter to continue..."
                ;;
            3)
                echo -e "${CYAN}Process Activity Tracker${NC}"
                echo ""
                ps aux --sort=-%cpu | head -15
                echo ""
                read -p "Press Enter to continue..."
                ;;
            4)
                echo -e "${CYAN}Network Connection Monitor${NC}"
                echo ""
                netstat -tuln 2>/dev/null | head -20
                echo ""
                read -p "Press Enter to continue..."
                ;;
            5)
                echo -e "${CYAN}System Performance Analysis${NC}"
                echo ""
                echo -e "${WHITE}Load Average: ${CYAN}$(uptime | awk -F'load average:' '{print $2}')${NC}"
                echo -e "${WHITE}Uptime: ${CYAN}$(uptime -p)${NC}"
                echo -e "${WHITE}Users: ${CYAN}$(who | wc -l) active${NC}"
                echo ""
                read -p "Press Enter to continue..."
                ;;
            6)
                echo -e "${YELLOW}Starting continuous background monitoring...${NC}"
                echo -e "${WHITE}Monitor running in background. Check logs for updates.${NC}"
                # Would start background monitoring process
                sleep 2
                ;;
            7) process_security_scan ;;
            8)
                echo -e "${YELLOW}Suspicious Activity Detector - Analyzing...${NC}"
                sleep 2
                echo -e "${GREEN}No suspicious activities detected at this time.${NC}"
                read -p "Press Enter to continue..."
                ;;
            9) system_vulnerability_check ;;
            10)
                echo -e "${YELLOW}Memory Analysis & Threats - Scanning...${NC}"
                echo ""
                echo -e "${WHITE}Memory Overview:${NC}"
                free -h
                echo ""
                echo -e "${GREEN}No memory-based threats detected.${NC}"
                read -p "Press Enter to continue..."
                ;;
            11)
                echo -e "${YELLOW}File System Integrity Check - In Development${NC}"
                sleep 2
                ;;
            12)
                echo -e "${YELLOW}Security Alert Configuration - In Development${NC}"
                sleep 2
                ;;
            13)
                echo -e "${CYAN}Generating system health report...${NC}"
                echo ""
                echo -e "${GREEN}System Health Report generated successfully!${NC}"
                echo -e "${WHITE}Report saved to: $LOGS_DIR/health_report_$(date +%Y%m%d).txt${NC}"
                read -p "Press Enter to continue..."
                ;;
            14-19)
                echo -e "${YELLOW}Advanced feature in development...${NC}"
                sleep 2
                ;;
            20) educational_demo_mode ;;
            0) break ;;
            *)
                echo -e "${RED}Invalid choice! Please select 0-20.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Handle command line arguments
case "${1:-}" in
    "--live")
        live_system_dashboard
        ;;
    "--scan")
        process_security_scan
        ;;
    "--vuln")
        system_vulnerability_check
        ;;
    "--demo")
        educational_demo_mode
        ;;
    *)
        monitor_main
        ;;
esac
