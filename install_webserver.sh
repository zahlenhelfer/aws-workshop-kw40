#!/bin/bash
yum install httpd -y
/sbin/chkconfig --levels 235 httpd on
service httpd start