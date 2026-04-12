date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/cqs_rstudio:${date_string} .
docker image rm -f shengqh/cqs_rstudio:latest
docker tag shengqh/cqs_rstudio:${date_string} shengqh/cqs_rstudio:latest
