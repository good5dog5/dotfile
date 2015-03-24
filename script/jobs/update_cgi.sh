#!/bin/sh
begin()
{
   printf "\n\n"
   echo "================================="
   echo "#      Begin update_cgi.sh       #"
   echo "================================="
   printf "\n\n"
}
show_rm_state()
{
   printf "%-8s %-18s %7s\n" "Remove" "$1"  "[done]"
}
show_ln_state()
{
   printf "%-8s %-18s %7s\n" "Link" "$1"  "[done]"
}

begin;

cd /www/cgi-bin/

printf "\n%s\n\n" "[ Begin remove old cgi ]"

rm admin.cgi                        && show_rm_state admin.cgi
rm buzr.cgi                         && show_rm_state buzr.cgi 
rm cgi_box                          && show_rm_state cgi_box
rm common.cgi                       && show_rm_state common.cgi
rm genfile.cgi                      && show_rm_state genfile.cgi
rm lan.cgi                          && show_rm_state lan.cgi
rm led.cgi                          && show_rm_state led.cgi
rm menu.cgi                         && show_rm_state menu.cgi
rm snmp.cgi                         && show_rm_state snmp.cgi
rm status.cgi                       && show_rm_state status.cgi
rm submit.cgi                       && show_rm_state submit.cgi
rm sysinfo.cgi                      && show_rm_state sysinfo.cgi
rm syslog.cgi                       && show_rm_state syslog.cgi
rm taskmanager.cgi                  && show_rm_state taskmanager.cgi
rm time.cgi                         && show_rm_state time.cgi
rm tools.cgi                        && show_rm_state tools.cgi
rm vlan.cgi                         && show_rm_state vlan.cgi
rm wlan.cgi                         && show_rm_state wlan.cgi

printf "\n%s\n\n" "[ Begin transfer new cgi_box ]"

tftp -g -r cgi_box 192.168.1.222
chmod 755 cgi_box

printf "\n%s\n\n" "[ Begin linking... ]"

ln -sf  cgi_box admin.cgi           && show_ln_state admin.cgi
ln -sf  cgi_box buzr.cgi            && show_ln_state bzur.cgi
ln -sf  cgi_box common.cgi          && show_ln_state common.cgi
ln -sf  cgi_box genfile.cgi         && show_ln_state genfile.cgi
ln -sf  cgi_box lan.cgi             && show_ln_state lan.cgi
ln -sf  cgi_box led.cgi             && show_ln_state led.cgi
ln -sf  cgi_box menu.cgi            && show_ln_state menu.cgi
ln -sf  cgi_box snmp.cgi            && show_ln_state snmp.cgi
ln -sf  cgi_box status.cgi          && show_ln_state status.cgi
ln -sf  cgi_box submit.cgi          && show_ln_state submit.cgi
ln -sf  cgi_box sysinfo.cgi         && show_ln_state sysinfo.cgi
ln -sf  cgi_box syslog.cgi          && show_ln_state syslog.cgi
ln -sf  cgi_box taskmanager.cgi     && show_ln_state taskmanager.cgi
ln -sf  cgi_box time.cgi            && show_ln_state time.cgi
ln -sf  cgi_box tools.cgi           && show_ln_state tools.cgi
ln -sf  cgi_box vlan.cgi            && show_ln_state vlan.cgi
ln -sf  cgi_box wlan.cgi            && show_ln_state wlan.cgi

printf "\n%s\n\n" "[ All done. ]"
