date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_correlation:${date_string} .
docker tag shengqh/cqs_correlation:${date_string} shengqh/cqs_correlation:latest
