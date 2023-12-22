date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/report:${date_string} .
docker tag shengqh/report:${date_string} shengqh/report:latest
