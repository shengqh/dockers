date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/mofa2:${date_string} .
docker tag shengqh/mofa2:${date_string} shengqh/mofa2:latest
