date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_souporcell:${date_string} .
docker tag shengqh/cqs_souporcell:${date_string} shengqh/cqs_souporcell:latest
