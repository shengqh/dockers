date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_exomeseq:${date_string} .
docker build -t shengqh/cqs_exomeseq:latest .
