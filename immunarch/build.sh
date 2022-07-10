date_string=`date +%Y%m%d`
docker build -t shengqh/immunarch:${date_string} .
docker tag shengqh/immunarch:${date_string} shengqh/immunarch:latest
