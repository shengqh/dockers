date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/hail_gcp:${date_string} .
docker tag shengqh/hail_gcp:${date_string} shengqh/hail_gcp:latest
