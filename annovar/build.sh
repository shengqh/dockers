date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/annovar:${date_string} .
docker tag shengqh/annovar:${date_string} shengqh/annovar:latest
