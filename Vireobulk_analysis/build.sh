date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/vireobulk:${date_string} .
docker tag shengqh/vireobulk:${date_string} shengqh/vireobulk:latest
