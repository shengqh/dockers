date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/scdemultiplex:${date_string} .
docker tag shengqh/scdemultiplex:${date_string} shengqh/scdemultiplex:latest
