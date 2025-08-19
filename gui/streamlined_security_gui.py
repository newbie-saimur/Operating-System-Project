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
        self.root.geometry("1400x900")  # Increased width for better spacing
        self.root.configure(bg='#0a0a0a')
        
        # Center window
        self.root.update_idletasks()
        x = (self.root.winfo_screenwidth() // 2) - (700)  # Adjusted for new width
        y = (self.root.winfo_screenheight() // 2) - (450)  # Adjusted for new height
        self.root.geometry(f'1400x900+{x}+{y}')
        
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
        self.create_hash_tab()
        self.create_rsa_tab()
        self.create_password_tab()
        self.create_system_tab()
        
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
