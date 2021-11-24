date_string=`date +%Y%m%d`
docker build -t shengqh/r4:${date_string} .
docker build -t shengqh/r4:latest .
