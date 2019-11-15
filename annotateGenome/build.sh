date_string=`date +%Y%m%d`
docker build -t shengqh/annogen:${date_string} .
docker build -t shengqh/annogen:latest .
docker push shengqh/annogen:${date_string}
docker push shengqh/annogen:latest
