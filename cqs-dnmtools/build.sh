date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_dnmtools:${date_string} .
docker tag shengqh/cqs_dnmtools:${date_string} shengqh/cqs_dnmtools:latest
