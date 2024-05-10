date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_bioconductor_3_19:${date_string} .
docker tag shengqh/cqs_bioconductor_3_19:${date_string} shengqh/cqs_bioconductor_3_19:latest
