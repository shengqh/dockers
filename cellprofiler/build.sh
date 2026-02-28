date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/cellprofiler:${date_string} .
docker image rm -f shengqh/cellprofiler:latest
docker tag shengqh/cellprofiler:${date_string} shengqh/cellprofiler:latest

