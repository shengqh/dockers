date_string=`date +%Y%m%d`
docker build -t shengqh/dropest2:${date_string} .
docker build -t shengqh/dropest2:latest .
docker push shengqh/dropest2:${date_string}
docker push shengqh/dropest2:latest
