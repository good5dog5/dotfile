#!/usr/bin/python
import unittest
import subprocess
import time
from selenium import webdriver

browser = webdriver.Firefox()
browser.get("http://admin:airlive@192.168.1.254/wan_static.html")


#browser.switch_to_frame(browser.find_element_by_tag_name("iframe"))
ip      = browser.find_element_by_name("ip")
mask    = browser.find_element_by_name("mask")
gateway = browser.find_element_by_name("gateway")
dns1    = browser.find_element_by_name("dns1")
#dns2    = browser.find_element_by_name("dns2")


en_upnp      = browser.find_element_by_name("upnpEnable");
en_ipAccess  = browser.find_element_by_name("IpAccessEnable");
en_IPSECPass = browser.find_element_by_name("IPSECPassEnable");
en_PPTPPass  = browser.find_element_by_name("PPTPPassEnable");
en_L2TPPass  = browser.find_element_by_name("L2TPPassEnable");

textInput = [ip, mask, gateway, dns1]
checkbox = [en_upnp, en_IPSECPass, en_ipAccess, en_PPTPPass, en_L2TPPass]

for unit in textInput:
    unit.clear()


ip.send_keys("192.168.3.2")
mask.send_keys("255.255.255.0")
gateway.send_keys("192.168.3.222")
dns1.send_keys("192.168.3.8")

for unit in checkbox:
    if not unit.is_selected():
        unit.click()


submit = browser.find_element_by_name("save")
#submit.click()
#time.sleep(30)
#browser.quit()
