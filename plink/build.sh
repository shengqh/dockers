date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/plink_1.9_2.0:${date_string} .
docker tag shengqh/plink_1.9_2.0:${date_string} shengqh/plink_1.9_2.0:latest
