date_string=`date +%Y%m%d`
docker_name='shengqh/twist_methylation'
docker buildx build --progress plain -t ${docker_name}:${date_string} .
docker tag ${docker_name}:${date_string} ${docker_name}:latest
