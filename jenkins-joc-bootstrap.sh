#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install  ec2-api-tools
sudo apt-get -y install awscli

#set AWS Credentials
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1

#attach volume
aws ec2 detach-volume --volume-id VOL_ID  --force

sleep 10

aws ec2 attach-volume --volume-id VOL_ID --instance $(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id) --device /dev/sdf

sleep 10

#mount abs filesystem
#Create mount directory
sudo mkdir /mnt/ebs
#create filesystem
#sudo mkfs -t ext4 /dev/xvdf
sudo mount /dev/xvdf /mnt/ebs

#stop jenkins-oc service
sudo service jenkins-oc stop
sleep 10
#mv jenkins home
sudo mv /var/lib/jenkins-oc /var/lib/jenkins-oc.bak

#create symbolic link
cd /var/lib
sudo ln -s /mnt/ebs/jenkins jenkins-oc

#change permission
sudo chown jenkins-oc:jenkins-oc jenkins-oc

sudo service jenkins-oc start