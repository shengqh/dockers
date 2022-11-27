date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_chipqc:${date_string} .
docker tag shengqh/cqs_chipqc:${date_string} shengqh/cqs_chipqc:latest
