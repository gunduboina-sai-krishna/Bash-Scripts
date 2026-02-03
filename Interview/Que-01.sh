# Check service status if running - exit code will be 0  
# If not active → return exit code will be 1 then restart 
# if restart not working exit code will be 2 
# Log action in monitor.log

#!/bin/bash

SERVICE = nginx
LOG_FILE = /var/log/monitor.log

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOGFILE
}

systemctl is-active --quite $SERVICE
STATUS_CODE = $?

if [ $STATUS_CODE -eq 0 ]; then
    log "$SERVICE is running fine"
    echo "service is healthy"
    exit 0

else 
    log "$SERVICE is down, restart needed..."
    systemctl restart $SERVICE

    sleep 3 

    systemctl is-active --quite $SERVICE
    STATUS_CODE_AFTER = $?

    if [ $STATUS_CODE_AFTER -eq 0 ]; then
        log "$SERVICE restarted successfully."
        echo "Restart successful"
        exit 1

    else
        log "CRITICAL: $SERVICE failed to restart!"
        echo "Restart failed"
        exit 2
    fi    

fi            
