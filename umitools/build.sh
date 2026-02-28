date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/umitools:${date_string} .
docker image rm -f shengqh/umitools:latest
docker tag shengqh/umitools:${date_string} shengqh/umitools:latest