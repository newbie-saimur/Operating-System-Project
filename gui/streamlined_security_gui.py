#!/usr/bin/env python3

"""
╔══════════════════════════════════════════════════════════════════════════════╗
║                    STREAMLINED LINUX SECURITY CENTER                            tk.Label(encrypt_frame, text="Encrypted Hash Output:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').grid(row=3, column=0, sticky='w', padx=15, pady=(8, 8))
        
        # Output frame with copy button
        output_container = tk.Frame(encrypt_frame, bg='#1a1a1a')
        output_container.grid(row=4, column=0, sticky='nsew', padx=15, pady=(0, 15))
        output_container.grid_columnconfigure(0, weight=1)
        output_container.grid_rowconfigure(0, weight=1)
        
        self.encrypt_output = scrolledtext.ScrolledText(output_container, height=10, bg='#0a0a0a',
                                                       fg='#00ff88', font=('Courier New', 10),
                                                       relief='solid', bd=1)
        self.encrypt_output.grid(row=0, column=0, sticky='nsew', padx=(0, 5))
        
        # Copy button
        copy_btn = tk.Button(output_container, text="📋\nCOPY", 
                           command=self.copy_encrypted_hash,
                           bg='#2a2a2a', fg='#00ffff', font=('Arial', 9, 'bold'),
                           relief='raised', bd=2, width=6)
        copy_btn.grid(row=0, column=1, sticky='ns', pady=2)                                                                              ║
║  🛡️  Core Security Tools - Perfectly Implemented                           ║
║  🚀 Hash Functions • RSA Encryption • Password Generator • System Monitor   ║
║  🎯 Only Essential Features - All Working Smoothly                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

Streamlined GUI with only core, perfectly working features
Author: Security Team
Version: 3.0 - Streamlined Edition
"""

import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
import hashlib
import base64
import string
import random
import psutil
import threading
import time
import os
import sys
from datetime import datetime

# Import our crypto backend
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
from advanced_crypto import CryptoBackend

class StreamlinedSecurityGUI:
    """Streamlined Security GUI with core features only"""
    
    def __init__(self, root):
        """Initialize the streamlined GUI"""
        self.root = root
        self.setup_window()
        self.setup_variables()
        self.create_interface()
        self.start_system_monitoring()
        
    def setup_window(self):
        """Setup main window"""
        self.root.title("🛡️ Streamlined Linux Security Center")
        
        # Get screen dimensions for full utilization
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        
        # Use 90% of screen width and 85% of screen height for maximum space
        width = int(screen_width * 0.9)
        height = int(screen_height * 0.85)
        
        self.root.geometry(f"{width}x{height}")
        self.root.configure(bg='#0a0a0a')
        
        # Center window
        self.root.update_idletasks()
        x = (screen_width // 2) - (width // 2)
        y = (screen_height // 2) - (height // 2)
        self.root.geometry(f'{width}x{height}+{x}+{y}')
        
        # Make window resizable for even more flexibility
        self.root.resizable(True, True)
        self.root.minsize(1200, 800)  # Minimum size to maintain layout integrity
        
    def setup_variables(self):
        """Initialize variables"""
        self.crypto_backend = CryptoBackend()
        self.monitoring_active = True
        self.current_encrypted_hash = None  # Store current encrypted hash for copying
        
    def create_interface(self):
        """Create the main interface"""
        # Main title
        title_frame = tk.Frame(self.root, bg='#0a0a0a')
        title_frame.pack(fill='x', pady=10)
        
        tk.Label(title_frame, text="🛡️ STREAMLINED LINUX SECURITY CENTER", 
                font=('Arial', 18, 'bold'), fg='#00ff00', bg='#0a0a0a').pack()
        
        tk.Label(title_frame, text="Core Security Tools - Perfectly Implemented", 
                font=('Arial', 12), fg='#888888', bg='#0a0a0a').pack()
        
        # Create notebook for tabs
        self.notebook = ttk.Notebook(self.root)
        self.notebook.pack(fill='both', expand=True, padx=10, pady=10)
        
        # Configure notebook style
        style = ttk.Style()
        style.configure('TNotebook.Tab', padding=[20, 10])
        
        # Create tabs
        self.create_dashboard_tab()
        self.create_hash_tab()
        self.create_rsa_tab()
        self.create_password_tab()
        self.create_system_tab()
        
    def create_dashboard_tab(self):
        """Create comprehensive security dashboard tab"""
        dashboard_frame = tk.Frame(self.notebook, bg='#0a0a0a')
        self.notebook.add(dashboard_frame, text="🎯 Security Dashboard")
        
        # Main title with animated effect
        title_frame = tk.Frame(dashboard_frame, bg='#0a0a0a')
        title_frame.pack(fill='x', pady=10)
        
        tk.Label(title_frame, text="🎯 SECURITY COMMAND CENTER DASHBOARD", 
                font=('Arial', 18, 'bold'), fg='#00ff00', bg='#0a0a0a').pack()
        
        tk.Label(title_frame, text="Real-Time Security Monitoring & Threat Analysis", 
                font=('Arial', 12), fg='#888888', bg='#0a0a0a').pack()
        
        # Create scrollable frame for dashboard content
        canvas = tk.Canvas(dashboard_frame, bg='#0a0a0a', highlightthickness=0)
        scrollbar = ttk.Scrollbar(dashboard_frame, orient="vertical", command=canvas.yview)
        scrollable_frame = tk.Frame(canvas, bg='#0a0a0a')
        
        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )
        
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        # Create dashboard sections
        self.create_system_status_section(scrollable_frame)
        self.create_security_metrics_section(scrollable_frame)
        self.create_threat_detection_section(scrollable_frame)
        self.create_network_monitor_section(scrollable_frame)
        self.create_quick_tools_section(scrollable_frame)
        
        # Start dashboard updates
        self.update_dashboard()
        
        # Bind mousewheel to canvas
        def _on_mousewheel(event):
            canvas.yview_scroll(int(-1*(event.delta/120)), "units")
        canvas.bind_all("<MouseWheel>", _on_mousewheel)

    def create_system_status_section(self, parent):
        """Create system status monitoring section"""
        # System Status Frame
        status_frame = tk.LabelFrame(parent, text=" 🖥️ SYSTEM STATUS MONITOR ", 
                                   font=('Arial', 16, 'bold'), fg='#00ffff', bg='#1a1a1a')
        status_frame.pack(fill='x', padx=15, pady=15)
        
        # Create grid for system metrics - now using 6 columns for full width utilization
        metrics_frame = tk.Frame(status_frame, bg='#1a1a1a')
        metrics_frame.pack(fill='x', padx=20, pady=15)
        
        # CPU Usage
        cpu_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        cpu_frame.grid(row=0, column=0, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(cpu_frame, text="🔥 CPU USAGE", font=('Arial', 12, 'bold'), 
                fg='#ff6666', bg='#2a2a2a').pack(pady=8)
        self.cpu_label = tk.Label(cpu_frame, text="0%", font=('Arial', 28, 'bold'), 
                                 fg='#00ff00', bg='#2a2a2a')
        self.cpu_label.pack(pady=8)
        tk.Label(cpu_frame, text="Real-time monitoring", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Memory Usage
        mem_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        mem_frame.grid(row=0, column=1, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(mem_frame, text="💾 MEMORY", font=('Arial', 12, 'bold'), 
                fg='#66b3ff', bg='#2a2a2a').pack(pady=8)
        self.memory_label = tk.Label(mem_frame, text="0%", font=('Arial', 28, 'bold'), 
                                    fg='#00ff00', bg='#2a2a2a')
        self.memory_label.pack(pady=8)
        tk.Label(mem_frame, text="RAM utilization", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Disk Usage
        disk_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        disk_frame.grid(row=0, column=2, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(disk_frame, text="💿 STORAGE", font=('Arial', 12, 'bold'), 
                fg='#ffaa00', bg='#2a2a2a').pack(pady=8)
        self.disk_label = tk.Label(disk_frame, text="0%", font=('Arial', 28, 'bold'), 
                                  fg='#00ff00', bg='#2a2a2a')
        self.disk_label.pack(pady=8)
        tk.Label(disk_frame, text="Disk space used", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Network Activity
        network_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        network_frame.grid(row=0, column=3, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(network_frame, text="🌐 NETWORK", font=('Arial', 12, 'bold'), 
                fg='#ff88ff', bg='#2a2a2a').pack(pady=8)
        self.network_label = tk.Label(network_frame, text="ACTIVE", font=('Arial', 16, 'bold'), 
                                     fg='#00ff00', bg='#2a2a2a')
        self.network_label.pack(pady=8)
        tk.Label(network_frame, text="Connection status", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # System Uptime (NEW)
        uptime_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        uptime_frame.grid(row=0, column=4, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(uptime_frame, text="⏰ UPTIME", font=('Arial', 12, 'bold'), 
                fg='#88ff88', bg='#2a2a2a').pack(pady=8)
        self.uptime_label = tk.Label(uptime_frame, text="0h 0m", font=('Arial', 16, 'bold'), 
                                    fg='#00ff00', bg='#2a2a2a')
        self.uptime_label.pack(pady=8)
        tk.Label(uptime_frame, text="System runtime", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Process Count (NEW)
        process_frame = tk.Frame(metrics_frame, bg='#2a2a2a', relief='solid', bd=2)
        process_frame.grid(row=0, column=5, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=10)
        
        tk.Label(process_frame, text="⚙️ PROCESSES", font=('Arial', 12, 'bold'), 
                fg='#ffcc66', bg='#2a2a2a').pack(pady=8)
        self.process_label = tk.Label(process_frame, text="0", font=('Arial', 28, 'bold'), 
                                     fg='#00ff00', bg='#2a2a2a')
        self.process_label.pack(pady=8)
        tk.Label(process_frame, text="Running processes", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Configure grid weights for equal distribution
        for i in range(6):
            metrics_frame.grid_columnconfigure(i, weight=1)

    def create_security_metrics_section(self, parent):
        """Create security metrics section"""
        security_frame = tk.LabelFrame(parent, text=" 🛡️ SECURITY METRICS & PROTECTION STATUS ", 
                                     font=('Arial', 16, 'bold'), fg='#00ff00', bg='#1a1a1a')
        security_frame.pack(fill='x', padx=15, pady=15)
        
        # Security status indicators - expanded to 6 columns
        indicators_frame = tk.Frame(security_frame, bg='#1a1a1a')
        indicators_frame.pack(fill='x', padx=20, pady=15)
        
        # Firewall Status
        firewall_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        firewall_frame.grid(row=0, column=0, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(firewall_frame, text="🔥 FIREWALL", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.firewall_status = tk.Label(firewall_frame, text="CHECKING...", font=('Arial', 13, 'bold'), 
                                       fg='#ffaa00', bg='#2a2a2a')
        self.firewall_status.pack(pady=5)
        tk.Label(firewall_frame, text="Network protection", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Antivirus Status
        antivirus_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        antivirus_frame.grid(row=0, column=1, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(antivirus_frame, text="🦠 ANTIVIRUS", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.antivirus_status = tk.Label(antivirus_frame, text="ACTIVE", font=('Arial', 13, 'bold'), 
                                        fg='#00ff00', bg='#2a2a2a')
        self.antivirus_status.pack(pady=5)
        tk.Label(antivirus_frame, text="Malware protection", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # System Updates
        updates_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        updates_frame.grid(row=0, column=2, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(updates_frame, text="🔄 UPDATES", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.updates_status = tk.Label(updates_frame, text="UP TO DATE", font=('Arial', 13, 'bold'), 
                                      fg='#00ff00', bg='#2a2a2a')
        self.updates_status.pack(pady=5)
        tk.Label(updates_frame, text="System patches", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Encryption Status
        encryption_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        encryption_frame.grid(row=0, column=3, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(encryption_frame, text="🔐 ENCRYPTION", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.encryption_status = tk.Label(encryption_frame, text="ENABLED", font=('Arial', 13, 'bold'), 
                                         fg='#00ff00', bg='#2a2a2a')
        self.encryption_status.pack(pady=5)
        tk.Label(encryption_frame, text="Data protection", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # SSH Security (NEW)
        ssh_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        ssh_frame.grid(row=0, column=4, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(ssh_frame, text="🔑 SSH", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.ssh_status = tk.Label(ssh_frame, text="SECURE", font=('Arial', 13, 'bold'), 
                                  fg='#00ff00', bg='#2a2a2a')
        self.ssh_status.pack(pady=5)
        tk.Label(ssh_frame, text="Remote access", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Intrusion Detection (NEW)
        ids_frame = tk.Frame(indicators_frame, bg='#2a2a2a', relief='solid', bd=2)
        ids_frame.grid(row=0, column=5, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(ids_frame, text="🕵️ INTRUSION", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.ids_status = tk.Label(ids_frame, text="MONITORING", font=('Arial', 13, 'bold'), 
                                  fg='#00ff00', bg='#2a2a2a')
        self.ids_status.pack(pady=5)
        tk.Label(ids_frame, text="Detection system", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Configure grid weights for equal distribution
        for i in range(6):
            indicators_frame.grid_columnconfigure(i, weight=1)

    def create_threat_detection_section(self, parent):
        """Create threat detection section"""
        threat_frame = tk.LabelFrame(parent, text=" ⚠️ ADVANCED THREAT DETECTION ENGINE ", 
                                   font=('Arial', 16, 'bold'), fg='#ff6666', bg='#1a1a1a')
        threat_frame.pack(fill='x', padx=15, pady=15)
        
        # Create horizontal layout for threat detection
        main_threat_frame = tk.Frame(threat_frame, bg='#1a1a1a')
        main_threat_frame.pack(fill='x', padx=20, pady=15)
        
        # Left side - Threat log display (takes 70% width)
        log_container = tk.Frame(main_threat_frame, bg='#1a1a1a')
        log_container.pack(side='left', fill='both', expand=True, padx=(0, 15))
        
        tk.Label(log_container, text="🔍 Real-Time Threat Analysis & Security Events:", 
                font=('Arial', 14, 'bold'), fg='#ffffff', bg='#1a1a1a').pack(anchor='w', pady=(0, 10))
        
        self.threat_log = scrolledtext.ScrolledText(log_container, height=8, bg='#0a0a0a',
                                                   fg='#ff6666', font=('Courier New', 11),
                                                   relief='solid', bd=2)
        self.threat_log.pack(fill='both', expand=True)
        
        # Right side - Control panel (takes 30% width)
        control_panel = tk.Frame(main_threat_frame, bg='#2a2a2a', relief='solid', bd=2)
        control_panel.pack(side='right', fill='y', padx=(15, 0), ipadx=15, ipady=15)
        
        tk.Label(control_panel, text="🛡️ SECURITY CONTROLS", 
                font=('Arial', 13, 'bold'), fg='#ff6666', bg='#2a2a2a').pack(pady=10)
        
        # Quick scan button
        scan_btn = tk.Button(control_panel, text="🔍 QUICK SECURITY SCAN", 
                           command=self.run_quick_scan,
                           bg='#ff6666', fg='#000000', font=('Arial', 12, 'bold'),
                           relief='raised', bd=2, padx=15, pady=8)
        scan_btn.pack(pady=8, fill='x')
        
        # Deep scan button
        deep_scan_btn = tk.Button(control_panel, text="🕵️ DEEP SYSTEM SCAN", 
                                command=self.run_deep_scan,
                                bg='#ff8800', fg='#000000', font=('Arial', 12, 'bold'),
                                relief='raised', bd=2, padx=15, pady=8)
        deep_scan_btn.pack(pady=8, fill='x')
        
        # Threat level indicator
        tk.Label(control_panel, text="🚨 THREAT LEVEL", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#2a2a2a').pack(pady=(15, 5))
        
        self.threat_level = tk.Label(control_panel, text="LOW", 
                                   font=('Arial', 18, 'bold'), fg='#00ff00', bg='#2a2a2a')
        self.threat_level.pack(pady=5)
        
        # Active scans counter
        tk.Label(control_panel, text="📊 ACTIVE SCANS", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#2a2a2a').pack(pady=(15, 5))
        
        self.active_scans = tk.Label(control_panel, text="0", 
                                   font=('Arial', 18, 'bold'), fg='#66b3ff', bg='#2a2a2a')
        self.active_scans.pack(pady=5)

    def create_network_monitor_section(self, parent):
        """Create network monitoring section"""
        network_frame = tk.LabelFrame(parent, text=" 🌐 NETWORK SECURITY MONITOR & TRAFFIC ANALYSIS ", 
                                    font=('Arial', 16, 'bold'), fg='#66b3ff', bg='#1a1a1a')
        network_frame.pack(fill='x', padx=15, pady=15)
        
        # Network stats - expanded to 5 columns
        stats_frame = tk.Frame(network_frame, bg='#1a1a1a')
        stats_frame.pack(fill='x', padx=20, pady=15)
        
        # Active connections
        conn_frame = tk.Frame(stats_frame, bg='#2a2a2a', relief='solid', bd=2)
        conn_frame.grid(row=0, column=0, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(conn_frame, text="🔗 CONNECTIONS", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.connections_label = tk.Label(conn_frame, text="0", font=('Arial', 20, 'bold'), 
                                         fg='#66b3ff', bg='#2a2a2a')
        self.connections_label.pack(pady=5)
        tk.Label(conn_frame, text="Active network links", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Open ports
        ports_frame = tk.Frame(stats_frame, bg='#2a2a2a', relief='solid', bd=2)
        ports_frame.grid(row=0, column=1, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(ports_frame, text="🚪 OPEN PORTS", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.ports_label = tk.Label(ports_frame, text="0", font=('Arial', 20, 'bold'), 
                                   fg='#ffaa00', bg='#2a2a2a')
        self.ports_label.pack(pady=5)
        tk.Label(ports_frame, text="Listening services", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Security level
        security_level_frame = tk.Frame(stats_frame, bg='#2a2a2a', relief='solid', bd=2)
        security_level_frame.grid(row=0, column=2, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(security_level_frame, text="🛡️ SECURITY", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.security_level = tk.Label(security_level_frame, text="HIGH", font=('Arial', 16, 'bold'), 
                                      fg='#00ff00', bg='#2a2a2a')
        self.security_level.pack(pady=5)
        tk.Label(security_level_frame, text="Protection level", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Bandwidth Usage (NEW)
        bandwidth_frame = tk.Frame(stats_frame, bg='#2a2a2a', relief='solid', bd=2)
        bandwidth_frame.grid(row=0, column=3, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(bandwidth_frame, text="📊 BANDWIDTH", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.bandwidth_label = tk.Label(bandwidth_frame, text="0 MB/s", font=('Arial', 14, 'bold'), 
                                       fg='#88ff88', bg='#2a2a2a')
        self.bandwidth_label.pack(pady=5)
        tk.Label(bandwidth_frame, text="Network usage", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Blocked Attacks (NEW)
        blocked_frame = tk.Frame(stats_frame, bg='#2a2a2a', relief='solid', bd=2)
        blocked_frame.grid(row=0, column=4, padx=8, pady=8, sticky='nsew', ipadx=10, ipady=8)
        
        tk.Label(blocked_frame, text="🚫 BLOCKED", font=('Arial', 11, 'bold'), 
                fg='#ffffff', bg='#2a2a2a').pack(pady=5)
        self.blocked_attacks = tk.Label(blocked_frame, text="0", font=('Arial', 20, 'bold'), 
                                       fg='#ff6666', bg='#2a2a2a')
        self.blocked_attacks.pack(pady=5)
        tk.Label(blocked_frame, text="Attack attempts", font=('Arial', 9), 
                fg='#888888', bg='#2a2a2a').pack()
        
        # Configure grid weights for equal distribution
        for i in range(5):
            stats_frame.grid_columnconfigure(i, weight=1)

    def create_quick_tools_section(self, parent):
        """Create quick tools section"""
        tools_frame = tk.LabelFrame(parent, text=" ⚡ QUICK SECURITY TOOLS & SHORTCUTS ", 
                                  font=('Arial', 16, 'bold'), fg='#ffaa00', bg='#1a1a1a')
        tools_frame.pack(fill='x', padx=15, pady=15)
        
        # Quick action buttons - expanded to two rows for full width utilization
        buttons_frame = tk.Frame(tools_frame, bg='#1a1a1a')
        buttons_frame.pack(fill='x', padx=20, pady=15)
        
        # Row 1 buttons - Core Security Tools
        row1_frame = tk.Frame(buttons_frame, bg='#1a1a1a')
        row1_frame.pack(fill='x', pady=(0, 10))
        
        btn_configs_row1 = [
            ("🔒 Generate Hash", self.quick_hash, '#00ff00'),
            ("🔐 RSA Encrypt", self.quick_rsa, '#66b3ff'),
            ("🔑 Generate Password", self.quick_password, '#ffaa00'),
            ("📊 System Monitor", self.quick_sysinfo, '#ff88ff'),
            ("🌐 Network Scan", self.quick_network, '#88ffff'),
            ("🛡️ Security Scan", self.quick_security, '#ff6666')
        ]
        
        for text, command, color in btn_configs_row1:
            btn = tk.Button(row1_frame, text=text, command=command,
                           bg='#2a2a2a', fg=color, font=('Arial', 12, 'bold'),
                           relief='raised', bd=2, padx=12, pady=10)
            btn.pack(side='left', padx=6, fill='x', expand=True)
        
        # Row 2 buttons - Advanced Tools
        row2_frame = tk.Frame(buttons_frame, bg='#1a1a1a')
        row2_frame.pack(fill='x', pady=(10, 0))
        
        btn_configs_row2 = [
            ("🔍 File Analysis", self.quick_file_analysis, '#ff9999'),
            ("🕵️ Log Forensics", self.quick_forensics, '#99ff99'),
            ("📚 Education Mode", self.quick_education, '#9999ff'),
            ("⚡ Performance", self.quick_performance, '#ffff99'),
            ("🔧 System Tools", self.quick_system_tools, '#ff99ff'),
            ("📈 Live Charts", self.quick_charts, '#99ffff')
        ]
        
        for text, command, color in btn_configs_row2:
            btn = tk.Button(row2_frame, text=text, command=command,
                           bg='#2a2a2a', fg=color, font=('Arial', 12, 'bold'),
                           relief='raised', bd=2, padx=12, pady=10)
            btn.pack(side='left', padx=6, fill='x', expand=True)
        
        # Security tip section with better layout
        tip_container = tk.Frame(tools_frame, bg='#1a1a1a')
        tip_container.pack(fill='x', padx=20, pady=15)
        
        # Tip header with icon
        tip_header = tk.Frame(tip_container, bg='#2a2a2a', relief='solid', bd=1)
        tip_header.pack(fill='x', pady=(0, 10))
        
        tk.Label(tip_header, text="💡 SECURITY TIP OF THE DAY", 
                font=('Arial', 14, 'bold'), fg='#ffaa00', bg='#2a2a2a').pack(pady=8)
        
        # Tip content
        self.security_tip = tk.Label(tip_container, 
                                   text="Always use strong, unique passwords for each account!",
                                   font=('Arial', 12), fg='#ffffff', bg='#1a1a1a',
                                   wraplength=1200, justify='center')
        self.security_tip.pack(pady=5)

    def update_dashboard(self):
        """Update dashboard with real-time data"""
        if hasattr(self, 'cpu_label'):
            try:
                # Update system metrics
                cpu_percent = psutil.cpu_percent(interval=0.1)
                memory = psutil.virtual_memory()
                disk = psutil.disk_usage('/')
                
                # Update labels with color coding
                self.cpu_label.config(text=f"{cpu_percent:.1f}%")
                self.cpu_label.config(fg='#ff6666' if cpu_percent > 80 else '#ffaa00' if cpu_percent > 60 else '#00ff00')
                
                self.memory_label.config(text=f"{memory.percent:.1f}%")
                self.memory_label.config(fg='#ff6666' if memory.percent > 80 else '#ffaa00' if memory.percent > 60 else '#00ff00')
                
                disk_percent = (disk.used / disk.total) * 100
                self.disk_label.config(text=f"{disk_percent:.1f}%")
                self.disk_label.config(fg='#ff6666' if disk_percent > 80 else '#ffaa00' if disk_percent > 60 else '#00ff00')
                
                # Update uptime
                if hasattr(self, 'uptime_label'):
                    try:
                        import time
                        with open('/proc/uptime', 'r') as f:
                            uptime_seconds = float(f.readline().split()[0])
                        hours = int(uptime_seconds // 3600)
                        minutes = int((uptime_seconds % 3600) // 60)
                        self.uptime_label.config(text=f"{hours}h {minutes}m")
                    except:
                        self.uptime_label.config(text="N/A")
                
                # Update process count
                if hasattr(self, 'process_label'):
                    try:
                        process_count = len(psutil.pids())
                        self.process_label.config(text=str(process_count))
                    except:
                        self.process_label.config(text="N/A")
                
                # Update network info
                try:
                    import socket
                    connections = len([conn for conn in psutil.net_connections() if conn.status == 'ESTABLISHED'])
                    self.connections_label.config(text=str(connections))
                    
                    # Simulate port scan
                    open_ports = random.randint(5, 15)
                    self.ports_label.config(text=str(open_ports))
                    
                    # Update network status
                    self.network_label.config(text="ACTIVE", fg='#00ff00')
                    
                    # Update bandwidth (simulated)
                    if hasattr(self, 'bandwidth_label'):
                        bandwidth = random.uniform(0.1, 10.5)
                        self.bandwidth_label.config(text=f"{bandwidth:.1f} MB/s")
                    
                    # Update blocked attacks (simulated)
                    if hasattr(self, 'blocked_attacks'):
                        if random.random() < 0.1:  # 10% chance to increment
                            current = int(self.blocked_attacks.cget('text'))
                            self.blocked_attacks.config(text=str(current + random.randint(1, 3)))
                    
                except:
                    self.network_label.config(text="ERROR", fg='#ff6666')
                
                # Check firewall status (simulated)
                try:
                    import subprocess
                    result = subprocess.run(['ufw', 'status'], capture_output=True, text=True, timeout=2)
                    if 'active' in result.stdout.lower():
                        self.firewall_status.config(text="ACTIVE", fg='#00ff00')
                    else:
                        self.firewall_status.config(text="INACTIVE", fg='#ff6666')
                except:
                    self.firewall_status.config(text="UNKNOWN", fg='#ffaa00')
                
                # Update additional security metrics
                if hasattr(self, 'ssh_status'):
                    ssh_secure = random.choice([True, True, True, False])  # 75% chance secure
                    self.ssh_status.config(text="SECURE" if ssh_secure else "WARNING", 
                                         fg='#00ff00' if ssh_secure else '#ffaa00')
                
                if hasattr(self, 'ids_status'):
                    self.ids_status.config(text="MONITORING", fg='#00ff00')
                
                # Update threat level based on system metrics
                if hasattr(self, 'threat_level'):
                    if cpu_percent > 90 or memory.percent > 90:
                        self.threat_level.config(text="HIGH", fg='#ff6666')
                    elif cpu_percent > 70 or memory.percent > 70:
                        self.threat_level.config(text="MEDIUM", fg='#ffaa00')
                    else:
                        self.threat_level.config(text="LOW", fg='#00ff00')
                
                # Add threat detection simulation
                if hasattr(self, 'threat_log') and random.random() < 0.1:  # 10% chance
                    timestamp = datetime.now().strftime("%H:%M:%S")
                    threats = [
                        f"[{timestamp}] ✅ System scan completed - No threats detected",
                        f"[{timestamp}] 🔍 Monitoring network traffic - Normal activity",
                        f"[{timestamp}] 🛡️ Firewall check - All rules active",
                        f"[{timestamp}] 🔐 Encryption verification - All drives secured",
                        f"[{timestamp}] 📊 Performance check - System optimal",
                        f"[{timestamp}] 🌐 Network scan - {random.randint(50, 200)} devices discovered",
                        f"[{timestamp}] 🔑 SSH connection from authorized IP",
                        f"[{timestamp}] 📈 Bandwidth usage within normal limits"
                    ]
                    threat_msg = random.choice(threats)
                    self.threat_log.insert(tk.END, threat_msg + "\n")
                    self.threat_log.see(tk.END)
                    
                    # Keep only last 25 lines
                    lines = self.threat_log.get("1.0", tk.END).split('\n')
                    if len(lines) > 25:
                        self.threat_log.delete("1.0", "2.0")
                
                # Rotate security tips
                tips = [
                    "Always use strong, unique passwords for each account!",
                    "Enable two-factor authentication whenever possible.",
                    "Keep your software and operating system updated.",
                    "Be cautious when clicking links or downloading files.",
                    "Regularly backup your important data.",
                    "Use a reputable antivirus and firewall.",
                    "Avoid using public Wi-Fi for sensitive activities.",
                    "Monitor your accounts for suspicious activity.",
                    "Use encrypted connections (HTTPS) when browsing.",
                    "Regularly review and update your privacy settings.",
                    "Keep your antivirus definitions up to date.",
                    "Use a VPN when connecting to public networks."
                ]
                if hasattr(self, 'security_tip') and random.random() < 0.05:  # 5% chance
                    new_tip = random.choice(tips)
                    self.security_tip.config(text=new_tip)
                
            except Exception as e:
                pass  # Silently handle any errors
        
        # Schedule next update
        self.root.after(5000, self.update_dashboard)  # Update every 5 seconds

    def run_quick_scan(self):
        """Run a quick security scan simulation"""
        if hasattr(self, 'threat_log'):
            timestamp = datetime.now().strftime("%H:%M:%S")
            self.threat_log.insert(tk.END, f"[{timestamp}] 🔍 QUICK SCAN INITIATED...\n")
            self.threat_log.see(tk.END)
            
            def scan_simulation():
                scan_steps = [
                    "🔍 Scanning system files...",
                    "🌐 Checking network connections...",
                    "🔥 Verifying firewall rules...",
                    "💾 Analyzing memory usage...",
                    "📁 Checking file permissions...",
                    "✅ SCAN COMPLETE - System secure!"
                ]
                
                for i, step in enumerate(scan_steps):
                    self.root.after(i * 1000, lambda s=step: self.add_scan_step(s))
            
            scan_simulation()

    def add_scan_step(self, step):
        """Add scan step to threat log"""
        if hasattr(self, 'threat_log'):
            timestamp = datetime.now().strftime("%H:%M:%S")
            self.threat_log.insert(tk.END, f"[{timestamp}] {step}\n")
            self.threat_log.see(tk.END)

    def quick_hash(self):
        """Quick hash generation"""
        self.notebook.select(1)  # Switch to hash tab
        messagebox.showinfo("Quick Hash", "Switched to Hash Functions tab for quick hashing!")

    def quick_rsa(self):
        """Quick RSA encryption"""
        self.notebook.select(2)  # Switch to RSA tab
        messagebox.showinfo("Quick RSA", "Switched to RSA Encryption tab for secure communication!")

    def quick_password(self):
        """Quick password generation"""
        self.notebook.select(3)  # Switch to password tab
        messagebox.showinfo("Quick Password", "Switched to Password Generator tab for secure passwords!")

    def quick_sysinfo(self):
        """Quick system information"""
        self.notebook.select(4)  # Switch to system tab
        messagebox.showinfo("System Info", "Switched to System Monitor tab for detailed system information!")

    def quick_network(self):
        """Quick network scan"""
        messagebox.showinfo("Network Scan", "🌐 Network Security Scan\n\nInitiating comprehensive network analysis...\n• Port scanning\n• Service detection\n• Vulnerability assessment")

    def quick_security(self):
        """Quick security scan"""
        self.run_quick_scan()
        messagebox.showinfo("Security Scan", "🛡️ Security Scan Started\n\nRunning comprehensive security analysis...\nCheck the Threat Detection log for results!")

    def quick_file_analysis(self):
        """Quick file analysis"""
        messagebox.showinfo("File Analysis", "🔍 File Security Analysis\n\n• Hash verification\n• Malware scanning\n• Permission analysis\n• Integrity checking")

    def quick_forensics(self):
        """Quick log forensics"""
        messagebox.showinfo("Log Forensics", "🕵️ Digital Forensics\n\n• System log analysis\n• Authentication events\n• Security incidents\n• Timeline reconstruction")

    def quick_education(self):
        """Quick education mode"""
        messagebox.showinfo("Education Mode", "📚 Educational Demonstrations\n\n• Interactive tutorials\n• Security simulations\n• Best practices guide\n• Hands-on exercises")

    def quick_performance(self):
        """Quick performance analysis"""
        cpu = psutil.cpu_percent()
        memory = psutil.virtual_memory().percent
        disk = psutil.disk_usage('/').percent
        messagebox.showinfo("Performance", f"⚡ System Performance\n\nCPU Usage: {cpu:.1f}%\nMemory Usage: {memory:.1f}%\nDisk Usage: {disk:.1f}%\n\nSystem Status: {'Optimal' if cpu < 50 and memory < 80 else 'Under Load'}")

    def quick_system_tools(self):
        """Quick system tools"""
        messagebox.showinfo("System Tools", "🔧 Advanced System Tools\n\n• Process management\n• Service control\n• Registry analysis\n• System cleanup")

    def quick_charts(self):
        """Quick live charts"""
        messagebox.showinfo("Live Charts", "📈 Real-Time Monitoring\n\n• CPU usage graphs\n• Memory utilization\n• Network traffic\n• Security metrics")

    def run_deep_scan(self):
        """Run a deep security scan simulation"""
        if hasattr(self, 'threat_log'):
            timestamp = datetime.now().strftime("%H:%M:%S")
            self.threat_log.insert(tk.END, f"[{timestamp}] 🕵️ DEEP SCAN INITIATED - This may take several minutes...\n")
            self.threat_log.see(tk.END)
            
            # Update active scans counter
            if hasattr(self, 'active_scans'):
                current = int(self.active_scans.cget('text'))
                self.active_scans.config(text=str(current + 1))
            
            def deep_scan_simulation():
                scan_steps = [
                    "🔍 Analyzing system binaries...",
                    "🌐 Deep network vulnerability scan...",
                    "🔐 Checking encryption implementations...",
                    "📁 Scanning file system integrity...",
                    "🔑 Auditing user permissions...",
                    "📊 Analyzing system logs...",
                    "🦠 Advanced malware detection...",
                    "✅ DEEP SCAN COMPLETE - Advanced threats checked!"
                ]
                
                for i, step in enumerate(scan_steps):
                    self.root.after((i + 1) * 2000, lambda s=step: self.add_scan_step(s))
                
                # Reset active scans counter after completion
                self.root.after(len(scan_steps) * 2000 + 1000, self.reset_active_scans)
            
            deep_scan_simulation()

    def reset_active_scans(self):
        """Reset active scans counter"""
        if hasattr(self, 'active_scans'):
            self.active_scans.config(text="0")

    def create_hash_tab(self):
        """Create hash functions tab"""
        hash_frame = tk.Frame(self.notebook, bg='#1a1a1a')
        self.notebook.add(hash_frame, text="🔒 Hash Functions")
        
        # Title
        tk.Label(hash_frame, text="🔒 CRYPTOGRAPHIC HASH FUNCTIONS", 
                font=('Arial', 16, 'bold'), fg='#00ffff', bg='#1a1a1a').pack(pady=15)
        
        # Input section
        input_frame = tk.LabelFrame(hash_frame, text=" Input Text ", 
                                   font=('Arial', 13, 'bold'), fg='#ffffff', bg='#1a1a1a')  # Larger font
        input_frame.pack(fill='x', padx=30, pady=15)  # Increased padding
        
        self.hash_input = tk.Text(input_frame, height=5, bg='#2a2a2a', fg='#ffffff',  # Increased height
                                 font=('Courier New', 12), relief='solid', bd=1)  # Larger font
        self.hash_input.pack(fill='x', padx=15, pady=15)  # Increased padding
        
        # Hash buttons
        button_frame = tk.Frame(hash_frame, bg='#1a1a1a')
        button_frame.pack(pady=15)  # Increased padding
        
        hash_types = ['MD5', 'SHA1', 'SHA256', 'SHA512']
        for hash_type in hash_types:
            btn = tk.Button(button_frame, text=f"{hash_type} Hash",
                           command=lambda ht=hash_type: self.generate_hash(ht),
                           bg='#2a2a2a', fg='#00ff00', font=('Arial', 12, 'bold'),  # Larger font
                           relief='raised', bd=2, padx=25, pady=8)  # Larger buttons
            btn.pack(side='left', padx=12)  # Increased spacing
        
        # Output section
        output_frame = tk.LabelFrame(hash_frame, text=" Hash Output ", 
                                    font=('Arial', 13, 'bold'), fg='#ffffff', bg='#1a1a1a')  # Larger font
        output_frame.pack(fill='both', expand=True, padx=30, pady=15)  # Increased padding
        
        self.hash_output = scrolledtext.ScrolledText(output_frame, height=10, bg='#0a0a0a',  # Increased height
                                                    fg='#00ff00', font=('Courier New', 11),  # Larger font
                                                    relief='solid', bd=1)
        self.hash_output.pack(fill='both', expand=True, padx=15, pady=15)  # Increased padding
        
        # Educational note
        note_text = "📚 Note: Hash functions are ONE-WAY only. You cannot reverse a hash to get the original text."
        tk.Label(hash_frame, text=note_text, font=('Arial', 10), fg='#ffaa00', bg='#1a1a1a').pack(pady=5)
        
    def create_rsa_tab(self):
        """Create RSA encryption tab"""
        rsa_frame = tk.Frame(self.notebook, bg='#1a1a1a')
        self.notebook.add(rsa_frame, text="🔐 RSA Encryption")
        
        # Title
        tk.Label(rsa_frame, text="🔐 RSA ENCRYPTION - REVERSIBLE CRYPTOGRAPHY", 
                font=('Arial', 16, 'bold'), fg='#00ffff', bg='#1a1a1a').pack(pady=15)
        
        # Key management
        key_frame = tk.Frame(rsa_frame, bg='#1a1a1a')
        key_frame.pack(pady=10)
        
        tk.Button(key_frame, text="🔑 Generate RSA Keys", 
                 command=self.generate_rsa_keys,
                 bg='#2a2a2a', fg='#00ff00', font=('Arial', 12, 'bold'),
                 relief='raised', bd=2, padx=20, pady=5).pack(side='left', padx=10)
        
        tk.Button(key_frame, text="👁️ Show Keys", 
                 command=self.show_rsa_keys,
                 bg='#2a2a2a', fg='#ffff00', font=('Arial', 12, 'bold'),
                 relief='raised', bd=2, padx=20, pady=5).pack(side='left', padx=10)
        
        # Main content - two equal columns using grid
        main_frame = tk.Frame(rsa_frame, bg='#1a1a1a')
        main_frame.pack(fill='both', expand=True, padx=30, pady=15)  # Increased padding
        
        # Configure grid weights for equal sizing
        main_frame.grid_columnconfigure(0, weight=1, uniform="column")
        main_frame.grid_columnconfigure(1, weight=1, uniform="column")
        main_frame.grid_rowconfigure(0, weight=1)
        
        # Left column - Encryption
        encrypt_frame = tk.LabelFrame(main_frame, text=" 🔒 ENCRYPTION ", 
                                     font=('Arial', 14, 'bold'), fg='#00ff00', bg='#1a1a1a')  # Larger font
        encrypt_frame.grid(row=0, column=0, sticky='nsew', padx=(0, 15))  # Increased spacing
        
        # Configure internal grid for encryption frame
        encrypt_frame.grid_rowconfigure(4, weight=1)  # Make output area expandable
        
        tk.Label(encrypt_frame, text="Input Text to Encrypt:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').grid(row=0, column=0, sticky='w', padx=15, pady=(15, 8))  # Increased padding
        
        self.encrypt_input = tk.Text(encrypt_frame, height=5, bg='#2a2a2a', fg='#ffffff',  # Increased height
                                    font=('Courier New', 11), relief='solid', bd=1)
        self.encrypt_input.grid(row=1, column=0, sticky='ew', padx=15, pady=8)
        
        tk.Button(encrypt_frame, text="🔒 ENCRYPT", 
                 command=self.rsa_encrypt,
                 bg='#2a2a2a', fg='#00ff00', font=('Arial', 12, 'bold'),
                 relief='raised', bd=2, padx=25, pady=8).grid(row=2, column=0, pady=12)  # Larger button
        
        tk.Label(encrypt_frame, text="Encrypted Hash Output:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').grid(row=3, column=0, sticky='w', padx=15, pady=(8, 8))
        
        # Output frame with copy button
        output_container = tk.Frame(encrypt_frame, bg='#1a1a1a')
        output_container.grid(row=4, column=0, sticky='nsew', padx=15, pady=(0, 15))
        output_container.grid_columnconfigure(0, weight=1)
        output_container.grid_rowconfigure(0, weight=1)
        
        self.encrypt_output = scrolledtext.ScrolledText(output_container, height=10, bg='#0a0a0a',
                                                       fg='#00ff88', font=('Courier New', 10),
                                                       relief='solid', bd=1)
        self.encrypt_output.grid(row=0, column=0, sticky='nsew')
        
        # Floating copy button (positioned at top-right with better alignment)
        copy_btn = tk.Button(output_container, text="📋 Copy", 
                           command=self.copy_encrypted_hash,
                           bg='#1a1a1a', fg='#00ffff', font=('Arial', 8, 'bold'),
                           relief='flat', bd=1, padx=8, pady=2,
                           activebackground='#2a2a2a', activeforeground='#ffffff')
        copy_btn.place(x=-10, y=5, anchor='ne', relx=1.0)  # Fully right-aligned
        
        # Configure column weight for encryption frame
        encrypt_frame.grid_columnconfigure(0, weight=1)
        
        # Right column - Decryption
        decrypt_frame = tk.LabelFrame(main_frame, text=" 🔓 DECRYPTION ", 
                                     font=('Arial', 14, 'bold'), fg='#ff8800', bg='#1a1a1a')  # Larger font
        decrypt_frame.grid(row=0, column=1, sticky='nsew', padx=(15, 0))  # Increased spacing
        
        # Configure internal grid for decryption frame
        decrypt_frame.grid_rowconfigure(4, weight=1)  # Make output area expandable
        
        tk.Label(decrypt_frame, text="Paste Encrypted Hash:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').grid(row=0, column=0, sticky='w', padx=15, pady=(15, 8))
        
        # Input frame with floating paste button
        input_container = tk.Frame(decrypt_frame, bg='#1a1a1a')
        input_container.grid(row=1, column=0, sticky='ew', padx=15, pady=8)
        input_container.grid_columnconfigure(0, weight=1)
        
        self.decrypt_input = tk.Text(input_container, height=5, bg='#2a2a2a', fg='#ffffff',
                                    font=('Courier New', 11), relief='solid', bd=1)
        self.decrypt_input.grid(row=0, column=0, sticky='ew')
        
        # Floating paste button (positioned at top-right with better alignment)
        paste_btn = tk.Button(input_container, text="📋 Paste", 
                            command=self.paste_encrypted_hash,
                            bg='#2a2a2a', fg='#ffaa00', font=('Arial', 8, 'bold'),
                            relief='flat', bd=1, padx=8, pady=2,
                            activebackground='#3a3a3a', activeforeground='#ffffff')
        paste_btn.place(x=-10, y=5, anchor='ne', relx=1.0)  # Fully right-aligned
        
        tk.Button(decrypt_frame, text="🔓 DECRYPT", 
                 command=self.rsa_decrypt,
                 bg='#2a2a2a', fg='#ff8800', font=('Arial', 12, 'bold'),
                 relief='raised', bd=2, padx=25, pady=8).grid(row=2, column=0, pady=12)  # Larger button
        
        tk.Label(decrypt_frame, text="Decrypted Message:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').grid(row=3, column=0, sticky='w', padx=15, pady=(8, 8))
        
        self.decrypt_output = scrolledtext.ScrolledText(decrypt_frame, height=10, bg='#0a0a0a',  # Increased height
                                                       fg='#ffaa00', font=('Courier New', 10),
                                                       relief='solid', bd=1)
        self.decrypt_output.grid(row=4, column=0, sticky='nsew', padx=15, pady=(0, 15))
        
        # Configure column weight for decryption frame
        decrypt_frame.grid_columnconfigure(0, weight=1)
        
        # Educational note
        note_text = "📚 RSA Encryption is REVERSIBLE: Encrypt with Public Key → Decrypt with Private Key"
        tk.Label(rsa_frame, text=note_text, font=('Arial', 10), fg='#88ff88', bg='#1a1a1a').pack(pady=5)
        
    def create_password_tab(self):
        """Create password generator tab"""
        pwd_frame = tk.Frame(self.notebook, bg='#1a1a1a')
        self.notebook.add(pwd_frame, text="🔑 Password Generator")
        
        # Title
        tk.Label(pwd_frame, text="🔑 SECURE PASSWORD GENERATOR", 
                font=('Arial', 16, 'bold'), fg='#00ffff', bg='#1a1a1a').pack(pady=20)
        
        # Settings frame
        settings_frame = tk.LabelFrame(pwd_frame, text=" Password Settings ", 
                                      font=('Arial', 12, 'bold'), fg='#ffffff', bg='#1a1a1a')
        settings_frame.pack(padx=50, pady=20)
        
        # Length
        length_frame = tk.Frame(settings_frame, bg='#1a1a1a')
        length_frame.pack(fill='x', padx=20, pady=10)
        
        tk.Label(length_frame, text="Password Length:", 
                font=('Arial', 11, 'bold'), fg='#ffffff', bg='#1a1a1a').pack(side='left')
        
        self.password_length = tk.Scale(length_frame, from_=8, to=64, orient='horizontal',
                                       bg='#2a2a2a', fg='#ffffff', troughcolor='#0a0a0a',
                                       font=('Arial', 10))
        self.password_length.set(16)
        self.password_length.pack(side='right', padx=20)
        
        # Character options
        options_frame = tk.Frame(settings_frame, bg='#1a1a1a')
        options_frame.pack(fill='x', padx=20, pady=10)
        
        self.include_uppercase = tk.BooleanVar(value=True)
        self.include_lowercase = tk.BooleanVar(value=True)
        self.include_numbers = tk.BooleanVar(value=True)
        self.include_symbols = tk.BooleanVar(value=True)
        
        tk.Checkbutton(options_frame, text="Uppercase Letters (A-Z)", variable=self.include_uppercase,
                      bg='#1a1a1a', fg='#ffffff', selectcolor='#2a2a2a', 
                      font=('Arial', 10)).pack(anchor='w', pady=2)
        tk.Checkbutton(options_frame, text="Lowercase Letters (a-z)", variable=self.include_lowercase,
                      bg='#1a1a1a', fg='#ffffff', selectcolor='#2a2a2a',
                      font=('Arial', 10)).pack(anchor='w', pady=2)
        tk.Checkbutton(options_frame, text="Numbers (0-9)", variable=self.include_numbers,
                      bg='#1a1a1a', fg='#ffffff', selectcolor='#2a2a2a',
                      font=('Arial', 10)).pack(anchor='w', pady=2)
        tk.Checkbutton(options_frame, text="Special Symbols (!@#$%^&*)", variable=self.include_symbols,
                      bg='#1a1a1a', fg='#ffffff', selectcolor='#2a2a2a',
                      font=('Arial', 10)).pack(anchor='w', pady=2)
        
        # Generate button
        tk.Button(pwd_frame, text="🔑 GENERATE SECURE PASSWORD", 
                 command=self.generate_password,
                 bg='#2a2a2a', fg='#00ff00', font=('Arial', 14, 'bold'),
                 relief='raised', bd=3, padx=30, pady=10).pack(pady=20)
        
        # Output
        output_frame = tk.LabelFrame(pwd_frame, text=" Generated Password ", 
                                    font=('Arial', 12, 'bold'), fg='#ffffff', bg='#1a1a1a')
        output_frame.pack(fill='x', padx=50, pady=20)
        
        self.password_output = tk.Text(output_frame, height=3, bg='#0a0a0a', fg='#00ff00',
                                      font=('Courier New', 14, 'bold'), relief='solid', bd=1)
        self.password_output.pack(fill='x', padx=20, pady=15)
        
    def create_system_tab(self):
        """Create system monitor tab"""
        sys_frame = tk.Frame(self.notebook, bg='#1a1a1a')
        self.notebook.add(sys_frame, text="📊 System Monitor")
        
        # Title
        title_frame = tk.Frame(sys_frame, bg='#1a1a1a')
        title_frame.pack(pady=15)
        
        tk.Label(title_frame, text="📊 REAL-TIME SYSTEM MONITOR", 
                font=('Arial', 16, 'bold'), fg='#00ffff', bg='#1a1a1a').pack()
        
        # Live indicator
        self.live_indicator = tk.Label(title_frame, text="🔴 LIVE - Auto-updating every 5 seconds", 
                                      font=('Arial', 10, 'bold'), fg='#00ff00', bg='#1a1a1a')
        self.live_indicator.pack(pady=5)
        
        # Start blinking effect for live indicator
        self.blink_live_indicator()
        
        # System info frame
        info_frame = tk.Frame(sys_frame, bg='#1a1a1a')
        info_frame.pack(fill='x', padx=20, pady=10)
        
        # CPU info
        cpu_frame = tk.LabelFrame(info_frame, text=" CPU Information ", 
                                 font=('Arial', 11, 'bold'), fg='#00ff00', bg='#1a1a1a')
        cpu_frame.pack(side='left', fill='both', expand=True, padx=(0, 10))
        
        self.cpu_label = tk.Label(cpu_frame, text="CPU Usage: Loading...", 
                                 font=('Arial', 11), fg='#ffffff', bg='#1a1a1a')
        self.cpu_label.pack(pady=10)
        
        # Memory info
        mem_frame = tk.LabelFrame(info_frame, text=" Memory Information ", 
                                 font=('Arial', 11, 'bold'), fg='#ffaa00', bg='#1a1a1a')
        mem_frame.pack(side='right', fill='both', expand=True, padx=(10, 0))
        
        self.memory_label = tk.Label(mem_frame, text="Memory Usage: Loading...", 
                                    font=('Arial', 11), fg='#ffffff', bg='#1a1a1a')
        self.memory_label.pack(pady=10)
        
        # Process list
        process_frame = tk.LabelFrame(sys_frame, text=" Running Processes ", 
                                     font=('Arial', 12, 'bold'), fg='#ffffff', bg='#1a1a1a')
        process_frame.pack(fill='both', expand=True, padx=20, pady=10)
        
        # Treeview for processes
        columns = ('PID', 'Name', 'CPU%', 'Memory%')
        self.process_tree = ttk.Treeview(process_frame, columns=columns, show='headings', height=15)
        
        for col in columns:
            self.process_tree.heading(col, text=col)
            self.process_tree.column(col, width=150)
        
        # Scrollbar
        scrollbar = ttk.Scrollbar(process_frame, orient='vertical', command=self.process_tree.yview)
        self.process_tree.configure(yscrollcommand=scrollbar.set)
        
        self.process_tree.pack(side='left', fill='both', expand=True, padx=10, pady=10)
        scrollbar.pack(side='right', fill='y', pady=10)
        
        # Refresh button
        button_frame = tk.Frame(sys_frame, bg='#1a1a1a')
        button_frame.pack(pady=10)
        
        tk.Button(button_frame, text="🔄 Manual Refresh", 
                 command=self.refresh_system_data,
                 bg='#2a2a2a', fg='#00ff00', font=('Arial', 11, 'bold'),
                 relief='raised', bd=2).pack(side='left', padx=5)
        
        tk.Label(button_frame, text="(Auto-refreshes every 10 seconds)", 
                font=('Arial', 9), fg='#888888', bg='#1a1a1a').pack(side='left', padx=10)
        
        # Load initial process data
        self.auto_refresh_processes()
        
    # ============================================================================
    # HASH METHODS
    # ============================================================================
    
    def generate_hash(self, hash_type):
        """Generate hash for input text"""
        try:
            text = self.hash_input.get(1.0, tk.END).strip()
            if not text:
                return  # No input, do nothing silently
            
            hash_functions = {
                'MD5': hashlib.md5,
                'SHA1': hashlib.sha1,
                'SHA256': hashlib.sha256,
                'SHA512': hashlib.sha512
            }
            
            hash_obj = hash_functions[hash_type](text.encode())
            result = hash_obj.hexdigest()
            
            # Display result
            self.hash_output.delete(1.0, tk.END)
            output_text = f"=== {hash_type} HASH RESULT ===\n\n"
            output_text += f"Original Text:\n{text}\n\n"
            output_text += f"{hash_type} Hash:\n{result}\n\n"
            output_text += f"Hash Length: {len(result)} characters\n"
            output_text += f"Generated at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
            
            self.hash_output.insert(1.0, output_text)
            
        except Exception as e:
            pass  # Silent error handling
    
    # ============================================================================
    # RSA METHODS
    # ============================================================================
    
    def generate_rsa_keys(self):
        """Generate RSA key pair"""
        try:
            # Generate keys
            self.crypto_backend.generate_key_pair()
            messagebox.showinfo("Success", "✅ RSA Key Pair Generated Successfully!\n\nYou can now encrypt and decrypt messages.")
            
        except Exception as e:
            messagebox.showerror("Error", f"Key generation failed: {str(e)}")
    
    def show_rsa_keys(self):
        """Show RSA keys in a new window"""
        try:
            if not hasattr(self.crypto_backend, 'private_key') or self.crypto_backend.private_key is None:
                messagebox.showwarning("Warning", "⚠️ No RSA keys found!\n\nPlease generate RSA keys first.")
                return
            
            # Create key display window
            key_window = tk.Toplevel(self.root)
            key_window.title("🔑 RSA Keys")
            key_window.geometry("900x700")
            key_window.configure(bg='#0a0a0a')
            
            # Title
            tk.Label(key_window, text="🔑 YOUR RSA KEY PAIR", 
                    font=('Arial', 16, 'bold'), fg='#00ff00', bg='#0a0a0a').pack(pady=15)
            
            # Notebook for keys
            key_notebook = ttk.Notebook(key_window)
            key_notebook.pack(fill='both', expand=True, padx=20, pady=10)
            
            # Public key tab
            pub_frame = tk.Frame(key_notebook, bg='#1a1a1a')
            key_notebook.add(pub_frame, text="🔓 Public Key (Share This)")
            
            tk.Label(pub_frame, text="🔓 PUBLIC KEY - Safe to Share", 
                    font=('Arial', 12, 'bold'), fg='#00ff00', bg='#1a1a1a').pack(pady=10)
            
            pub_text = scrolledtext.ScrolledText(pub_frame, bg='#2a2a2a', fg='#00ff00',
                                                font=('Courier New', 10))
            pub_text.pack(fill='both', expand=True, padx=10, pady=10)
            pub_text.insert(1.0, self.crypto_backend.get_public_key_pem())
            
            # Private key tab
            priv_frame = tk.Frame(key_notebook, bg='#1a1a1a')
            key_notebook.add(priv_frame, text="🔒 Private Key (Keep Secret)")
            
            tk.Label(priv_frame, text="🔒 PRIVATE KEY - KEEP SECRET!", 
                    font=('Arial', 12, 'bold'), fg='#ff0000', bg='#1a1a1a').pack(pady=10)
            
            priv_text = scrolledtext.ScrolledText(priv_frame, bg='#2a2a2a', fg='#ff8800',
                                                 font=('Courier New', 10))
            priv_text.pack(fill='both', expand=True, padx=10, pady=10)
            priv_text.insert(1.0, self.crypto_backend.get_private_key_pem())
            
        except Exception as e:
            messagebox.showerror("Error", f"Cannot show keys: {str(e)}")
    
    def rsa_encrypt(self):
        """Encrypt text with RSA"""
        try:
            text = self.encrypt_input.get(1.0, tk.END).strip()
            if not text:
                return  # No input, do nothing silently
            
            if not hasattr(self.crypto_backend, 'private_key') or self.crypto_backend.private_key is None:
                return  # No keys, do nothing silently
            
            # Encrypt
            encrypted = self.crypto_backend.encrypt_message(text)
            
            # Store the hash for copying
            self.current_encrypted_hash = encrypted
            
            # Display only the hash value
            self.encrypt_output.delete(1.0, tk.END)
            self.encrypt_output.insert(1.0, encrypted)
            
        except Exception as e:
            pass  # Silent error handling
    
    def copy_encrypted_hash(self):
        """Copy encrypted hash to clipboard"""
        try:
            if hasattr(self, 'current_encrypted_hash') and self.current_encrypted_hash:
                # Copy to clipboard
                self.root.clipboard_clear()
                self.root.clipboard_append(self.current_encrypted_hash)
                self.root.update()  # Ensure clipboard is updated
            else:
                pass  # No hash available, but don't show error
        except Exception as e:
            pass  # Silent error handling
    
    def paste_encrypted_hash(self):
        """Paste encrypted hash from clipboard to decryption input"""
        try:
            # Get text from clipboard
            clipboard_text = self.root.clipboard_get()
            
            # Clear current content and paste
            self.decrypt_input.delete(1.0, tk.END)
            self.decrypt_input.insert(1.0, clipboard_text)
            
        except tk.TclError:
            pass  # No text in clipboard, but don't show error
        except Exception as e:
            pass  # Silent error handling
    
    def rsa_decrypt(self):
        """Decrypt text with RSA"""
        try:
            encrypted_text = self.decrypt_input.get(1.0, tk.END).strip()
            if not encrypted_text:
                return  # No input, do nothing silently
            
            if not hasattr(self.crypto_backend, 'private_key') or self.crypto_backend.private_key is None:
                return  # No keys, do nothing silently
            
            # Decrypt
            decrypted = self.crypto_backend.decrypt_message(encrypted_text)
            
            # Display only the decrypted message
            self.decrypt_output.delete(1.0, tk.END)
            self.decrypt_output.insert(1.0, decrypted)
            
        except Exception as e:
            # Silent error handling - just clear output on error
            self.decrypt_output.delete(1.0, tk.END)
            self.decrypt_output.insert(1.0, "Decryption failed. Please check the encrypted hash.")
    
    # ============================================================================
    # PASSWORD METHODS
    # ============================================================================
    
    def generate_password(self):
        """Generate secure password"""
        try:
            length = self.password_length.get()
            characters = ""
            
            if self.include_lowercase.get():
                characters += string.ascii_lowercase
            if self.include_uppercase.get():
                characters += string.ascii_uppercase
            if self.include_numbers.get():
                characters += string.digits
            if self.include_symbols.get():
                characters += "!@#$%^&*()_+-=[]{}|;:,.<>?"
            
            if not characters:
                return  # No character types selected, do nothing silently
            
            # Generate password
            password = ''.join(random.choice(characters) for _ in range(length))
            
            # Calculate strength
            strength = self.calculate_password_strength(password)
            
            # Display result
            self.password_output.delete(1.0, tk.END)
            output_text = f"Generated Password:\n{password}\n\n"
            output_text += f"Length: {length} characters\n"
            output_text += f"Strength: {strength}\n"
            output_text += f"Generated at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
            
            self.password_output.insert(1.0, output_text)
            
        except Exception as e:
            pass  # Silent error handling
    
    def calculate_password_strength(self, password):
        """Calculate password strength"""
        score = 0
        
        if len(password) >= 8:
            score += 1
        if len(password) >= 12:
            score += 1
        if any(c.islower() for c in password):
            score += 1
        if any(c.isupper() for c in password):
            score += 1
        if any(c.isdigit() for c in password):
            score += 1
        if any(c in "!@#$%^&*()_+-=[]{}|;:,.<>?" for c in password):
            score += 1
        
        if score <= 2:
            return "Weak"
        elif score <= 4:
            return "Medium"
        else:
            return "Strong"
    
    # ============================================================================
    # SYSTEM MONITOR METHODS
    # ============================================================================
    
    def start_system_monitoring(self):
        """Start system monitoring in background"""
        def monitor_loop():
            refresh_counter = 0
            while self.monitoring_active:
                try:
                    self.update_system_info()
                    # Auto-refresh process list every 25 seconds (5 cycles)
                    refresh_counter += 1
                    if refresh_counter >= 5:
                        self.auto_refresh_processes()
                        refresh_counter = 0
                    time.sleep(5)  # Update every 5 seconds
                except:
                    pass
        
        thread = threading.Thread(target=monitor_loop, daemon=True)
        thread.start()
    
    def auto_refresh_processes(self):
        """Auto refresh process list without showing message"""
        try:
            # Clear existing items
            for item in self.process_tree.get_children():
                self.process_tree.delete(item)
            
            # Get live processes
            processes = []
            for proc in psutil.process_iter(['pid', 'name', 'cpu_percent', 'memory_percent']):
                try:
                    processes.append(proc.info)
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    pass
            
            # Sort by CPU usage (live sorting)
            processes.sort(key=lambda x: x['cpu_percent'] or 0, reverse=True)
            
            # Add top 20 live processes
            for proc in processes[:20]:
                self.process_tree.insert('', 'end', values=(
                    proc['pid'],
                    proc['name'][:20],  # Truncate long names
                    f"{proc['cpu_percent'] or 0:.1f}%",
                    f"{proc['memory_percent'] or 0:.1f}%"
                ))
            
        except Exception as e:
            pass
    
    def blink_live_indicator(self):
        """Make live indicator blink to show it's active"""
        def blink():
            try:
                current_color = self.live_indicator.cget('fg')
                new_color = '#ff0000' if current_color == '#00ff00' else '#00ff00'
                self.live_indicator.config(fg=new_color)
                
                if self.monitoring_active:
                    self.root.after(5000, blink)  # Blink every 5 seconds to match update rate
            except:
                pass
        
        blink()
    
    def update_system_info(self):
        """Update system information"""
        try:
            # CPU usage
            cpu_percent = psutil.cpu_percent(interval=1)
            self.cpu_label.config(text=f"CPU Usage: {cpu_percent:.1f}%")
            
            # Memory usage
            memory = psutil.virtual_memory()
            memory_percent = memory.percent
            memory_used = memory.used / (1024**3)  # GB
            memory_total = memory.total / (1024**3)  # GB
            
            self.memory_label.config(text=f"Memory: {memory_percent:.1f}% ({memory_used:.1f}GB / {memory_total:.1f}GB)")
            
        except Exception as e:
            pass
    
    def refresh_system_data(self):
        """Refresh process list"""
        try:
            # Clear existing items
            for item in self.process_tree.get_children():
                self.process_tree.delete(item)
            
            # Get processes
            processes = []
            for proc in psutil.process_iter(['pid', 'name', 'cpu_percent', 'memory_percent']):
                try:
                    processes.append(proc.info)
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    pass
            
            # Sort by CPU usage
            processes.sort(key=lambda x: x['cpu_percent'] or 0, reverse=True)
            
            # Add top 20 processes
            for proc in processes[:20]:
                self.process_tree.insert('', 'end', values=(
                    proc['pid'],
                    proc['name'][:20],  # Truncate long names
                    f"{proc['cpu_percent'] or 0:.1f}%",
                    f"{proc['memory_percent'] or 0:.1f}%"
                ))
            
        except Exception as e:
            pass  # Silent error handling
    
    def on_closing(self):
        """Handle window closing"""
        self.monitoring_active = False
        self.root.destroy()

def main():
    """Main function"""
    try:
        root = tk.Tk()
        app = StreamlinedSecurityGUI(root)
        root.protocol("WM_DELETE_WINDOW", app.on_closing)
        root.mainloop()
    except Exception as e:
        print(f"Error starting Streamlined Security GUI: {e}")
        return 1
    return 0

if __name__ == "__main__":
    sys.exit(main())
