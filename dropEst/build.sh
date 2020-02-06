date_string=`date +%Y%m%d`
docker build -t shengqh/dropest:${date_string} .
docker build -t shengqh/dropest:latest .
docker push shengqh/dropest:${date_string}
docker push shengqh/dropest:latest
