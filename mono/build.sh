date_string=`date +%Y%m%d`
docker build -t shengqh/mono:${date_string} .
docker build -t shengqh/mono:latest .
docker push shengqh/mono:${date_string}
docker push shengqh/mono:latest
