#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                        LOG ANALYSIS & FORENSICS                             ║
# ║                                                                              ║
# ║  📊 System Log Analysis • Security Event Detection • Forensic Investigation ║
# ║  🔍 Attack Pattern Recognition • Threat Intelligence • Incident Response    ║
# ║  🛡️ Log Monitoring • Audit Trail Analysis • Educational Demonstrations     ║
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

# Log analyzer banner
show_log_banner() {
    clear
    echo -e "${MATRIX_GREEN}"
    echo "    ██╗      ██████╗  ██████╗     ███████╗ ██████╗ ██████╗ ███████╗███╗   ██╗███████╗██╗ ██████╗███████╗"
    echo "    ██║     ██╔═══██╗██╔════╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝██║██╔════╝██╔════╝"
    echo "    ██║     ██║   ██║██║  ███╗    █████╗  ██║   ██║██████╔╝█████╗  ██╔██╗ ██║███████╗██║██║     ███████╗"
    echo "    ██║     ██║   ██║██║   ██║    ██╔══╝  ██║   ██║██╔══██╗██╔══╝  ██║╚██╗██║╚════██║██║██║     ╚════██║"
    echo "    ███████╗╚██████╔╝╚██████╔╝    ██║     ╚██████╔╝██║  ██║███████╗██║ ╚████║███████║██║╚██████╗███████║"
    echo "    ╚══════╝ ╚═════╝  ╚═════╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝╚══════╝"
    echo -e "${NC}"
    echo
    echo -e "${NEON_BLUE}                🔍 ADVANCED LOG ANALYSIS & DIGITAL FORENSICS 🔍${NC}"
    echo -e "${ELECTRIC_YELLOW}         Security Event Detection • Incident Response • Threat Analysis${NC}"
    echo
}

# Log analyzer menu
show_log_menu() {
    echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║                          LOG FORENSICS CONTROL PANEL                         ║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${ELECTRIC_YELLOW}🔍 LOG ANALYSIS${NC}                     ${ELECTRIC_YELLOW}🛡️ SECURITY FORENSICS${NC}           ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}1.${NC} System Log Overview              ${GREEN}8.${NC} Failed Login Analysis         ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}2.${NC} Authentication Log Analysis     ${GREEN}9.${NC} Intrusion Attempt Detection  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}3.${NC} Apache/Nginx Access Logs        ${GREEN}10.${NC} Security Event Timeline      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}4.${NC} System Error Analysis           ${GREEN}11.${NC} Network Attack Patterns      ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}5.${NC} Kernel Log Investigation        ${GREEN}12.${NC} Suspicious Process Analysis  ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}6.${NC} Application Log Scanner         ${GREEN}13.${NC} File System Audit            ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${GREEN}7.${NC} Real-time Log Monitor           ${GREEN}14.${NC} Generate Forensic Report     ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${WHITE}║${NC}  ${RED}0.${NC} Return to Main Menu                                                     ${BOLD}${WHITE}║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -ne "${BOLD}${NEON_BLUE}╭─[${WHITE}LogForensics${NEON_BLUE}]─[${WHITE}Select Analysis${NEON_BLUE}]${NC}\n${BOLD}${NEON_BLUE}╰─► ${NC}"
}

# System log overview
system_log_overview() {
    echo -e "${CYAN}${BOLD}📊 SYSTEM LOG OVERVIEW${NC}"
    echo "=============================================="
    echo
    
    echo -e "${BOLD}Log File Summary:${NC}"
    
    # Check main log files
    log_files=(
        "/var/log/syslog:System Log"
        "/var/log/auth.log:Authentication Log"
        "/var/log/kern.log:Kernel Log"
        "/var/log/dmesg:Boot Messages"
        "/var/log/messages:System Messages"
        "/var/log/secure:Security Log"
    )
    
    for log_info in "${log_files[@]}"; do
        log_file=$(echo $log_info | cut -d: -f1)
        log_name=$(echo $log_info | cut -d: -f2)
        
        if [ -f "$log_file" ]; then
            size=$(du -h "$log_file" 2>/dev/null | cut -f1)
            lines=$(wc -l < "$log_file" 2>/dev/null)
            echo -e "${GREEN}✅ $log_name: ${WHITE}$size ($lines lines)${NC}"
        else
            echo -e "${RED}❌ $log_name: Not found${NC}"
        fi
    done
    echo
    
    echo -e "${BOLD}Recent System Activity (Last 10 entries):${NC}"
    if [ -f /var/log/syslog ]; then
        tail -10 /var/log/syslog | while read line; do
            echo -e "${CYAN}$line${NC}"
        done
    elif [ -f /var/log/messages ]; then
        tail -10 /var/log/messages | while read line; do
            echo -e "${CYAN}$line${NC}"
        done
    else
        echo -e "${YELLOW}No accessible system logs found${NC}"
    fi
    echo
}

# Authentication log analysis
auth_log_analysis() {
    echo -e "${CYAN}${BOLD}🔐 AUTHENTICATION LOG ANALYSIS${NC}"
    echo "=============================================="
    echo
    
    auth_logs=("/var/log/auth.log" "/var/log/secure" "/var/log/authlog")
    auth_log=""
    
    for log in "${auth_logs[@]}"; do
        if [ -f "$log" ]; then
            auth_log="$log"
            break
        fi
    done
    
    if [ -z "$auth_log" ]; then
        echo -e "${RED}No authentication logs found${NC}"
        return
    fi
    
    echo -e "${BOLD}Authentication Summary:${NC}"
    
    # Successful logins
    successful=$(grep -c "session opened" "$auth_log" 2>/dev/null || echo "0")
    echo -e "${GREEN}Successful logins: $successful${NC}"
    
    # Failed logins
    failed=$(grep -c "authentication failure\|Failed password" "$auth_log" 2>/dev/null || echo "0")
    echo -e "${RED}Failed login attempts: $failed${NC}"
    
    # Root access attempts
    root_attempts=$(grep -c "root" "$auth_log" 2>/dev/null || echo "0")
    echo -e "${YELLOW}Root access attempts: $root_attempts${NC}"
    echo
    
    echo -e "${BOLD}Recent Authentication Events:${NC}"
    grep -E "(session opened|authentication failure|Failed password)" "$auth_log" 2>/dev/null | tail -10 | while read line; do
        echo -e "${CYAN}$line${NC}"
    done
    echo
    
    echo -e "${BOLD}Top Login Sources:${NC}"
    grep "session opened" "$auth_log" 2>/dev/null | awk '{print $NF}' | sort | uniq -c | sort -rn | head -5 | while read count ip; do
        echo -e "${GREEN}$ip: $count logins${NC}"
    done
    echo
}

# Web server log analysis
web_log_analysis() {
    echo -e "${CYAN}${BOLD}🌐 WEB SERVER LOG ANALYSIS${NC}"
    echo "=============================================="
    echo
    
    # Check for common web server logs
    web_logs=(
        "/var/log/apache2/access.log"
        "/var/log/nginx/access.log"
        "/var/log/httpd/access_log"
        "/var/log/apache/access.log"
    )
    
    web_log=""
    for log in "${web_logs[@]}"; do
        if [ -f "$log" ]; then
            web_log="$log"
            break
        fi
    done
    
    if [ -z "$web_log" ]; then
        echo -e "${YELLOW}No web server logs found${NC}"
        echo -e "${GREEN}Generating sample web log analysis...${NC}"
        echo
        
        echo -e "${BOLD}Sample HTTP Status Codes:${NC}"
        echo -e "${GREEN}200 OK: 1,234 requests${NC}"
        echo -e "${YELLOW}404 Not Found: 89 requests${NC}"
        echo -e "${RED}500 Internal Error: 12 requests${NC}"
        echo -e "${RED}403 Forbidden: 5 requests${NC}"
        echo
        
        echo -e "${BOLD}Sample Top Requested URLs:${NC}"
        echo -e "${CYAN}/index.html - 456 requests${NC}"
        echo -e "${CYAN}/api/data - 234 requests${NC}"
        echo -e "${CYAN}/login - 123 requests${NC}"
        echo -e "${CYAN}/admin - 45 requests${NC}"
        return
    fi
    
    echo -e "${BOLD}Web Server Log: $web_log${NC}"
    echo
    
    # HTTP status code analysis
    echo -e "${BOLD}HTTP Status Code Summary:${NC}"
    awk '{print $9}' "$web_log" 2>/dev/null | sort | uniq -c | sort -rn | head -10 | while read count code; do
        case $code in
            200) echo -e "${GREEN}$code: $count requests${NC}" ;;
            404) echo -e "${YELLOW}$code: $count requests${NC}" ;;
            50*) echo -e "${RED}$code: $count requests${NC}" ;;
            40*) echo -e "${PURPLE}$code: $count requests${NC}" ;;
            *) echo -e "${CYAN}$code: $count requests${NC}" ;;
        esac
    done
    echo
    
    # Top IPs
    echo -e "${BOLD}Top Client IPs:${NC}"
    awk '{print $1}' "$web_log" 2>/dev/null | sort | uniq -c | sort -rn | head -5 | while read count ip; do
        echo -e "${GREEN}$ip: $count requests${NC}"
    done
    echo
    
    # Recent requests
    echo -e "${BOLD}Recent Requests (Last 5):${NC}"
    tail -5 "$web_log" 2>/dev/null | while read line; do
        echo -e "${CYAN}$line${NC}"
    done
    echo
}

# System error analysis
error_analysis() {
    echo -e "${CYAN}${BOLD}❌ SYSTEM ERROR ANALYSIS${NC}"
    echo "=============================================="
    echo
    
    # Check various error sources
    echo -e "${BOLD}System Error Summary:${NC}"
    
    # Kernel errors
    if [ -f /var/log/kern.log ]; then
        kernel_errors=$(grep -i "error\|panic\|oops" /var/log/kern.log 2>/dev/null | wc -l)
        echo -e "${RED}Kernel errors: $kernel_errors${NC}"
    fi
    
    # System errors
    if [ -f /var/log/syslog ]; then
        sys_errors=$(grep -i "error\|failed\|critical" /var/log/syslog 2>/dev/null | wc -l)
        echo -e "${RED}System errors: $sys_errors${NC}"
    fi
    
    # Daemon errors
    daemon_errors=$(journalctl --since="1 hour ago" --priority=err 2>/dev/null | wc -l || echo "0")
    echo -e "${RED}Daemon errors (last hour): $daemon_errors${NC}"
    echo
    
    echo -e "${BOLD}Recent Critical Events:${NC}"
    if command -v journalctl >/dev/null; then
        journalctl --since="24 hours ago" --priority=crit 2>/dev/null | tail -5 | while read line; do
            echo -e "${RED}$line${NC}"
        done
    else
        if [ -f /var/log/syslog ]; then
            grep -i "critical\|panic\|fatal" /var/log/syslog | tail -5 | while read line; do
                echo -e "${RED}$line${NC}"
            done
        fi
    fi
    echo
}

# Failed login analysis
failed_login_analysis() {
    echo -e "${CYAN}${BOLD}🔒 FAILED LOGIN ANALYSIS${NC}"
    echo "=============================================="
    echo
    
    auth_logs=("/var/log/auth.log" "/var/log/secure")
    auth_log=""
    
    for log in "${auth_logs[@]}"; do
        if [ -f "$log" ]; then
            auth_log="$log"
            break
        fi
    done
    
    if [ -z "$auth_log" ]; then
        echo -e "${RED}No authentication logs found${NC}"
        return
    fi
    
    echo -e "${BOLD}Failed Login Attack Analysis:${NC}"
    
    # Count failed attempts
    failed_attempts=$(grep -c "Failed password\|authentication failure" "$auth_log" 2>/dev/null)
    echo -e "${RED}Total failed attempts: $failed_attempts${NC}"
    
    # Brute force detection (multiple attempts from same IP)
    echo -e "${BOLD}Potential Brute Force Sources:${NC}"
    grep "Failed password" "$auth_log" 2>/dev/null | awk '{
        for(i=1;i<=NF;i++) {
            if($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) {
                print $i
            }
        }
    }' | sort | uniq -c | sort -rn | head -5 | while read count ip; do
        if [ "$count" -gt 5 ]; then
            echo -e "${RED}⚠️  $ip: $count attempts (SUSPICIOUS)${NC}"
        else
            echo -e "${YELLOW}$ip: $count attempts${NC}"
        fi
    done
    echo
    
    # Recent failed attempts
    echo -e "${BOLD}Recent Failed Login Attempts:${NC}"
    grep "Failed password" "$auth_log" 2>/dev/null | tail -5 | while read line; do
        echo -e "${RED}$line${NC}"
    done
    echo
}

# Real-time log monitor
realtime_monitor() {
    echo -e "${CYAN}${BOLD}📺 REAL-TIME LOG MONITOR${NC}"
    echo "=============================================="
    echo
    
    echo -e "${YELLOW}Monitoring system logs in real-time...${NC}"
    echo -e "${WHITE}Press Ctrl+C to stop monitoring${NC}"
    echo
    
    # Monitor multiple log files
    if [ -f /var/log/syslog ]; then
        echo -e "${GREEN}Monitoring /var/log/syslog...${NC}"
        tail -f /var/log/syslog 2>/dev/null &
        monitor_pid=$!
    elif [ -f /var/log/messages ]; then
        echo -e "${GREEN}Monitoring /var/log/messages...${NC}"
        tail -f /var/log/messages 2>/dev/null &
        monitor_pid=$!
    else
        echo -e "${YELLOW}No system logs available for monitoring${NC}"
        return
    fi
    
    # Wait for user interrupt
    trap "kill $monitor_pid 2>/dev/null; echo -e '\n${GREEN}Monitoring stopped${NC}'" INT
    wait $monitor_pid 2>/dev/null
}

# Generate forensic report
generate_forensic_report() {
    echo -e "${CYAN}${BOLD}📋 GENERATING FORENSIC REPORT${NC}"
    echo "=============================================="
    echo
    
    report_file="../logs/forensic_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo -e "${GREEN}Creating comprehensive forensic report...${NC}"
    echo
    
    # Create report header
    cat > "$report_file" << EOF
========================================
DIGITAL FORENSICS ANALYSIS REPORT
========================================
Generated: $(date)
System: $(hostname)
Analyst: Security Analyst
========================================

EXECUTIVE SUMMARY
----------------
This report contains analysis of system logs and security events
for potential security incidents and anomalies.

EOF
    
    # System information
    echo "SYSTEM INFORMATION" >> "$report_file"
    echo "==================" >> "$report_file"
    echo "Hostname: $(hostname)" >> "$report_file"
    echo "OS: $(uname -a)" >> "$report_file"
    echo "Uptime: $(uptime)" >> "$report_file"
    echo "" >> "$report_file"
    
    # Authentication analysis
    echo "AUTHENTICATION ANALYSIS" >> "$report_file"
    echo "=======================" >> "$report_file"
    
    auth_logs=("/var/log/auth.log" "/var/log/secure")
    for log in "${auth_logs[@]}"; do
        if [ -f "$log" ]; then
            successful=$(grep -c "session opened" "$log" 2>/dev/null || echo "0")
            failed=$(grep -c "Failed password" "$log" 2>/dev/null || echo "0")
            echo "Successful logins: $successful" >> "$report_file"
            echo "Failed login attempts: $failed" >> "$report_file"
            break
        fi
    done
    echo "" >> "$report_file"
    
    # Network connections
    echo "NETWORK ANALYSIS" >> "$report_file"
    echo "================" >> "$report_file"
    echo "Active connections:" >> "$report_file"
    netstat -tuln 2>/dev/null | head -10 >> "$report_file" || echo "Network data unavailable" >> "$report_file"
    echo "" >> "$report_file"
    
    # Process analysis
    echo "PROCESS ANALYSIS" >> "$report_file"
    echo "================" >> "$report_file"
    echo "Running processes:" >> "$report_file"
    ps aux | head -10 >> "$report_file"
    echo "" >> "$report_file"
    
    # File system analysis
    echo "FILE SYSTEM ANALYSIS" >> "$report_file"
    echo "====================" >> "$report_file"
    echo "Disk usage:" >> "$report_file"
    df -h >> "$report_file"
    echo "" >> "$report_file"
    
    echo "Report completed: $report_file" >> "$report_file"
    
    echo -e "${GREEN}✅ Forensic report generated: $report_file${NC}"
    echo -e "${CYAN}Report includes: System info, authentication analysis, network analysis, process analysis${NC}"
    echo
}

# Intrusion detection
intrusion_detection() {
    echo -e "${CYAN}${BOLD}🚨 INTRUSION ATTEMPT DETECTION${NC}"
    echo "=============================================="
    echo
    
    echo -e "${BOLD}Analyzing system for intrusion indicators...${NC}"
    echo
    
    # Check for suspicious login patterns
    echo -e "${YELLOW}1. Suspicious Login Pattern Analysis:${NC}"
    
    auth_logs=("/var/log/auth.log" "/var/log/secure")
    for log in "${auth_logs[@]}"; do
        if [ -f "$log" ]; then
            # Multiple failed attempts from same IP
            echo -e "${BOLD}   Brute force attempts:${NC}"
            grep "Failed password" "$log" 2>/dev/null | awk '{
                for(i=1;i<=NF;i++) {
                    if($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) {
                        print $i
                    }
                }
            }' | sort | uniq -c | sort -rn | head -3 | while read count ip; do
                if [ "$count" -gt 10 ]; then
                    echo -e "   ${RED}⚠️  HIGH RISK: $ip ($count attempts)${NC}"
                elif [ "$count" -gt 3 ]; then
                    echo -e "   ${YELLOW}⚠️  MEDIUM RISK: $ip ($count attempts)${NC}"
                else
                    echo -e "   ${GREEN}✅ LOW RISK: $ip ($count attempts)${NC}"
                fi
            done
            break
        fi
    done
    echo
    
    # Check for unusual process activity
    echo -e "${YELLOW}2. Unusual Process Activity:${NC}"
    unusual_processes=$(ps aux | grep -E "(nc|netcat|nmap|wget|curl)" | grep -v grep | wc -l)
    echo -e "${CYAN}   Network tools running: $unusual_processes${NC}"
    
    # Check for unusual network connections
    echo -e "${YELLOW}3. Network Connection Analysis:${NC}"
    if command -v netstat >/dev/null; then
        foreign_connections=$(netstat -an | grep ESTABLISHED | grep -v "127.0.0.1\|::1" | wc -l)
        echo -e "${CYAN}   External connections: $foreign_connections${NC}"
    fi
    
    # Check for file modifications in sensitive areas
    echo -e "${YELLOW}4. Sensitive File Analysis:${NC}"
    if [ -d /etc ]; then
        recent_etc_changes=$(find /etc -type f -mtime -1 2>/dev/null | wc -l)
        echo -e "${CYAN}   Recent /etc modifications: $recent_etc_changes${NC}"
    fi
    
    echo
    echo -e "${BOLD}Intrusion Detection Summary:${NC}"
    echo -e "${GREEN}✅ Basic intrusion detection scan completed${NC}"
    echo -e "${YELLOW}⚠️  Review flagged items for potential security issues${NC}"
    echo
}

# Main log analyzer function
run_log_analyzer() {
    while true; do
        show_log_banner
        show_log_menu
        read -r choice
        echo
        
        case $choice in
            1)
                system_log_overview
                ;;
            2)
                auth_log_analysis
                ;;
            3)
                web_log_analysis
                ;;
            4)
                error_analysis
                ;;
            5)
                echo -e "${CYAN}${BOLD}🔍 KERNEL LOG INVESTIGATION${NC}"
                echo "=============================================="
                echo
                if [ -f /var/log/kern.log ]; then
                    echo -e "${BOLD}Recent Kernel Messages:${NC}"
                    tail -10 /var/log/kern.log | while read line; do
                        echo -e "${GREEN}$line${NC}"
                    done
                elif [ -f /var/log/dmesg ]; then
                    echo -e "${BOLD}Boot Messages:${NC}"
                    tail -10 /var/log/dmesg | while read line; do
                        echo -e "${GREEN}$line${NC}"
                    done
                else
                    echo -e "${YELLOW}No kernel logs accessible${NC}"
                fi
                echo
                ;;
            6)
                echo -e "${CYAN}${BOLD}📱 APPLICATION LOG SCANNER${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}Available Application Logs:${NC}"
                find /var/log -name "*.log" -type f 2>/dev/null | head -10 | while read logfile; do
                    size=$(du -h "$logfile" 2>/dev/null | cut -f1)
                    echo -e "${GREEN}$logfile ($size)${NC}"
                done
                echo
                ;;
            7)
                realtime_monitor
                ;;
            8)
                failed_login_analysis
                ;;
            9)
                intrusion_detection
                ;;
            10)
                echo -e "${CYAN}${BOLD}⏰ SECURITY EVENT TIMELINE${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}Security Events (Last 24 Hours):${NC}"
                if command -v journalctl >/dev/null; then
                    journalctl --since="24 hours ago" | grep -i "security\|auth\|fail" | tail -10 | while read line; do
                        echo -e "${CYAN}$line${NC}"
                    done
                else
                    echo -e "${YELLOW}Systemd journal not available${NC}"
                fi
                echo
                ;;
            11)
                echo -e "${CYAN}${BOLD}🌐 NETWORK ATTACK PATTERNS${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}Analyzing network-based attack patterns...${NC}"
                echo
                
                # Check for port scanning
                echo -e "${YELLOW}Port scan detection:${NC}"
                if [ -f /var/log/syslog ]; then
                    grep -i "port.*scan" /var/log/syslog | tail -3 | while read line; do
                        echo -e "${RED}$line${NC}"
                    done
                fi
                echo
                ;;
            12)
                echo -e "${CYAN}${BOLD}🔍 SUSPICIOUS PROCESS ANALYSIS${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}Current Process Analysis:${NC}"
                
                # Check for processes listening on unusual ports
                echo -e "${YELLOW}Processes listening on network ports:${NC}"
                netstat -tulnp 2>/dev/null | grep LISTEN | head -5 | while read line; do
                    echo -e "${CYAN}$line${NC}"
                done
                echo
                
                # Check for processes with high CPU/Memory usage
                echo -e "${YELLOW}Top resource-consuming processes:${NC}"
                ps aux --sort=-%cpu | head -6 | tail -5 | while read line; do
                    echo -e "${GREEN}$line${NC}"
                done
                echo
                ;;
            13)
                echo -e "${CYAN}${BOLD}📁 FILE SYSTEM AUDIT${NC}"
                echo "=============================================="
                echo
                echo -e "${BOLD}File System Security Audit:${NC}"
                
                # Check for SUID files
                echo -e "${YELLOW}SUID files in system directories:${NC}"
                find /usr/bin /bin /sbin /usr/sbin -perm -4000 -type f 2>/dev/null | head -5 | while read file; do
                    echo -e "${CYAN}$file${NC}"
                done
                echo
                
                # Check for world-writable files
                echo -e "${YELLOW}World-writable files (potential risk):${NC}"
                find /tmp -type f -perm -002 2>/dev/null | head -3 | while read file; do
                    echo -e "${RED}$file${NC}"
                done
                echo
                ;;
            14)
                generate_forensic_report
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}❌ Invalid option. Please select 0-14.${NC}"
                ;;
        esac
        
        echo -e "${YELLOW}Press any key to continue...${NC}"
        read -n 1 -s
        clear
    done
}
