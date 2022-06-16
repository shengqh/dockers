date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_smallrnaseq:${date_string} .
docker tag shengqh/cqs_smallrnaseq:${date_string} shengqh/cqs_smallrnaseq:latest
