date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_bioconductor_20221018:${date_string} .
docker tag shengqh/cqs_bioconductor_20221018:${date_string} shengqh/cqs_bioconductor_20221018:latest
