date_string=`date +%Y%m%d`
docker_name='shengqh/debian12bookworm_r4.4.1_python3.12.4_java17.0.11_mono6.12.0.200'
docker push ${docker_name}:${date_string}
docker push ${docker_name}:latest
