date_string=`date +%Y%m%d`
docker push shengqh/cqs_bioconductor:${date_string}
docker push shengqh/cqs_bioconductor:latest
