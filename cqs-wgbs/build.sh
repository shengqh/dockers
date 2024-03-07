date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_wgbs:${date_string} .
docker tag shengqh/cqs_wgbs:${date_string} shengqh/cqs_wgbs:latest
