#!/bin/bash
# Honeypot User Data Script
apt-get update
apt-get install -y python3 python3-pip fail2ban

# Install and configure Cowrie honeypot
pip3 install cowrie

# Create a basic Python script to monitor SSH attempts
cat > /opt/monitor_ssh.py << 'EOF'
#!/usr/bin/env python3
import subprocess
import json
import time
from datetime import datetime

def get_ssh_attempts():
    try:
        # Check auth.log for SSH attempts
        result = subprocess.run(['grep', 'sshd', '/var/log/auth.log'], 
                              capture_output=True, text=True)
        lines = result.stdout.split('\n')
        failed_attempts = [line for line in lines if 'Failed password' in line]
        
        return {
            'timestamp': datetime.now().isoformat(),
            'total_attempts': len(failed_attempts),
            'recent_attempts': failed_attempts[-5:] if failed_attempts else []
        }
    except Exception as e:
        return {'error': str(e)}

if __name__ == "__main__":
    while True:
        data = get_ssh_attempts()
        print(json.dumps(data))
        time.sleep(60)
EOF

chmod +x /opt/monitor_ssh.py

# Start the monitoring script
nohup python3 /opt/monitor_ssh.py > /var/log/ssh_monitor.log 2>&1 &

# Install nginx for basic web server (for our dashboard later)
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

echo "Honeypot setup complete!"
