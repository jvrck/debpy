#!/usr/bin/env bash
set -ex

# Update apt 
apt-get update && apt-get upgrade -y ;

UNISTALL=""

if ! dpkg -s curl ;
then
    apt-get install -y curl ;
    UNISTALL="curl"
fi

if ! dpkg -s unzip ;
then
    apt-get install -y unzip ;
    UNISTALL="$UNISTALL unzip"
fi

# Download and install AWS CLI. Clean up after installation.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" ;
unzip awscliv2.zip ;
./aws/install ;
rm -rf aws ;
rm -rf awscliv2.zip ;

if [ "$UNISTALL" != "" ] ;
then
    apt-get remove -y $UNISTALL ;
fi

# Clean up apt cache
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;