date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_encode:${date_string} .
docker build -t shengqh/cqs_encode:latest .
