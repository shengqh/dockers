date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_scrnaseq:${date_string} .
docker build -t shengqh/cqs_scrnaseq:latest .
docker push shengqh/cqs_scrnaseq:${date_string}
docker push shengqh/cqs_scrnaseq:latest
