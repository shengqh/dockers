date_string=`date +%Y%m%d`
docker build -t shengqh/glimpse:${date_string} .
docker build -t shengqh/glimpse:latest .
