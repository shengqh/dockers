date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/scenicplus:${date_string} .
docker image rm -f shengqh/scenicplus:latest
docker tag shengqh/scenicplus:${date_string} shengqh/scenicplus:latest

