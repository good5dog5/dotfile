#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------

# Load function and variables
. /tftpboot/scripts/boardControl/util.sh 

Tcmd "reboot" $wait_reboot

Tcmd "$pass" 

Tcmd "cd /storage/scripts/" 
#Tcmd "./init.sh" $wait_init

Tcmd "start_all " $wait_start_all

Tcmd "./setup.sh" $wait_setup
