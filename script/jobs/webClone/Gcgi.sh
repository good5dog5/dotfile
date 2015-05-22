#!/bin/bash
#--------------------------------------------------------------------
CGI[0]="admin.cgi"       
CGI[1]="advancd.cgi"      
CGI[2]="buzr.cgi"         
CGI[3]="cgi_box"          
CGI[4]="common.cgi"       
CGI[5]="dhcp_mac_2_ip.cgi"
CGI[6]="firewall.cgi"     
CGI[7]="genfile.cgi"      
CGI[8]="lan.cgi"          
CGI[9]="led.cgi"          
CGI[10]="menu.cgi"         
CGI[11]="nms.cgi"          
CGI[12]="nms_set.cgi"      
CGI[13]="snmp.cgi"         
CGI[14]="status.cgi"       
CGI[15]="stp.cgi"          
CGI[16]="submit.cgi"       
CGI[17]="sysinfo.cgi"      
CGI[18]="syslog.cgi"       
CGI[19]="taskmanager.cgi"  
CGI[20]="time.cgi"         
CGI[21]="tools.cgi"        
CGI[22]="vlan.cgi"         
CGI[23]="wan.cgi"          
CGI[24]="wlan.cgi"         

getCgi() {
    local IP="192.168.2.2"
    local USER="admin"
    local PASS="1234"

    curl --digest -u "$USER:$PASS" http://$IP/cgi-bin/$1
}
mkdir cgi-bin

for c in ${CGI[@]}; do
    getCgi $c | jq '.' > ./cgi-bin/$c
done
    
