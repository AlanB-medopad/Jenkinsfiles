#!/bin/bash
DEV_EU_ROLE="arn:aws:iam::308745594398:role/dev.epigenome.medopad.com-role-eu-west-1"
ROLE_SESSION_NAME="epigenome-role-eu-west-1"
apt-get update -y 
export DEBIAN_FRONTEND=noninteractive
apt-get install -y tzdata
ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt-get install awscli -y
set +x
mkdir ~/.aws
touch ~/.aws/credentials
echo -e [default] >> ~/.aws/credentials 
aws sts assume-role --role-arn ${DEV_EU_ROLE} \
        --role-session-name ${ROLE_SESSION_NAME} | \
        grep -w 'AccessKeyId\|SecretAccessKey\|SessionToken' | \
        awk '{print $2}' | sed 's/\"//g;s/\,//'  > awscre;\
        echo -e aws_access_key_id =`sed -n '1p' awscre` >> ~/.aws/credentials |\
        echo -e aws_secret_access_key =`sed -n '2p' awscre` >> ~/.aws/credentials |\
        echo -e aws_security_token =`sed -n '3p' awscre` >> ~/.aws/credentials |\
set -x

echo $(aws s3 ls s3://dev.epigenome.medopad.com.eu-west-1.medopad-dev) >> medopad-dev-eu

