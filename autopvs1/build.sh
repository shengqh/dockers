date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/autopvs1:${date_string} .
docker image rm -f shengqh/autopvs1:latest
docker tag shengqh/autopvs1:${date_string} shengqh/autopvs1:latest

