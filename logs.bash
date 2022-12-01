cd 
mkdir Logs
cp /var/log/*.log ./Logs/
echo '-----'
tar -czf Logs/logs.tar.gz -C Logs ./
rm ./Logs/*.log
echo '-----'
ls Logs
