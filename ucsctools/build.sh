date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/ucsctools:${date_string} .
docker tag shengqh/ucsctools:${date_string} shengqh/ucsctools:latest
