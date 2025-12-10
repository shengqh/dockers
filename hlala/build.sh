date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/hlala:${date_string} .
docker image rm -f shengqh/hlala:latest
docker tag shengqh/hlala:${date_string} shengqh/hlala:latest