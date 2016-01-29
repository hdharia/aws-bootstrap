#!/bin/bash

#install all packages
yum -y update
yum -y install git
yum -y install apache-maven

#download slave.jar file
wget -O /home/ec2-user/slave.jar https://github.com/hdharia/aws-bootstrap/blob/master/slave.jar?raw=true
