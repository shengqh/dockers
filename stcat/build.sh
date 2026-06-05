date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/stcat:${date_string} .
docker tag shengqh/stcat:${date_string} shengqh/stcat:latest
