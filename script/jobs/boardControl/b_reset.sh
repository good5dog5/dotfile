#!/bin/sh

# Load function and variables
source /tftpboot/scripts/boardControl/util.sh

Tcmd "cd /storage/scripts/"
Tcmd "sh board_reset.sh"
