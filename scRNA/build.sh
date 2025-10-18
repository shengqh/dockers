date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/cqs_scrnaseq:${date_string} .
docker image rm -f shengqh/cqs_scrnaseq:latest
docker tag shengqh/cqs_scrnaseq:${date_string} shengqh/cqs_scrnaseq:latest
