<snippet>
  <content><![CDATA[
# ${1:Check high load average on OpenVZ CT}
# OpenVZ-checkabusers.sh
OpenVZ script check load average abusers

# Usage:
` echo "5 *     * * *   root sh /root/vmsuspender.sh >/dev/null 2>&1" >> /etc/crontab `

# Reporting
/root/VmLoad/reboot.log

# Report Process
/root/VmLoad/$ctid/high_load_processes

]]></content>
  <tabTrigger>readme</tabTrigger>
</snippet>
