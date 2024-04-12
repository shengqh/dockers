date_string=`date +%Y%m%d`
docker push shengqh/biobakery_workflows:${date_string}
docker push shengqh/biobakery_workflows:latest
