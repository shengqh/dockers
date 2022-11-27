date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_rnaseq:${date_string} .
docker tag shengqh/cqs_rnaseq:${date_string} shengqh/cqs_rnaseq:latest
