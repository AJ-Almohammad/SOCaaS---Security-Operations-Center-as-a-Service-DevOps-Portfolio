#!/usr/bin/env python3
"""
SOCaaS Security Analysis Script
Demonstrates Python scripting skills for security analysis
"""

import json
import boto3
import requests
from datetime import datetime, timedelta
import logging
import sys

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('/var/log/socaas_analysis.log'),
        logging.StreamHandler(sys.stdout)
    ]
)

class SecurityAnalyzer:
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        # Initialize AWS clients
        self.cloudwatch = boto3.client('cloudwatch')
        self.ec2 = boto3.client('ec2')
        
    def analyze_ssh_attempts(self, log_file='/var/log/ssh_monitor.log'):
        """Analyze SSH attempt patterns"""
        try:
            with open(log_file, 'r') as f:
                lines = f.readlines()
            
            analysis = {
                'total_attempts': len(lines),
                'time_period': 'last_24_hours',
                'peak_hours': {},
                'suspicious_patterns': []
            }
            
            # Simple pattern analysis
            hourly_attempts = {}
            for line in lines[-100:]:  # Last 100 entries
                if 'attempts' in line:
                    try:
                        timestamp_str = line.split(':')[0]
                        timestamp = datetime.fromisoformat(timestamp_str.replace('Z', '+00:00'))
                        hour = timestamp.hour
                        hourly_attempts[hour] = hourly_attempts.get(hour, 0) + 1
                    except Exception as e:
                        continue
            
            analysis['peak_hours'] = dict(sorted(hourly_attempts.items()))
            
            # Detect potential brute force
            if len(lines) > 50:
                analysis['suspicious_patterns'].append('High volume of SSH attempts - possible brute force attack')
            
            self.logger.info(f"SSH Analysis: {analysis['total_attempts']} total attempts")
            return analysis
            
        except FileNotFoundError:
            self.logger.warning("SSH log file not found")
            return {'error': 'Log file not found'}
    
    def generate_security_report(self):
        """Generate comprehensive security report"""
        report = {
            'timestamp': datetime.now().isoformat(),
            'ssh_analysis': self.analyze_ssh_attempts(),
            'recommendations': []
        }
        
        # Generate recommendations based on analysis
        ssh_data = report['ssh_analysis']
        if isinstance(ssh_data, dict) and ssh_data.get('total_attempts', 0) > 20:
            report['recommendations'].append('Consider implementing fail2ban for automated blocking')
            report['recommendations'].append('Review security group rules for unnecessary open ports')
        
        if isinstance(ssh_data, dict) and ssh_data.get('total_attempts', 0) > 100:
            report['recommendations'].append('HIGH PRIORITY: Investigate potential brute force attack')
        
        report['recommendations'].append('Enable CloudWatch logging for centralized monitoring')
        report['recommendations'].append('Implement AWS GuardDuty for threat detection')
        
        return report
    
    def export_to_dashboard(self, report):
        """Export analysis to dashboard format"""
        dashboard_data = {
            'metrics': {
                'ssh_attempts': report['ssh_analysis'].get('total_attempts', 0) if isinstance(report['ssh_analysis'], dict) else 0,
                'suspicious_patterns_count': len(report['ssh_analysis'].get('suspicious_patterns', [])) if isinstance(report['ssh_analysis'], dict) else 0,
                'recommendations_count': len(report.get('recommendations', []))
            },
            'alerts': report.get('recommendations', [])[:3],  # Top 3 recommendations as alerts
            'last_updated': report['timestamp']
        }
        
        # Save dashboard data
        with open('/var/www/html/security_data.json', 'w') as f:
            json.dump(dashboard_data, f, indent=2)
        
        self.logger.info("Dashboard data exported successfully")
        return dashboard_data

def main():
    """Main execution function"""
    analyzer = SecurityAnalyzer()
    
    try:
        # Generate security report
        report = analyzer.generate_security_report()
        
        # Export to dashboard
        dashboard_data = analyzer.export_to_dashboard(report)
        
        # Print summary
        print("🛡️ SOCaaS Security Analysis Complete")
        print(f"📊 SSH Attempts: {dashboard_data['metrics']['ssh_attempts']}")
        print(f"⚠️  Alerts: {len(dashboard_data['alerts'])}")
        print(f"🕒 Last Updated: {dashboard_data['last_updated']}")
        
        # Log full report
        analyzer.logger.info(f"Security Report: {json.dumps(report, indent=2)}")
        
    except Exception as e:
        analyzer.logger.error(f"Analysis failed: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    main()
