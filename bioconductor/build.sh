date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/cqs_bioconductor_3_21_r451:${date_string} .
docker tag shengqh/cqs_bioconductor_3_21_r451:${date_string} shengqh/cqs_bioconductor_3_21_r451:latest
