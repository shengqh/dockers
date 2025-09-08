date_string=`date +%Y%m%d`
docker_name='shengqh/debian12bookworm_r4.5.1_python3.13.7_java17.0.16_mono6.12.0.200'
docker buildx build --progress plain -t ${docker_name}:${date_string} .
docker tag ${docker_name}:${date_string} ${docker_name}:latest
