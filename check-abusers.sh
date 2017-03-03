#  Clément Provenier le 20.02.2017
adminmail=root
date=$(date "+%Y-%m-%d %H:%M:%S")
# Maximum load-average
maxload=15

# --------------------------------------

for ctid in $(/usr/sbin/vzlist -Ho ctid);do
# Whitelist
#if [ "$ctid" == "860780" ] || [ "$ctid" == "99992233" ];then
#            continue
#fi

# On recupere le load
vmload=$(/usr/sbin/vzlist -Ho ctid,laverage | grep $ctid | awk '{print $2}' | cut -c-5 | tr -d /)
# on arrondie
vmload=$(printf "%.0f" $vmload)

# Si le load est plus gros que maxload
if [ "$vmload" -gt "$maxload" ];then

               echo "$ctid Load average > a 15"

# On recup l'ip du container
                vmip=$(/usr/sbin/vzlist -Ho ctid,ip | grep $ctid | awk '{print $2}')
                mkdir /root/VmLoad
                mkdir /root/VmLoad/$ctid
                /usr/sbin/vzctl exec $ctid ps auxf > /root/VmLoad/$ctid/high_load_processes

                echo "Reboot du vps-$ctid ..."
                /usr/sbin/vzctl restart $ctid --force
		file=/root/VmLoad/reboot.log
		if [ -f "$file" ]
			then
			echo "$file found."
		else
		touch /root/VmLoad/reboot.log
		fi

                echo " VPS-$ctid rebooté le $date pour load average supérieure à $maxload" >> /root/VmLoad/reboot.log
fi
# end of one VMs load check
done
