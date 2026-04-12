date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/cqs_rnaseq:${date_string} .
docker image rm -f shengqh/cqs_rnaseq:latest
docker tag shengqh/cqs_rnaseq:${date_string} shengqh/cqs_rnaseq:latest

