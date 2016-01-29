#!/bin/bash

#install all packages
sudo yum -y update
sudo yum -y install git
sudo yum -y install apache-maven

#install java jdk
sudo wget --no-cookies --no-check-certificate --header -O /home/ec2-user/jdk-8u60-linux-x64.rpm "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
sudo yum localinstall /home/ec2-user/jdk-8u60-linux-x64.rpm

sudo rm /home/ec2-user/jdk-8u60-linux-x64.rpm

#download slave.jar file
sudo wget -O /home/ec2-user/slave.jar https://github.com/hdharia/aws-bootstrap/blob/master/slave.jar?raw=true
