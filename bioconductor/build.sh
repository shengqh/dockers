date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_bioconductor_3_18:${date_string} .
docker tag shengqh/cqs_bioconductor_3_18:${date_string} shengqh/cqs_bioconductor_3_18:latest
