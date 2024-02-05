date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/gds:${date_string} .
docker tag shengqh/gds:${date_string} shengqh/gds:latest
