This file contain command/variable discription and informaiton i used in shell script

[set]
# Exit immediately if a command exits with a non-zero status.
set -o errexit
# The return value of a pipeline is the status of the last command to exit with a non-zero status, or zero if no command exited with a non-zero status
# See http://blog.csdn.net/t0nsha/article/details/8606886
set -o pipefail
# Treat unset variables as an error when substituting.
set -o nounset

[meta] info to write robust shell script
http://kvz.io/blog/2013/11/21/bash-best-practices/

[special variable]
    $1, $2, $3, ... are the positional parameters.
    "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
    "$*" is the IFS expansion of all positional parameters, $1 $2 $3 ....
    $# is the number of positional parameters.
    $- current options set for the shell.
    $$ pid of the current shell (not subshell).
    $_ most recent parameter (or the abs path of the command to start the current shell immediately after startup).
    $IFS is the (input) field separator.
    $? is the most recent foreground pipeline exit status.
    $! is the PID of the most recent background command.
    $0 is the name of the shell or shell script.
