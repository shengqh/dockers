date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/my_sum:${date_string} .
docker tag shengqh/my_sum:${date_string} shengqh/my_sum:latest
