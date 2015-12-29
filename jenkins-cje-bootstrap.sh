#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install  ec2-api-tools
sudo apt-get -y install awscli

#set AWS Credentials
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=

#attach volume
aws ec2 detach-volume --volume-id VOL_ID --force

sleep 5

aws ec2 attach-volume --volume-id VOL_ID --instance $(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id) --device /dev/sdf

sleep 5

#mount abs filesystem
#Create mount directory
sudo mkdir /mnt/ebs
#create filesystem
#sudo mkfs -t ext4 /dev/xvdf
sudo mount /dev/xvdf /mnt/ebs

#stop jenkins service
sudo service jenkins stop
sleep 5
#mv jenkins home
sudo mv /var/lib/jenkins /var/lib/jenkins.bak

#create symbolic link
cd /var/lib
sudo ln -s /mnt/ebs/jenkins jenkins

#change permission
sudo chown jenkins:jenkins jenkins

sudo service jenkins start