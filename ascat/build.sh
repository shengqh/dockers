date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/ascat:${date_string} .
docker tag shengqh/ascat:${date_string} shengqh/ascat:latest
