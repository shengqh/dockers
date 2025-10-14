date_string=`date +%Y%m%d`
docker_name='shengqh/twist_methylation'
docker push ${docker_name}:${date_string}
docker push ${docker_name}:latest
