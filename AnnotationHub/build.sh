date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/annotationhub:${date_string} .
docker tag shengqh/annotationhub:${date_string} shengqh/annotationhub:latest
