date_string=`date +%Y%m%d`
docker build -t shengqh/cqs-mageck:${date_string} .
docker build -t shengqh/cqs-mageck:latest .
docker push shengqh/cqs-mageck:${date_string}
docker push shengqh/cqs-mageck:latest
