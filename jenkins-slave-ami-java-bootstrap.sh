#!/bin/bash

#install all packages
sudo yum -y update
sudo yum -y install git


sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn --version

#install java jdk
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
sudo yum -y localinstall jdk-8u60-linux-x64.rpm

sudo rm ~/jdk-8u60-linux-x64.rpm

#download slave.jar file
sudo wget -O /home/ec2-user/slave.jar https://github.com/hdharia/aws-bootstrap/blob/master/slave.jar?raw=true
