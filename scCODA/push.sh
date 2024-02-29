date_string=`date +%Y%m%d`
docker push shengqh/hail_gcp:${date_string}
docker push shengqh/hail_gcp:latest
