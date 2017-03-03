## OpenVZ-checkabusers.sh
OpenVZ script check load average abusers

# Usage:
` echo "5 *     * * *   root sh /root/vmsuspender.sh >/dev/null 2>&1" >> /etc/crontab `

# Reporting
/root/VmLoad/reboot.log

# Report Process
/root/VmLoad/$ctid/high_load_processes


