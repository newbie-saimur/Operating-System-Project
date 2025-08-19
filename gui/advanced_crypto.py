#!/usr/bin/env python3

"""
Advanced Cryptographic Functions
- RSA Public/Private Key Encryption
- Digital Signatures
- Hash Functions (one-way)
- Symmetric Encryption (AES)
"""

import hashlib
import base64
import os
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext

from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.fernet import Fernet
from cryptography.exceptions import InvalidSignature

class CryptoBackend:
    """Backend crypto operations without GUI"""
    def __init__(self):
        self.private_key = None
        self.public_key = None
    
    def generate_key_pair(self, key_size=2048):
        """Generate RSA key pair"""
        try:
            self.private_key = rsa.generate_private_key(
                public_exponent=65537,
                key_size=key_size
            )
            self.public_key = self.private_key.public_key()
            return True
        except Exception as e:
            raise Exception(f"Key generation failed: {str(e)}")
    
    def get_public_key_pem(self):
        """Get public key in PEM format"""
        if not self.public_key:
            raise Exception("No public key available")
        
        pem = self.public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        )
        return pem.decode('utf-8')
    
    def get_private_key_pem(self):
        """Get private key in PEM format"""
        if not self.private_key:
            raise Exception("No private key available")
        
        pem = self.private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        )
        return pem.decode('utf-8')
    
    def encrypt_message(self, message):
        """Encrypt message with public key"""
        if not self.public_key:
            raise Exception("No public key available")
        
        message_bytes = message.encode('utf-8')
        encrypted = self.public_key.encrypt(
            message_bytes,
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )
        return base64.b64encode(encrypted).decode('utf-8')
    
    def decrypt_message(self, encrypted_message):
        """Decrypt message with private key"""
        if not self.private_key:
            raise Exception("No private key available")
        
        encrypted_bytes = base64.b64decode(encrypted_message.encode('utf-8'))
        decrypted = self.private_key.decrypt(
            encrypted_bytes,
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )
        return decrypted.decode('utf-8')
    
    def sign_message(self, message):
        """Sign message with private key"""
        if not self.private_key:
            raise Exception("No private key available")
        
        message_bytes = message.encode('utf-8')
        signature = self.private_key.sign(
            message_bytes,
            padding.PSS(
                mgf=padding.MGF1(hashes.SHA256()),
                salt_length=padding.PSS.MAX_LENGTH
            ),
            hashes.SHA256()
        )
        return base64.b64encode(signature).decode('utf-8')
    
    def verify_signature(self, message, signature):
        """Verify signature with public key"""
        if not self.public_key:
            raise Exception("No public key available")
        
        try:
            message_bytes = message.encode('utf-8')
            signature_bytes = base64.b64decode(signature.encode('utf-8'))
            
            self.public_key.verify(
                signature_bytes,
                message_bytes,
                padding.PSS(
                    mgf=padding.MGF1(hashes.SHA256()),
                    salt_length=padding.PSS.MAX_LENGTH
                ),
                hashes.SHA256()
            )
            return True
        except InvalidSignature:
            return False
        except Exception:
            return False

class AdvancedCryptoGUI:
    def __init__(self, parent):
        self.parent = parent
        self.private_key = None
        self.public_key = None
        self.setup_ui()
        
    def setup_ui(self):
        # Main frame
        main_frame = ttk.Frame(self.parent)
        main_frame.pack(fill='both', expand=True, padx=10, pady=10)
        
        # Title
        title_label = tk.Label(main_frame, text="🔐 ADVANCED CRYPTOGRAPHY CENTER", 
                              font=('Arial', 16, 'bold'), fg='#00ff00', bg='black')
        title_label.pack(pady=(0, 20))
        
        # Notebook for tabs
        notebook = ttk.Notebook(main_frame)
        notebook.pack(fill='both', expand=True)
        
        # Tab 1: RSA Encryption/Decryption
        self.create_rsa_tab(notebook)
        
        # Tab 2: Digital Signatures
        self.create_signature_tab(notebook)
        
        # Tab 3: Hash Functions (One-way)
        self.create_hash_tab(notebook)
        
        # Tab 4: Symmetric Encryption
        self.create_symmetric_tab(notebook)
        
    def create_rsa_tab(self, notebook):
        """RSA Public/Private Key Encryption"""
        rsa_frame = ttk.Frame(notebook)
        notebook.add(rsa_frame, text="🔑 RSA Encryption")
        
        # Key Generation
        key_frame = ttk.LabelFrame(rsa_frame, text="🔑 Key Generation")
        key_frame.pack(fill='x', padx=10, pady=5)
        
        ttk.Button(key_frame, text="Generate RSA Key Pair", 
                  command=self.generate_rsa_keys).pack(pady=5)
        
        # Key display
        self.key_display = scrolledtext.ScrolledText(key_frame, height=8, width=80)
        self.key_display.pack(fill='both', expand=True, padx=5, pady=5)
        
        # Encryption
        encrypt_frame = ttk.LabelFrame(rsa_frame, text="🔒 Encryption")
        encrypt_frame.pack(fill='x', padx=10, pady=5)
        
        tk.Label(encrypt_frame, text="Message to Encrypt:").pack(anchor='w')
        self.rsa_message_entry = tk.Text(encrypt_frame, height=3, width=60)
        self.rsa_message_entry.pack(fill='x', padx=5, pady=2)
        
        button_frame = tk.Frame(encrypt_frame)
        button_frame.pack(pady=5)
        
        ttk.Button(button_frame, text="Encrypt with Public Key", 
                  command=lambda: self.rsa_encrypt('public')).pack(side='left', padx=5)
        ttk.Button(button_frame, text="Encrypt with Private Key", 
                  command=lambda: self.rsa_encrypt('private')).pack(side='left', padx=5)
        
        # Decryption
        decrypt_frame = ttk.LabelFrame(rsa_frame, text="🔓 Decryption")
        decrypt_frame.pack(fill='both', expand=True, padx=10, pady=5)
        
        tk.Label(decrypt_frame, text="Encrypted Data (Base64):").pack(anchor='w')
        self.rsa_encrypted_entry = scrolledtext.ScrolledText(decrypt_frame, height=4)
        self.rsa_encrypted_entry.pack(fill='x', padx=5, pady=2)
        
        button_frame2 = tk.Frame(decrypt_frame)
        button_frame2.pack(pady=5)
        
        ttk.Button(button_frame2, text="Decrypt with Private Key", 
                  command=lambda: self.rsa_decrypt('private')).pack(side='left', padx=5)
        ttk.Button(button_frame2, text="Decrypt with Public Key", 
                  command=lambda: self.rsa_decrypt('public')).pack(side='left', padx=5)
        
        # Results
        tk.Label(decrypt_frame, text="Decrypted Message:").pack(anchor='w', pady=(10,0))
        self.rsa_result = scrolledtext.ScrolledText(decrypt_frame, height=4)
        self.rsa_result.pack(fill='both', expand=True, padx=5, pady=2)
        
    def create_signature_tab(self, notebook):
        """Digital Signatures"""
        sig_frame = ttk.Frame(notebook)
        notebook.add(sig_frame, text="✍️ Digital Signatures")
        
        # Sign message
        sign_frame = ttk.LabelFrame(sig_frame, text="✍️ Sign Message")
        sign_frame.pack(fill='x', padx=10, pady=5)
        
        tk.Label(sign_frame, text="Message to Sign:").pack(anchor='w')
        self.sign_message_entry = tk.Text(sign_frame, height=3)
        self.sign_message_entry.pack(fill='x', padx=5, pady=2)
        
        ttk.Button(sign_frame, text="Sign with Private Key", 
                  command=self.sign_message).pack(pady=5)
        
        tk.Label(sign_frame, text="Digital Signature:").pack(anchor='w', pady=(10,0))
        self.signature_display = scrolledtext.ScrolledText(sign_frame, height=4)
        self.signature_display.pack(fill='x', padx=5, pady=2)
        
        # Verify signature
        verify_frame = ttk.LabelFrame(sig_frame, text="✅ Verify Signature")
        verify_frame.pack(fill='both', expand=True, padx=10, pady=5)
        
        tk.Label(verify_frame, text="Original Message:").pack(anchor='w')
        self.verify_message_entry = tk.Text(verify_frame, height=3)
        self.verify_message_entry.pack(fill='x', padx=5, pady=2)
        
        tk.Label(verify_frame, text="Signature to Verify:").pack(anchor='w')
        self.verify_signature_entry = scrolledtext.ScrolledText(verify_frame, height=4)
        self.verify_signature_entry.pack(fill='x', padx=5, pady=2)
        
        ttk.Button(verify_frame, text="Verify Signature", 
                  command=self.verify_signature).pack(pady=5)
        
        self.verify_result = tk.Label(verify_frame, text="", font=('Arial', 12, 'bold'))
        self.verify_result.pack(pady=5)
        
    def create_hash_tab(self, notebook):
        """Hash Functions (One-way)"""
        hash_frame = ttk.Frame(notebook)
        notebook.add(hash_frame, text="# Hash Functions")
        
        info_frame = ttk.LabelFrame(hash_frame, text="ℹ️ Information")
        info_frame.pack(fill='x', padx=10, pady=5)
        
        info_text = """⚠️ IMPORTANT: Hash functions are ONE-WAY ONLY!
        
🔐 Hashes CANNOT be reversed to get original text
📊 Same input = same hash (deterministic)
🛡️ Used for: passwords, file integrity, digital fingerprints
💡 To "decrypt" a hash, you need to use rainbow tables or brute force"""
        
        tk.Label(info_frame, text=info_text, justify='left', fg='yellow').pack(padx=10, pady=5)
        
        # Hash input
        input_frame = ttk.LabelFrame(hash_frame, text="📝 Input Text")
        input_frame.pack(fill='x', padx=10, pady=5)
        
        self.hash_input = tk.Text(input_frame, height=4)
        self.hash_input.pack(fill='x', padx=5, pady=5)
        
        # Hash buttons
        button_frame = tk.Frame(hash_frame)
        button_frame.pack(pady=10)
        
        hash_types = ['MD5', 'SHA1', 'SHA256', 'SHA512']
        for hash_type in hash_types:
            ttk.Button(button_frame, text=f"Generate {hash_type}", 
                      command=lambda ht=hash_type: self.generate_hash(ht)).pack(side='left', padx=5)
        
        # Hash results
        result_frame = ttk.LabelFrame(hash_frame, text="🔍 Hash Results")
        result_frame.pack(fill='both', expand=True, padx=10, pady=5)
        
        self.hash_results = scrolledtext.ScrolledText(result_frame, height=10)
        self.hash_results.pack(fill='both', expand=True, padx=5, pady=5)
        
        # Hash cracking simulation
        crack_frame = ttk.LabelFrame(hash_frame, text="🔓 Hash Cracking Simulation")
        crack_frame.pack(fill='x', padx=10, pady=5)
        
        tk.Label(crack_frame, text="Hash to 'crack':").pack(anchor='w')
        self.crack_hash_entry = tk.Entry(crack_frame, width=60)
        self.crack_hash_entry.pack(fill='x', padx=5, pady=2)
        
        ttk.Button(crack_frame, text="Simulate Dictionary Attack", 
                  command=self.simulate_hash_crack).pack(pady=5)
        
        self.crack_result = tk.Label(crack_frame, text="", font=('Arial', 10))
        self.crack_result.pack(pady=2)
        
    def create_symmetric_tab(self, notebook):
        """Symmetric Encryption (AES)"""
        sym_frame = ttk.Frame(notebook)
        notebook.add(sym_frame, text="🔄 Symmetric Encryption")
        
        # Key generation
        key_frame = ttk.LabelFrame(sym_frame, text="🔑 Symmetric Key")
        key_frame.pack(fill='x', padx=10, pady=5)
        
        ttk.Button(key_frame, text="Generate AES Key", 
                  command=self.generate_aes_key).pack(pady=5)
        
        self.aes_key_display = tk.Entry(key_frame, width=60, state='readonly')
        self.aes_key_display.pack(fill='x', padx=5, pady=2)
        
        # Encryption
        encrypt_frame = ttk.LabelFrame(sym_frame, text="🔒 AES Encryption")
        encrypt_frame.pack(fill='x', padx=10, pady=5)
        
        tk.Label(encrypt_frame, text="Message:").pack(anchor='w')
        self.aes_message = tk.Text(encrypt_frame, height=3)
        self.aes_message.pack(fill='x', padx=5, pady=2)
        
        ttk.Button(encrypt_frame, text="Encrypt with AES", 
                  command=self.aes_encrypt).pack(pady=5)
        
        tk.Label(encrypt_frame, text="Encrypted (Base64):").pack(anchor='w')
        self.aes_encrypted = scrolledtext.ScrolledText(encrypt_frame, height=3)
        self.aes_encrypted.pack(fill='x', padx=5, pady=2)
        
        # Decryption
        decrypt_frame = ttk.LabelFrame(sym_frame, text="🔓 AES Decryption")
        decrypt_frame.pack(fill='both', expand=True, padx=10, pady=5)
        
        ttk.Button(decrypt_frame, text="Decrypt with AES", 
                  command=self.aes_decrypt).pack(pady=5)
        
        tk.Label(decrypt_frame, text="Decrypted Message:").pack(anchor='w')
        self.aes_decrypted = scrolledtext.ScrolledText(decrypt_frame, height=4)
        self.aes_decrypted.pack(fill='both', expand=True, padx=5, pady=2)
    
    # RSA Functions
    def generate_rsa_keys(self):
        try:
            # Generate private key
            self.private_key = rsa.generate_private_key(
                public_exponent=65537,
                key_size=2048,
            )
            self.public_key = self.private_key.public_key()
            
            # Serialize keys
            private_pem = self.private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption()
            )
            
            public_pem = self.public_key.public_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PublicFormat.SubjectPublicKeyInfo
            )
            
            # Display keys
            self.key_display.delete(1.0, tk.END)
            self.key_display.insert(tk.END, "🔑 RSA KEY PAIR GENERATED\n\n")
            self.key_display.insert(tk.END, "PRIVATE KEY:\n")
            self.key_display.insert(tk.END, private_pem.decode())
            self.key_display.insert(tk.END, "\n\nPUBLIC KEY:\n")
            self.key_display.insert(tk.END, public_pem.decode())
            
            messagebox.showinfo("Success", "RSA key pair generated successfully!")
            
        except Exception as e:
            messagebox.showerror("Error", f"Key generation failed: {str(e)}")
    
    def rsa_encrypt(self, key_type):
        if not self.private_key or not self.public_key:
            messagebox.showerror("Error", "Please generate RSA keys first!")
            return
            
        message = self.rsa_message_entry.get(1.0, tk.END).strip()
        if not message:
            messagebox.showerror("Error", "Please enter a message to encrypt!")
            return
            
        try:
            if key_type == 'public':
                # Encrypt with public key (normal encryption)
                encrypted = self.public_key.encrypt(
                    message.encode(),
                    padding.OAEP(
                        mgf=padding.MGF1(algorithm=hashes.SHA256()),
                        algorithm=hashes.SHA256(),
                        label=None
                    )
                )
            else:
                # "Encrypt" with private key (actually signing)
                signature = self.private_key.sign(
                    message.encode(),
                    padding.PSS(
                        mgf=padding.MGF1(hashes.SHA256()),
                        salt_length=padding.PSS.MAX_LENGTH
                    ),
                    hashes.SHA256()
                )
                encrypted = signature
            
            # Display encrypted data
            encrypted_b64 = base64.b64encode(encrypted).decode()
            self.rsa_encrypted_entry.delete(1.0, tk.END)
            self.rsa_encrypted_entry.insert(tk.END, encrypted_b64)
            
            messagebox.showinfo("Success", f"Message encrypted with {key_type} key!")
            
        except Exception as e:
            messagebox.showerror("Error", f"Encryption failed: {str(e)}")
    
    def rsa_decrypt(self, key_type):
        if not self.private_key or not self.public_key:
            messagebox.showerror("Error", "Please generate RSA keys first!")
            return
            
        encrypted_data = self.rsa_encrypted_entry.get(1.0, tk.END).strip()
        if not encrypted_data:
            messagebox.showerror("Error", "Please enter encrypted data!")
            return
            
        try:
            encrypted_bytes = base64.b64decode(encrypted_data)
            
            if key_type == 'private':
                # Decrypt with private key (normal decryption)
                decrypted = self.private_key.decrypt(
                    encrypted_bytes,
                    padding.OAEP(
                        mgf=padding.MGF1(algorithm=hashes.SHA256()),
                        algorithm=hashes.SHA256(),
                        label=None
                    )
                )
                message = decrypted.decode()
            else:
                # "Decrypt" with public key (verify signature)
                # This is more complex and requires the original message
                message = "⚠️ Public key 'decryption' requires signature verification"
            
            self.rsa_result.delete(1.0, tk.END)
            self.rsa_result.insert(tk.END, message)
            
            messagebox.showinfo("Success", f"Message decrypted with {key_type} key!")
            
        except Exception as e:
            messagebox.showerror("Error", f"Decryption failed: {str(e)}")
    
    # Digital Signature Functions
    def sign_message(self):
        if not self.private_key:
            messagebox.showerror("Error", "Please generate RSA keys first!")
            return
            
        message = self.sign_message_entry.get(1.0, tk.END).strip()
        if not message:
            messagebox.showerror("Error", "Please enter a message to sign!")
            return
            
        try:
            signature = self.private_key.sign(
                message.encode(),
                padding.PSS(
                    mgf=padding.MGF1(hashes.SHA256()),
                    salt_length=padding.PSS.MAX_LENGTH
                ),
                hashes.SHA256()
            )
            
            signature_b64 = base64.b64encode(signature).decode()
            self.signature_display.delete(1.0, tk.END)
            self.signature_display.insert(tk.END, signature_b64)
            
            messagebox.showinfo("Success", "Message signed successfully!")
            
        except Exception as e:
            messagebox.showerror("Error", f"Signing failed: {str(e)}")
    
    def verify_signature(self):
        if not self.public_key:
            messagebox.showerror("Error", "Please generate RSA keys first!")
            return
            
        message = self.verify_message_entry.get(1.0, tk.END).strip()
        signature_b64 = self.verify_signature_entry.get(1.0, tk.END).strip()
        
        if not message or not signature_b64:
            messagebox.showerror("Error", "Please enter both message and signature!")
            return
            
        try:
            signature = base64.b64decode(signature_b64)
            
            self.public_key.verify(
                signature,
                message.encode(),
                padding.PSS(
                    mgf=padding.MGF1(hashes.SHA256()),
                    salt_length=padding.PSS.MAX_LENGTH
                ),
                hashes.SHA256()
            )
            
            self.verify_result.config(text="✅ SIGNATURE VALID", fg="green")
            messagebox.showinfo("Success", "Signature is valid!")
            
        except Exception as e:
            self.verify_result.config(text="❌ SIGNATURE INVALID", fg="red")
            messagebox.showerror("Error", f"Signature verification failed: {str(e)}")
    
    # Hash Functions
    def generate_hash(self, hash_type):
        text = self.hash_input.get(1.0, tk.END).strip()
        if not text:
            messagebox.showerror("Error", "Please enter text to hash!")
            return
            
        try:
            if hash_type == 'MD5':
                hash_obj = hashlib.md5(text.encode())
            elif hash_type == 'SHA1':
                hash_obj = hashlib.sha1(text.encode())
            elif hash_type == 'SHA256':
                hash_obj = hashlib.sha256(text.encode())
            elif hash_type == 'SHA512':
                hash_obj = hashlib.sha512(text.encode())
            
            hash_value = hash_obj.hexdigest()
            
            self.hash_results.insert(tk.END, f"\n{hash_type} Hash:\n")
            self.hash_results.insert(tk.END, f"Input: {text}\n")
            self.hash_results.insert(tk.END, f"Hash:  {hash_value}\n")
            self.hash_results.insert(tk.END, "-" * 70 + "\n")
            self.hash_results.see(tk.END)
            
        except Exception as e:
            messagebox.showerror("Error", f"Hashing failed: {str(e)}")
    
    def simulate_hash_crack(self):
        hash_to_crack = self.crack_hash_entry.get().strip()
        if not hash_to_crack:
            messagebox.showerror("Error", "Please enter a hash to crack!")
            return
            
        # Simple dictionary attack simulation
        common_passwords = [
            "password", "123456", "admin", "root", "user", "test",
            "hello", "world", "linux", "security", "hash", "crack"
        ]
        
        self.crack_result.config(text="🔍 Searching...", fg="orange")
        self.parent.update()
        
        for password in common_passwords:
            # Try different hash types
            for hash_func, name in [(hashlib.md5, 'MD5'), (hashlib.sha1, 'SHA1'), 
                                   (hashlib.sha256, 'SHA256'), (hashlib.sha512, 'SHA512')]:
                if hash_func(password.encode()).hexdigest() == hash_to_crack.lower():
                    self.crack_result.config(text=f"✅ CRACKED! Password: '{password}' ({name})", fg="green")
                    return
        
        self.crack_result.config(text="❌ Hash not found in dictionary", fg="red")
    
    # AES Functions
    def generate_aes_key(self):
        self.aes_key = Fernet.generate_key()
        self.aes_cipher = Fernet(self.aes_key)
        
        self.aes_key_display.config(state='normal')
        self.aes_key_display.delete(0, tk.END)
        self.aes_key_display.insert(0, base64.b64encode(self.aes_key).decode())
        self.aes_key_display.config(state='readonly')
        
        messagebox.showinfo("Success", "AES key generated!")
    
    def aes_encrypt(self):
        if not hasattr(self, 'aes_cipher'):
            messagebox.showerror("Error", "Please generate AES key first!")
            return
            
        message = self.aes_message.get(1.0, tk.END).strip()
        if not message:
            messagebox.showerror("Error", "Please enter a message!")
            return
            
        try:
            encrypted = self.aes_cipher.encrypt(message.encode())
            encrypted_b64 = base64.b64encode(encrypted).decode()
            
            self.aes_encrypted.delete(1.0, tk.END)
            self.aes_encrypted.insert(tk.END, encrypted_b64)
            
            messagebox.showinfo("Success", "Message encrypted with AES!")
            
        except Exception as e:
            messagebox.showerror("Error", f"AES encryption failed: {str(e)}")
    
    def aes_decrypt(self):
        if not hasattr(self, 'aes_cipher'):
            messagebox.showerror("Error", "Please generate AES key first!")
            return
            
        encrypted_b64 = self.aes_encrypted.get(1.0, tk.END).strip()
        if not encrypted_b64:
            messagebox.showerror("Error", "No encrypted data to decrypt!")
            return
            
        try:
            encrypted = base64.b64decode(encrypted_b64)
            decrypted = self.aes_cipher.decrypt(encrypted)
            
            self.aes_decrypted.delete(1.0, tk.END)
            self.aes_decrypted.insert(tk.END, decrypted.decode())
            
            messagebox.showinfo("Success", "Message decrypted with AES!")
            
        except Exception as e:
            messagebox.showerror("Error", f"AES decryption failed: {str(e)}")

if __name__ == "__main__":
    root = tk.Tk()
    root.title("🔐 Advanced Cryptography Center")
    root.geometry("900x700")
    root.configure(bg='black')
    
    app = AdvancedCryptoGUI(root)
    root.mainloop()
