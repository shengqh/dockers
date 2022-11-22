date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_bioconductor:${date_string} .
docker tag shengqh/cqs_bioconductor:${date_string} shengqh/cqs_bioconductor:latest
