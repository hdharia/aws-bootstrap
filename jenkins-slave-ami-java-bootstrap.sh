#!/bin/bash

#install all packages
sudo yum -y update
sudo yum -y install git
sudo yum -y install apache-maven

#download slave.jar file
wget -O slave.jar https://github.com/hdharia/aws-bootstrap/blob/master/slave.jar?raw=true
