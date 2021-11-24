date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_smallrnaseq:${date_string} .
docker build -t shengqh/cqs_smallrnaseq:latest .
docker push shengqh/cqs_smallrnaseq:${date_string}
docker push shengqh/cqs_smallrnaseq:latest
