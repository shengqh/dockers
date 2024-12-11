date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/regenie4:${date_string} .
docker tag shengqh/regenie4:${date_string} shengqh/regenie4:latest
