#!/usr/bin/env python

import os
import sys
import subprocess

def mail_passwd(acct):
  acct = os.path.basename(acct)
  path = "/home/jordan/.passwd/%s.gpg" % acct
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return subprocess.check_output(args).strip()
  except subprocess.CalledProcessError:
    return ""
