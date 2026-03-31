date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/intervar:${date_string} .
docker image rm -f shengqh/intervar:latest
docker tag shengqh/intervar:${date_string} shengqh/intervar:latest

