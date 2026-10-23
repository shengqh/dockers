date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/regenie:4.1.3.1 .
docker tag shengqh/regenie:4.1.3.1 shengqh/regenie:latest
