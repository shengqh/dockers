date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/bioinfo_base:${date_string} .
docker image rm -f shengqh/bioinfo_base:latest
docker tag shengqh/bioinfo_base:${date_string} shengqh/bioinfo_base:latest
