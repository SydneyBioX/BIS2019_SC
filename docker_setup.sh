# docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
# sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
## All git files will then be copied to /home/SingleCellPlus/
mkdir /home/tmp/
git clone https://github.com/SydneyBioX/SC_CPC_workshop /home/tmp/
mkdir /home/CPC
cp -r /home/tmp/* /home/CPC/
# We will remove these data since we will have another copy from Google Cloud Storage
ls /home/
ls /home/CPC/

## wget all data files from Google Cloud Storage into /home/CPC/
wget https://storage.googleapis.com/scp_data/data.zip -P /home/CPC/
cd /home/CPC/ && unzip ./data.zip
rm -rf /home/CPC/__MACOSX
ls /home/
ls /home/CPC/