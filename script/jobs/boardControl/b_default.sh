#!/bin/bash

# Load function and variables
. /tftpboot/scripts/boardControl/util.sh

Tcmd "rm /storage/db*"
Tcmd "reboot" $wait_reboot
Tcmd "$pass"
Tcmd "cd /storage/scripts/"
#Tcmd "./init.sh" $wait_init
Tcmd "start_all"

