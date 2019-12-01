#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/BIS2019_SC /home/gittmp/
## wget all data files from Google Cloud Storage into /home/CPC/
wget https://storage.googleapis.com/scp_data/data.zip -P /home/gittmp/
cd /home/gittmp/ && unzip ./data.zip
rm -rf /home/gittmp/__MACOSX
rm -rf /home/gittmp/data.zip
ls /home/
ls /home/gittmp/

## Set up users

sudo groupadd trainees

for((userIndex = 1; userIndex <= 50; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2019 | sudo chpasswd
}
done