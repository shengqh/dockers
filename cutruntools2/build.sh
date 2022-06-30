date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cutruntools2:${date_string} .
docker tag shengqh/cutruntools2:${date_string} shengqh/cutruntools2:latest
