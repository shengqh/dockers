date_string=`date +%Y%m%d`
docker push shengqh/report:${date_string}
docker push shengqh/report:latest
