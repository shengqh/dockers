date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/r4:${date_string} .
docker tag shengqh/r4:${date_string} shengqh/r4:latest
