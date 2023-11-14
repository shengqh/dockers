date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_dnmtools:${date_string} .
docker build -t shengqh/cqs_dnmtools:latest .
