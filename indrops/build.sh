date_string=`date +%Y%m%d`
docker build -t shengqh/indrops:${date_string} .
docker build -t shengqh/indrops:latest .
docker push shengqh/indrops:${date_string}
docker push shengqh/indrops:latest
