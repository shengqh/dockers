date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/fgsea:${date_string} .
docker image rm -f shengqh/fgsea:latest
docker tag shengqh/fgsea:${date_string} shengqh/fgsea:latest

