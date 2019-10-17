date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_rnaseq:${date_string} .
docker build -t shengqh/cqs_rnaseq:latest .
docker push shengqh/cqs_rnaseq:${date_string}
docker push shengqh/cqs_rnaseq:latest
