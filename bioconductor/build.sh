date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_bioconductor_3_20_r442:${date_string} .
docker tag shengqh/cqs_bioconductor_3_20_r442:${date_string} shengqh/cqs_bioconductor_3_20_r442:latest
