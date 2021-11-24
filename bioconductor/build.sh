date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_bioconductor:${date_string} .
docker build -t shengqh/cqs_bioconductor:latest .
