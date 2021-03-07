date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_chipseq:${date_string} .
docker build -t shengqh/cqs_chipseq:latest .
docker push shengqh/cqs_chipseq:${date_string}
docker push shengqh/cqs_chipseq:latest
