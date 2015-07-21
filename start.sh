#!/bin/bash
#
#         Startup script for the log_managerment
#
#
# chkconfig: 345 99 01
# description: log management startup script

LM=/opt/log-management/DataAcquisition/ruby/lm.rb
CONF=/opt/log-management/DataAcquisition/conf/config-prod.json

cd /opt/log-management/DataAcquisition/ruby

start() {

      su - logm -c "ruby $LM  -c $CONF -s"
}

stop() {

      su - logm -c "ruby $LM  -c $CONF -t"

}

restart() {

      su - logm -c "ruby $LM  -c $CONF -r"

}

status() {

      su - logm -c "ruby $LM  -c $CONF -p -q"

}

# See how we were called.
case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  status)
    status
    ;;
  restart)
	restart
	;;
  *)
	echo $"Usage: log_management {start|stop|restart|status}"
	
esac

exit 0
