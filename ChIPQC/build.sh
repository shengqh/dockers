date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_chipqc:${date_string} .
docker build -t shengqh/cqs_chipqc:latest .